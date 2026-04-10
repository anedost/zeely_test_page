import 'package:flutter/material.dart';
import 'package:zeely_test_page/theme/app_colors.dart';

class AvatarGridItem extends StatelessWidget {
  final String name;
  final String subtitle;
  final String imageAsset;
  final int index;

  const AvatarGridItem({
    super.key,
    required this.name,
    required this.subtitle,
    required this.imageAsset,
    this.index = 0,
  });

  @override
  Widget build(BuildContext context) {
    // Staggered fade-in and scale animation based on index to create a cascading effect when the grid is displayed (reuse this animated from my previous project)
    final delay = (index * 0.05).clamp(0.0, 0.3);
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 300 + (delay * 1000).toInt()),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        final adjustedValue = ((value - delay) / (1.0 - delay)).clamp(0.0, 1.0);
        return Opacity(
          opacity: adjustedValue,
          child: Transform.scale(scale: 0.85 + 0.15 * adjustedValue, child: child),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(imageAsset, fit: BoxFit.cover),
            Positioned(
              left: 8,
              bottom: 8,
              right: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      height: 1.2,
                      color: AppColors.textOnPrimary,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      height: 1.0,
                      color: AppColors.textOnPrimary,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
