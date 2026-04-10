import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeely_test_page/controllers/avatar_controller.dart';
import 'package:zeely_test_page/models/gender.dart';
import 'package:zeely_test_page/widgets/avatar_grid_item.dart';
import 'package:zeely_test_page/widgets/empty_filter_state.dart';

class AvatarGrid extends StatelessWidget {
  const AvatarGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AvatarController>();

    return Obx(() {
      if (controller.filteredAvatars.isEmpty && controller.hasActiveFilters) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: EmptyFilterState(key: const ValueKey('empty'), onClearFilters: controller.clearAllFilters),
        );
      }

      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: GridView.builder(
          key: ValueKey(controller.filteredAvatars.map((a) => a.id).join(',')),
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 112 / 152,
          ),
          itemCount: controller.filteredAvatars.length,
          itemBuilder: (context, index) {
            final avatar = controller.filteredAvatars[index];
            final genderLabel = avatar.gender == Gender.man ? 'Male' : 'Female';
            return AvatarGridItem(
              key: ValueKey(avatar.id),
              name: avatar.name,
              subtitle: '$genderLabel · ${avatar.age}',
              imageAsset: avatar.image,
              index: index,
            );
          },
        ),
      );
    });
  }
}
