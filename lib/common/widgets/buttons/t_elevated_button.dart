import 'package:anytime_todo_app/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TElevatedButton extends StatelessWidget {
  const TElevatedButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.backgroundColor = AppColors.primary,
    this.textColor = AppColors.white,
  });

  final Color? backgroundColor;
  final Color? textColor;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
