import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  final String image;
  final String title;
  final IconData? icon;
  final VoidCallback onPressed;
  final double borderRadius;

  const CustomButton({
    Key? key,
    required this.image,
    required this.title,
    required this.onPressed,
    this.icon,
    this.borderRadius = 12.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        side: const BorderSide(
          color: Color(0xffDFE1E7),
          width: 1.5
        ),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(image),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xff201F2E),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          if (icon != null) Icon(icon, color: Color(0xff4A4C56)),
        ],
      ),
    );
  }
}
