import 'package:anytime_todo_app/common/constants/app_colors.dart';
import 'package:anytime_todo_app/common/helpers/theme_utilities_extensions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomTextFormField extends StatefulWidget {
  final TextInputType keyboardType;
  final String labelText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final bool showCounter;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    required this.keyboardType,
    required this.labelText,
    required this.prefixIcon,
    this.suffixIcon,
    this.maxLength,
    this.minLines,
    this.maxLines,
    this.showCounter = false,
    this.controller,
    this.obscureText = false,
    this.validator,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isObscured = true;
  IconData _currentSuffixIcon = Iconsax.eye_slash;

  void toggleObscureText() {
    setState(() {
      _isObscured = !_isObscured;
      _currentSuffixIcon = _isObscured ? Iconsax.eye_slash : Iconsax.eye;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = context.isDarkMode;
    return TextFormField(
      validator: widget.validator,
      obscureText: widget.obscureText && _isObscured,
      controller: widget.controller,
      maxLength: widget.maxLength,
      buildCounter: (context,
          {required currentLength, required maxLength, required isFocused}) {
        final text = '$currentLength/$maxLength';
        if (widget.showCounter) {
          return Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: WidgetStateColor.resolveWith((states) =>
                    dark ? AppColors.whiteColor : AppColors.primaryColor)),
          );
        } else {
          return const SizedBox(height: 0.0);
        }
      },
      minLines: widget.minLines,
      maxLines: widget.obscureText ? 1 : widget.maxLines,
      expands: false,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        floatingLabelStyle:
            Theme.of(context).inputDecorationTheme.floatingLabelStyle,
        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
        focusedBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        labelText: widget.labelText,
        prefixIcon: Icon(widget.prefixIcon),
        suffixIcon: widget.suffixIcon != null
            ? GestureDetector(
                onTap: () {
                  if (widget.suffixIcon == Iconsax.eye_slash ||
                      widget.suffixIcon == Iconsax.eye) {
                    toggleObscureText();
                  }
                },
                child: Icon(_currentSuffixIcon),
              )
            : null,
      ),
    );
  }
}
