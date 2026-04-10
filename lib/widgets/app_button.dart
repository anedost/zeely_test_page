import 'package:flutter/material.dart';
import 'package:zeely_test_page/theme/app_colors.dart';

enum AppButtonStyle { filled, outlined }

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final AppButtonStyle style;
  final bool expand;

  const AppButton({
    super.key,
    required this.label,
    required this.onTap,
    this.style = AppButtonStyle.filled,
    this.expand = false,
  });

  @override
  Widget build(BuildContext context) {
    final isFilled = style == AppButtonStyle.filled;
    final radius = BorderRadius.circular(100);

    final button = Material(
      color: isFilled ? AppColors.primary : Colors.transparent,
      borderRadius: radius,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        splashFactory: NoSplash.splashFactory,
        highlightColor: isFilled ? Colors.white.withValues(alpha: 0.1) : AppColors.primary.withValues(alpha: 0.05),
        child: Container(
          height: 62,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          decoration: BoxDecoration(
            borderRadius: radius,
            border: isFilled ? null : Border.all(color: AppColors.border),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 1.0,
              color: isFilled ? AppColors.textOnPrimary : AppColors.textPrimary,
            ),
          ),
        ),
      ),
    );

    if (expand) {
      return button;
    }
    return UnconstrainedBox(child: button);
  }
}
