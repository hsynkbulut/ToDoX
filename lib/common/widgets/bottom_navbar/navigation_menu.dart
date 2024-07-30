import 'package:anytime_todo_app/common/constants/app_colors.dart';
import 'package:anytime_todo_app/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = context.isDarkMode;
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: darkMode ? AppColors.black : AppColors.white,
          indicatorColor: darkMode
              ? AppColors.white.withOpacity(0.1)
              : AppColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Anasayfa'),
            NavigationDestination(
              icon: Icon(Iconsax.add_square5),
              label: 'Ekle',
            ),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Hesabım'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    // Container(color: Colors.green),
    const HomeScreen(),
    Container(color: Colors.purple),
    Container(color: Colors.orange),
  ];
}
