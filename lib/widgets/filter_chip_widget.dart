import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeely_test_page/theme/app_colors.dart';

class FilterChipWidget extends StatelessWidget {
  final String label;
  final int activeCount;
  final VoidCallback onTap;

  const FilterChipWidget({super.key, required this.label, required this.activeCount, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final bool isActive = activeCount > 0;

    return Material(
      color: AppColors.background,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        splashFactory: NoSplash.splashFactory,
        highlightColor: AppColors.primary.withValues(alpha: 0.05),
        child: Container(
          height: 36,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.border, width: 1),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
              ),
              if (isActive) ...[
                const SizedBox(width: 4),
                Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.background, width: 3),
                  ),
                  child: Center(
                    child: Text(
                      '$activeCount',
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        height: 1.0,
                        color: AppColors.textOnPrimary,
                      ),
                    ),
                  ),
                ),
              ],
              const SizedBox(width: 4),
              SvgPicture.asset('assets/icons/arrow.svg', width: 12, height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
