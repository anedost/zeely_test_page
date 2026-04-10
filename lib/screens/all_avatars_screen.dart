import 'package:flutter/material.dart';
import 'package:zeely_test_page/theme/app_colors.dart';
import 'package:zeely_test_page/widgets/avatar_grid.dart';
import 'package:zeely_test_page/widgets/filter_bar.dart';

class AllAvatarsScreen extends StatelessWidget {
  const AllAvatarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 16,
        title: const Text(
          'All avatars',
          style: TextStyle(color: AppColors.textPrimary, fontSize: 26, fontWeight: FontWeight.w700, height: 1.2),
        ),
        centerTitle: false,
      ),
      body: const Column(
        children: [
          FilterBar(),
          Expanded(child: AvatarGrid()),
        ],
      ),
    );
  }
}
