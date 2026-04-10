import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeely_test_page/controllers/avatar_controller.dart';
import 'package:zeely_test_page/models/age_group.dart';
import 'package:zeely_test_page/models/filter_option.dart';
import 'package:zeely_test_page/models/gender.dart';
import 'package:zeely_test_page/models/pose.dart';
import 'package:zeely_test_page/widgets/clear_filters_button.dart';
import 'package:zeely_test_page/widgets/filter_bottom_sheet.dart';
import 'package:zeely_test_page/widgets/filter_chip_widget.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({super.key});

  Map<Gender, FilterOption> _genderOptions() {
    return {Gender.man: const FilterOption('Man'), Gender.woman: const FilterOption('Woman')};
  }

  Map<AgeGroup, FilterOption> _ageOptions() {
    return {
      AgeGroup.youngAdults: FilterOption('Young adults', subtitle: AgeGroup.youngAdults.ageRange),
      AgeGroup.adults: FilterOption('Adults', subtitle: AgeGroup.adults.ageRange),
      AgeGroup.middleAged: FilterOption('Middle-aged adults', subtitle: AgeGroup.middleAged.ageRange),
      AgeGroup.olderAdults: FilterOption('Older adults', subtitle: AgeGroup.olderAdults.ageRange),
    };
  }

  Map<Pose, FilterOption> _poseOptions() {
    return {
      Pose.standing: const FilterOption('Standing'),
      Pose.sitting: const FilterOption('Sitting'),
      Pose.selfie: const FilterOption('Selfie'),
      Pose.carSelfie: const FilterOption('Car selfie'),
      Pose.walking: const FilterOption('Walking'),
    };
  }

  void _showFilterSheet<T>(
    BuildContext context, {
    required String title,
    required Map<T, FilterOption> options,
    required RxSet<T> tempSelected,
    required void Function(T) onToggle,
    required VoidCallback onSave,
    required VoidCallback onOpen,
  }) {
    onOpen();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 34),
        child: FilterBottomSheet(
          title: title,
          options: options,
          tempSelected: tempSelected,
          onToggle: onToggle,
          onSave: onSave,
          onClose: () => Get.back(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AvatarController>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Obx(() {
        final hasFilters = controller.hasActiveFilters;
        return Row(
          children: [
            if (hasFilters) ClearFiltersButton(onTap: controller.clearAllFilters),
            FilterChipWidget(
              label: 'Gender',
              activeCount: controller.genderFilterCount,
              onTap: () => _showFilterSheet(
                context,
                title: 'Gender',
                options: _genderOptions(),
                tempSelected: controller.tempGenders,
                onToggle: controller.toggleTempGender,
                onSave: controller.saveGenderFilter,
                onOpen: controller.openGenderFilter,
              ),
            ),
            const SizedBox(width: 8),
            FilterChipWidget(
              label: 'Age',
              activeCount: controller.ageFilterCount,
              onTap: () => _showFilterSheet(
                context,
                title: 'Age',
                options: _ageOptions(),
                tempSelected: controller.tempAgeGroups,
                onToggle: controller.toggleTempAgeGroup,
                onSave: controller.saveAgeFilter,
                onOpen: controller.openAgeFilter,
              ),
            ),
            const SizedBox(width: 8),
            FilterChipWidget(
              label: 'Pose',
              activeCount: controller.poseFilterCount,
              onTap: () => _showFilterSheet(
                context,
                title: 'Pose',
                options: _poseOptions(),
                tempSelected: controller.tempPoses,
                onToggle: controller.toggleTempPose,
                onSave: controller.savePoseFilter,
                onOpen: controller.openPoseFilter,
              ),
            ),
          ],
        );
      }),
    );
  }
}
