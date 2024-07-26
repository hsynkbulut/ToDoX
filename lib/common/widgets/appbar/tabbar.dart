import 'package:flutter/material.dart';
import 'package:anytime_todo_app/common/constants/app_colors.dart';
import 'package:anytime_todo_app/common/helpers/t_device_utility.dart';
import 'package:anytime_todo_app/common/helpers/theme_utilities_extensions.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode;
    return Material(
      color: isDarkMode ? AppColors.black : AppColors.whiteColor,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: AppColors.primaryColor,
        labelColor: isDarkMode ? AppColors.whiteColor : AppColors.primaryColor,
        unselectedLabelColor: AppColors.darkGrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
