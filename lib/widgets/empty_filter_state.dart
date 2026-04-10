import 'package:flutter/material.dart';
import 'package:zeely_test_page/theme/app_colors.dart';
import 'package:zeely_test_page/widgets/app_button.dart';

class EmptyFilterState extends StatelessWidget {
  final VoidCallback onClearFilters;

  const EmptyFilterState({super.key, required this.onClearFilters});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/Plastic Shopping Basket.I01 1.png', width: 165, height: 165),
            const SizedBox(height: 24),
            const Text(
              'Nothing was found using these filters',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, height: 1.2, color: AppColors.textPrimary),
            ),
            const SizedBox(height: 16),
            AppButton(label: 'Clear filters', onTap: onClearFilters, style: AppButtonStyle.outlined),
          ],
        ),
      ),
    );
  }
}
