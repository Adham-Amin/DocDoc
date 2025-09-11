import 'package:docdoc/core/utils/app_assets.dart';

class DoctorEntity {
  final num id;
  final String name;
  final String speciality;
  final String city;
  final String degree;
  final String governrate;

  DoctorEntity({
    required this.id,
    required this.name,
    required this.speciality,
    required this.city,
    required this.governrate,
    required this.degree,
  });

  static const List<String> doctorImages = [
    AppAssets.imagesDocOne,
    AppAssets.imagesDocTwo,
    AppAssets.imagesDocThree,
    AppAssets.imagesDocFour,
    AppAssets.imagesDocFive,
    AppAssets.imagesDocTwo,
    AppAssets.imagesDocThree,
    AppAssets.imagesDocOne,
  ];
}
