import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:anytime_todo_app/common/constants/t_sizes.dart';
import 'package:anytime_todo_app/common/helpers/device_utilities_extensions.dart';
import 'package:anytime_todo_app/common/widgets/buttons/t_outlined_button.dart';

class TAnimationLoaderWidget extends StatelessWidget {
  const TAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation, width: context.screenWidth * 0.8),
          const SizedBox(height: TSizes.defaultSpace),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: TSizes.defaultSpace),
          showAction
              ? SizedBox(
                  width: 250,
                  child: TOutlinedButton(
                    onPressed: onActionPressed ?? () {},
                    text: actionText ?? '',
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
