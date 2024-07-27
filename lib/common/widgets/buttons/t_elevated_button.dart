import 'package:flutter/material.dart';
import 'package:anytime_todo_app/common/constants/app_colors.dart';

class TElevatedButton extends StatelessWidget {
  const TElevatedButton({
    super.key,
    this.backgroundColor = AppColors.primary,
    this.textColor = AppColors.white,
    required this.text,
    required this.onPressed,
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
          )),
    );
  }
}
