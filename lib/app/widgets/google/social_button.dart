import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String text;
  final String assetName; // path to logo asset (SVG or PNG)
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  final Color? borderColor;

  const SocialButton({
    super.key,
    required this.text,
    required this.assetName,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          side: BorderSide(color: borderColor ?? Colors.transparent, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              assetName,
              height: 24,
              width: 24,
              color: text == "Continue with Apple" ? Colors.black : null,
            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
