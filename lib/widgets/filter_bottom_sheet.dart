import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zeely_test_page/models/filter_option.dart';
import 'package:zeely_test_page/theme/app_colors.dart';
import 'package:zeely_test_page/widgets/app_button.dart';

class FilterBottomSheet<T> extends StatelessWidget {
  final String title;
  final Map<T, FilterOption> options;
  final RxSet<T> tempSelected;
  final void Function(T) onToggle;
  final VoidCallback onSave;
  final VoidCallback onClose;

  const FilterBottomSheet({
    super.key,
    required this.title,
    required this.options,
    required this.tempSelected,
    required this.onToggle,
    required this.onSave,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.background, borderRadius: BorderRadius.all(Radius.circular(28))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(),
          const SizedBox(height: 12),
          ...options.entries.map((entry) {
            return Obx(() {
              final isSelected = tempSelected.contains(entry.key);
              return InkWell(
                onTap: () => onToggle(entry.key),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: _buildOptionText(entry.value.title, entry.value.subtitle)),
                      SvgPicture.asset(
                        isSelected ? 'assets/icons/check_box.svg' : 'assets/icons/check_box_empty.svg',
                        width: 18,
                        height: 18,
                      ),
                    ],
                  ),
                ),
              );
            });
          }),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
            child: AppButton(
              label: 'Save',
              onTap: () {
                onSave();
                onClose();
              },
              expand: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 32, 20, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              height: 1.2,
              color: AppColors.textPrimary,
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onClose,
              borderRadius: BorderRadius.circular(12),
              splashFactory: NoSplash.splashFactory,
              highlightColor: AppColors.primary.withValues(alpha: 0.05),
              child: SvgPicture.asset('assets/icons/close.svg', width: 24, height: 24),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionText(String title, String? subtitle) {
    if (subtitle != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              height: 1.1,
              color: AppColors.textPrimary,
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.4,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      );
    }
    return Text(
      title,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, height: 1.1, color: AppColors.textPrimary),
    );
  }
}
