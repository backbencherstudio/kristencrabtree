import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import '../../../../../app/widgets/cards/custom_card_base.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../gen/assets.gen.dart';

class AudioRecordingWidget extends StatefulWidget {
  const AudioRecordingWidget({super.key});

  @override
  State<AudioRecordingWidget> createState() => _AudioRecordingWidgetState();
}

class _AudioRecordingWidgetState extends State<AudioRecordingWidget>
    with SingleTickerProviderStateMixin {
  final AudioRecorder _recorder = AudioRecorder();
  final AudioPlayer _player = AudioPlayer();

  bool _isRecording = false;
  bool _isPlaying = false;
  String? _recordingPath;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    /// Initialize animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Listen for playback changes
    _player.playerStateStream.listen((state) async {
      final playing = state.playing;
      final completed = state.processingState == ProcessingState.completed;

      if (completed) {
        await _player.stop();
        if (mounted) {
          setState(() => _isPlaying = false);
        }
        return;
      }

      if (mounted) {
        setState(() => _isPlaying = playing);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _player.dispose();
    _recorder.dispose();
    super.dispose();
  }

  Future<void> _toggleRecording() async {
    if (_isRecording) {
      final path = await _recorder.stop();
      if (path != null) {
        _controller.stop();
        setState(() {
          _isRecording = false;
          _recordingPath = path;
        });
      }
    } else {
      if (await _recorder.hasPermission()) {
        final dir = await getApplicationDocumentsDirectory();
        final filePath = p.join(dir.path, 'recording.m4a');
        await _recorder.start(
          RecordConfig(
            encoder: AudioEncoder.aacLc,
            bitRate: 128000,
            sampleRate: 44100,
          ),
          path: filePath,
        );
        _controller.repeat(); // start wave animation
        setState(() {
          _isRecording = true;
          _recordingPath = null;
        });
      }
    }
  }

  Future<void> _togglePlayback() async {
    if (_recordingPath == null) return;

    if (_isPlaying) {
      await _player.pause();
      setState(() => _isPlaying = false);
    } else {
      if (_player.processingState == ProcessingState.idle ||
          _player.processingState == ProcessingState.completed) {
        await _player.setFilePath(_recordingPath!);
      } else if (_player.processingState == ProcessingState.ready) {
        await _player.seek(Duration.zero);
      }

      await _player.play();
      setState(() => _isPlaying = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// --- Record Button ---
        CustomCardBase(
          borderColor: Colors.black12,
          child: Column(
            spacing: 10.h,
            children: [
              GestureDetector(
                onTap: _toggleRecording,
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Container(
                      height: 70.h,
                      width: 70.h,
                      alignment: Alignment.center,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 70.h,
                            width: 70.h,
                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(.3),
                              shape: BoxShape.circle
                            ),
                          ),
                          // --- White ripple wave animation ---
                          if (_isRecording)
                            Container(
                              height: 60.h + (_controller.value * 60.h),
                              width: 60.h + (_controller.value * 60.h),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(
                                  (1 - _controller.value) * 0.4,
                                ),
                              ),
                            ),

                          // --- Main Record button ---
                          Container(
                            height: 48.w,
                            width: 48.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _isRecording
                                  ? Colors.red.withOpacity(0.2)
                                  : AppColors.primary.withOpacity(0.2),
                            ),
                            child: SvgPicture.asset(
                              Assets.icons.record,
                              height: 48.w,
                              width: 48.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Text(
                _isRecording ? 'Recording...' : 'Tap to Record',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: _isRecording ? Colors.red : Colors.black87,
                ),
              ),
              Text(
                'Premium Feature',
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 8.h),

        /// --- Play / Pause Button ---
        if (_recordingPath != null)
          GestureDetector(
            onTap: _togglePlayback,
            child: CustomCardBase(
              borderColor: Colors.black12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    color: AppColors.primary,
                    size: 20.w,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    _isPlaying ? 'Pause' : 'Play',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          )
        else
          Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Text(
              _isRecording ? 'Recording in progress...' : 'No recording yet.',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.black54,
              ),
            ),
          ),
      ],
    );
  }
}
