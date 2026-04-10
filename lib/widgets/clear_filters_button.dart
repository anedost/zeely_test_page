import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeely_test_page/theme/app_colors.dart';

class ClearFiltersButton extends StatelessWidget {
  final VoidCallback onTap;

  const ClearFiltersButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.background,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        splashFactory: NoSplash.splashFactory,
        highlightColor: AppColors.primary.withValues(alpha: 0.05),
        child: Container(
          width: 36,
          height: 36,
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.border),
          ),
          child: Center(child: SvgPicture.asset('assets/icons/close.svg', width: 18, height: 18)),
        ),
      ),
    );
  }
}
