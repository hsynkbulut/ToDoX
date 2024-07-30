import 'package:anytime_todo_app/common/constants/app_colors.dart';
import 'package:anytime_todo_app/common/helpers/device_utilities_extensions.dart';
import 'package:anytime_todo_app/common/helpers/t_device_utility.dart';
import 'package:flutter/material.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.leadingOnPressed,
    this.iconColor = AppColors.white,
    this.showBackArrow = false,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final width = context.screenHeight;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.01), //TSizes.md
      child: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                onPressed: () {
                  if (leadingOnPressed != null) {
                    leadingOnPressed!();
                  } else {
                    Navigator.pop(
                      context,
                    ); // Get.back() yerine Navigator.pop kullanıldı
                  }
                },
                icon: Icon(Icons.arrow_back_ios_new_rounded, color: iconColor),
              )
            : leadingIcon != null
                ? IconButton(
                    onPressed: leadingOnPressed,
                    icon: Icon(leadingIcon),
                  )
                : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
