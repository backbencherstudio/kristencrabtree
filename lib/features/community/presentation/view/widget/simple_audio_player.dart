import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimpleAudioPlayer extends StatefulWidget {
  final String audioUrl;
  const SimpleAudioPlayer({super.key, required this.audioUrl});

  @override
  State<SimpleAudioPlayer> createState() => _SimpleAudioPlayerState();
}

class _SimpleAudioPlayerState extends State<SimpleAudioPlayer> {
  late AudioPlayer _player;
  bool _isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();

    /// Immediately prepare for playback (low-latency mode)
    _player.setAudioSource(AudioSource.uri(Uri.parse(widget.audioUrl))).then((_) {
      setState(() {
        _duration = _player.duration ?? Duration.zero;
      });
    });

    _player.playerStateStream.listen((state) async {
      if (!mounted) return;

      if (state.processingState == ProcessingState.completed) {
        await _player.seek(Duration.zero);
        await _player.pause();
        setState(() => _isPlaying = false);
      } else {
        setState(() => _isPlaying = state.playing);
      }
    });

    _player.positionStream.listen((pos) {
      if (mounted) {
        setState(() => _position = pos);
      }
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  String _formatDuration(Duration d) {
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: const Color(0xFFFBF8F0),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          /// --- Play / Pause Button ---
          GestureDetector(
            onTap: () async {
              if (_isPlaying) {
                await _player.pause();
              } else {
                await _player.play();
              }
            },
            child: Container(
              width: 36.w,
              height: 36.w,
              decoration: BoxDecoration(
                color: const Color(0xFFBFA15C),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                _isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.white,
                size: 22.sp,
              ),
            ),
          ),

          SizedBox(width: 10.w),

          /// --- Constant Waveform ---
          Expanded(
            child: CustomPaint(
              painter: StaticWaveformPainter(
                progress: _duration.inMilliseconds == 0
                    ? 0
                    : _position.inMilliseconds / _duration.inMilliseconds,
              ),
              size: Size(double.infinity, 36.h),
            ),
          ),

          SizedBox(width: 10.w),

          /// --- Duration Display ---
          Text(
            '${_formatDuration(_position)} / ${_formatDuration(_duration)}',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}

/// A simple static waveform with progress fill.
class StaticWaveformPainter extends CustomPainter {
  final double progress;
  StaticWaveformPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final totalBars = 40;
    final barWidth = 3.5;
    final spacing = 5.0;
    final centerY = size.height / 2;

    final livePaint = Paint()
      ..color = const Color(0xFFBFA15C)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = barWidth;

    final fixedPaint = Paint()
      ..color = const Color(0xFFBFA15C).withOpacity(0.3)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = barWidth;

    final progressX = progress * size.width;

    for (int i = 0; i < totalBars; i++) {
      final x = i * (barWidth + spacing) + barWidth / 2;
      if (x > size.width) break;

      // --- Uneven height generation ---
      final noise = (sin(i * 1.3) + cos(i * 0.7) + sin(i * 0.5)) / 3;
      final normalized = (noise + 1) / 2;
      final heightFactor = 0.25 + normalized * 0.75;
      final barHeight = heightFactor * size.height;

      final top = centerY - barHeight / 2;
      final bottom = centerY + barHeight / 2;

      final paint = x <= progressX ? livePaint : fixedPaint;

      canvas.drawLine(Offset(x, top), Offset(x, bottom), paint);
    }
  }

  @override
  bool shouldRepaint(covariant StaticWaveformPainter old) =>
      old.progress != progress;
}
