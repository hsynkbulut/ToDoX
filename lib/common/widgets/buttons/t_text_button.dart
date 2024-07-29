import 'package:anytime_todo_app/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TTextButton extends StatelessWidget {
  const TTextButton({
    super.key,
    this.overlayColor = AppColors.dark,
    this.foregroundColor = AppColors.dark,
    required this.text,
    required this.onPressed,
  });

  final Color? overlayColor;
  final Color? foregroundColor;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            overlayColor:
                WidgetStateProperty.all(overlayColor!.withOpacity(0.1)),
            foregroundColor: WidgetStateProperty.all(foregroundColor)),
        onPressed: onPressed,
        child: Text(text));
  }
}
