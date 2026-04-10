import 'package:zeely_test_page/models/avatar_model.dart';
import 'package:zeely_test_page/models/gender.dart';
import 'package:zeely_test_page/models/pose.dart';

class AvatarRepository {
  List<AvatarModel> getAvatars() {
    return [
      AvatarModel(
        id: '1',
        name: 'Jennifer',
        gender: Gender.woman,
        pose: Pose.standing,
        image: 'assets/images/avatars/1.png',
        age: 21,
      ),
      AvatarModel(
        id: '2',
        name: 'Mary',
        gender: Gender.woman,
        pose: Pose.selfie,
        image: 'assets/images/avatars/2.png',
        age: 38,
      ),
      AvatarModel(
        id: '3',
        name: 'Tim',
        gender: Gender.man,
        pose: Pose.sitting,
        image: 'assets/images/avatars/3.png',
        age: 29,
      ),
      AvatarModel(
        id: '4',
        name: 'Sarah',
        gender: Gender.woman,
        pose: Pose.standing,
        image: 'assets/images/avatars/4.png',
        age: 35,
      ),
      AvatarModel(
        id: '5',
        name: 'Ben',
        gender: Gender.man,
        pose: Pose.selfie,
        image: 'assets/images/avatars/5.png',
        age: 37,
      ),
      AvatarModel(
        id: '6',
        name: 'Nora',
        gender: Gender.woman,
        pose: Pose.walking,
        image: 'assets/images/avatars/6.png',
        age: 29,
      ),
      AvatarModel(
        id: '7',
        name: 'Mia',
        gender: Gender.woman,
        pose: Pose.carSelfie,
        image: 'assets/images/avatars/7.png',
        age: 38,
      ),
      AvatarModel(
        id: '8',
        name: 'Tom',
        gender: Gender.man,
        pose: Pose.standing,
        image: 'assets/images/avatars/8.png',
        age: 58,
      ),
      AvatarModel(
        id: '9',
        name: 'Ella',
        gender: Gender.woman,
        pose: Pose.selfie,
        image: 'assets/images/avatars/9.png',
        age: 19,
      ),
      AvatarModel(
        id: '10',
        name: 'James',
        gender: Gender.man,
        pose: Pose.selfie,
        image: 'assets/images/avatars/10.png',
        age: 45,
      ),
      AvatarModel(
        id: '11',
        name: 'Andre',
        gender: Gender.man,
        pose: Pose.walking,
        image: 'assets/images/avatars/11.png',
        age: 24,
      ),
      AvatarModel(
        id: '12',
        name: 'Rya',
        gender: Gender.woman,
        pose: Pose.walking,
        image: 'assets/images/avatars/12.png',
        age: 30,
      ),
    ];
  }
}
