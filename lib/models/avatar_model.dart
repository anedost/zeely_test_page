import 'package:zeely_test_page/models/age_group.dart';
import 'package:zeely_test_page/models/gender.dart';
import 'package:zeely_test_page/models/pose.dart';

class AvatarModel {
  final String id;
  final String name;
  final Gender gender;
  final Pose pose;
  final String image;
  final int age;

  AgeGroup get ageGroup => AgeGroup.fromAge(age);

  AvatarModel({
    required this.id,
    required this.name,
    required this.gender,
    required this.pose,
    required this.image,
    required this.age,
  });
}
