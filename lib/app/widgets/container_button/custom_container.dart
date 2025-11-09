import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomToggleContainer extends StatefulWidget {
  final String title;
  final bool showSwitch;
  final bool showText;
  final bool initialSwitchValue;
  final Function(bool)? onSwitchChanged;
  final double borderRadius;
  final Color borderColor;
  final Color backgroundColor;
  final VoidCallback? onArrowTap;
  final VoidCallback? onPressed;
  final String? rightText;

  const CustomToggleContainer({
    Key? key,
    required this.title,
    this.showSwitch = false,
    this.showText = false,
    this.initialSwitchValue = false,
    this.onSwitchChanged,
    this.borderRadius = 12.0,
    this.borderColor = const Color(0xffC6A664),
    this.backgroundColor = Colors.white,
    this.onArrowTap,
    this.onPressed,
    this.rightText,
  }) : super(key: key);

  @override
  State<CustomToggleContainer> createState() => _CustomToggleContainerState();
}

class _CustomToggleContainerState extends State<CustomToggleContainer> {
  late bool switchValue;

  @override
  void initState() {
    super.initState();
    switchValue = widget.initialSwitchValue;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      borderRadius: BorderRadius.circular(widget.borderRadius),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: Border.all(color: widget.borderColor, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Title
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xff201F2E),
              ),
            ),

            if (widget.showSwitch)
              Switch(
                value: switchValue,
                activeColor: Colors.white,
                inactiveThumbColor: Colors.black54,
                activeTrackColor: const Color(0xffC6A664),
                onChanged: (value) {
                  setState(() => switchValue = value);
                  widget.onSwitchChanged?.call(value);
                },
              )
            else if (widget.showText && widget.rightText != null)
              Text(
                widget.rightText!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff777980),
                ),
              )
            else
              GestureDetector(
                onTap:  widget.onArrowTap,
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios,
                      size: 20, color: Colors.black),
                  onPressed: widget.onArrowTap ?? widget.onPressed,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
