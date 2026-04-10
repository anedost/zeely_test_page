import 'package:get/get.dart';
import 'package:zeely_test_page/models/age_group.dart';
import 'package:zeely_test_page/models/avatar_model.dart';
import 'package:zeely_test_page/models/gender.dart';
import 'package:zeely_test_page/models/pose.dart';
import 'package:zeely_test_page/repositories/avatar_repository.dart';

class AvatarController extends GetxController {
  final AvatarRepository _repository;

  AvatarController({AvatarRepository? repository}) : _repository = repository ?? AvatarRepository();

  final RxList<AvatarModel> allAvatars = <AvatarModel>[].obs;
  final RxList<AvatarModel> filteredAvatars = <AvatarModel>[].obs;

  final RxSet<Gender> selectedGenders = <Gender>{}.obs;
  final RxSet<AgeGroup> selectedAgeGroups = <AgeGroup>{}.obs;
  final RxSet<Pose> selectedPoses = <Pose>{}.obs;

  final RxSet<Gender> tempGenders = <Gender>{}.obs;
  final RxSet<AgeGroup> tempAgeGroups = <AgeGroup>{}.obs;
  final RxSet<Pose> tempPoses = <Pose>{}.obs;

  bool get hasActiveFilters => selectedGenders.isNotEmpty || selectedAgeGroups.isNotEmpty || selectedPoses.isNotEmpty;

  int get genderFilterCount => selectedGenders.length;
  int get ageFilterCount => selectedAgeGroups.length;
  int get poseFilterCount => selectedPoses.length;

  @override
  void onInit() {
    super.onInit();
    _loadAvatars();
    filteredAvatars.assignAll(allAvatars);
  }

  void _loadAvatars() {
    allAvatars.assignAll(_repository.getAvatars());
  }

  void _applyFilters() {
    filteredAvatars.assignAll(
      allAvatars.where((avatar) {
        if (selectedGenders.isNotEmpty && !selectedGenders.contains(avatar.gender)) {
          return false;
        }
        if (selectedAgeGroups.isNotEmpty && !selectedAgeGroups.contains(avatar.ageGroup)) {
          return false;
        }
        if (selectedPoses.isNotEmpty && !selectedPoses.contains(avatar.pose)) {
          return false;
        }
        return true;
      }).toList(),
    );
  }

  void _openFilter<T>(RxSet<T> temp, RxSet<T> selected) {
    temp.assignAll(selected);
  }

  void _toggleTemp<T>(RxSet<T> temp, T value) {
    temp.contains(value) ? temp.remove(value) : temp.add(value);
  }

  void _saveFilter<T>(RxSet<T> selected, RxSet<T> temp) {
    selected.assignAll(temp);
    _applyFilters();
  }

  void openGenderFilter() => _openFilter(tempGenders, selectedGenders);
  void toggleTempGender(Gender gender) => _toggleTemp(tempGenders, gender);
  void saveGenderFilter() => _saveFilter(selectedGenders, tempGenders);

  void openAgeFilter() => _openFilter(tempAgeGroups, selectedAgeGroups);
  void toggleTempAgeGroup(AgeGroup ageGroup) => _toggleTemp(tempAgeGroups, ageGroup);
  void saveAgeFilter() => _saveFilter(selectedAgeGroups, tempAgeGroups);

  void openPoseFilter() => _openFilter(tempPoses, selectedPoses);
  void toggleTempPose(Pose pose) => _toggleTemp(tempPoses, pose);
  void savePoseFilter() => _saveFilter(selectedPoses, tempPoses);

  void clearAllFilters() {
    selectedGenders.clear();
    selectedAgeGroups.clear();
    selectedPoses.clear();
    _applyFilters();
  }
}
