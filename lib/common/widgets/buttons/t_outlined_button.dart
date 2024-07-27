import 'package:flutter/material.dart';
import 'package:anytime_todo_app/common/constants/app_colors.dart';

class TOutlinedButton extends StatelessWidget {
  const TOutlinedButton({
    super.key,
    this.foregroundColor = AppColors.primary,
    this.borderSideColor = AppColors.primary,
    this.textColor = AppColors.primary,
    required this.text,
    required this.onPressed,
  });

  final Color? foregroundColor;
  final Color? borderSideColor;
  final Color? textColor;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor:
                foregroundColor, //AppColors.error, // Buton yazı rengi
            side: BorderSide(
                color: borderSideColor!), // Buton Kenar kalınlığı rengi,
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          )),
    );
  }
}
