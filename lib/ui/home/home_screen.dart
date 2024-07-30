import 'dart:async';

import 'package:anytime_todo_app/common/constants/app_colors.dart';
import 'package:anytime_todo_app/common/constants/text_strings.dart';
import 'package:anytime_todo_app/common/helpers/device_utilities_extensions.dart';
import 'package:anytime_todo_app/common/widgets/appbar/appbar.dart';
import 'package:anytime_todo_app/core/viewmodels/todo_controller.dart';
import 'package:anytime_todo_app/core/viewmodels/user_controller.dart';
import 'package:anytime_todo_app/ui/home/widgets/add_todo_bottom_sheet.dart';
import 'package:anytime_todo_app/ui/home/widgets/todo_list.dart';
import 'package:anytime_todo_app/ui/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TodoController());
    final userController = Get.put(UserController());
    final height = context.screenHeight;
    final width = context.screenWidth;
    return Scaffold(
      appBar: TAppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TTexts.appName,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .apply(color: AppColors.primary),
            ),
            SizedBox(height: height * 0.004),
            Row(
              children: [
                Text(
                  TTexts.welcome,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(width: width * 0.01),
                Obx(
                  () => Text(
                    userController.user.value.firstName,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .apply(color: AppColors.primary),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.all(AppColors.primary.withOpacity(0.12)),
            ),
            color: AppColors.primary,
            onPressed: () => unawaited(Get.to(() => const ProfileScreen())),
            icon: const Icon(Iconsax.user),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.03,
          horizontal: width * 0.05,
        ),
        child: Column(
          children: [
            TabBar(
              overlayColor:
                  WidgetStateProperty.all(AppColors.primary.withOpacity(0.1)),
              controller: _tabController,
              indicatorColor: AppColors.primary,
              labelColor: AppColors.primary,
              dividerColor: AppColors.grey,
              tabs: const [
                Tab(text: 'Tamamlanmamış'),
                Tab(text: 'Tamamlanmış'),
              ],
            ),
            SizedBox(height: height * 0.02),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Todo ara...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: controller.updateSearchQuery,
            ),
            SizedBox(height: height * 0.02),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  TodoList(controller: controller, isCompleted: false),
                  TodoList(controller: controller, isCompleted: true),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        onPressed: () {
          _showAddTodoBottomSheet(context, controller);
        },
        child: const Icon(Iconsax.add),
      ),
    );
  }

  void _showAddTodoBottomSheet(
    BuildContext context,
    TodoController controller,
  ) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return AddTodoBottomSheet(controller: controller);
      },
    );
  }
}
