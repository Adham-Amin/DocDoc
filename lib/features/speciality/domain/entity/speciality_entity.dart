import 'package:docdoc/core/utils/app_assets.dart';

class SpecialityEntity {
  final int id;
  final String image;
  final String name;

  SpecialityEntity({required this.id, required this.image, required this.name});

  static List<SpecialityEntity> specialities = [
    SpecialityEntity(
      id: 1,
      image: AppAssets.imagesPediatric,
      name: 'Pediatrics',
    ),
    SpecialityEntity(id: 2, image: AppAssets.imagesGeneral, name: 'Gynecology'),
    SpecialityEntity(id: 3, image: AppAssets.imagesFrame, name: 'Orthopedics'),
    SpecialityEntity(
      id: 4,
      image: AppAssets.imagesRadiology,
      name: 'Dermatology',
    ),
    SpecialityEntity(
      id: 5,
      image: AppAssets.imagesCardiologist,
      name: 'Cardiology',
    ),
    SpecialityEntity(id: 6, image: AppAssets.imagesEnt, name: 'ENT'),
    SpecialityEntity(id: 7, image: AppAssets.imagesDent, name: 'Dentistry'),
    SpecialityEntity(id: 8, image: AppAssets.imagesGeneral, name: 'Surgery'),
    SpecialityEntity(
      id: 9,
      image: AppAssets.imagesHepatology,
      name: 'Nephrology',
    ),
    SpecialityEntity(
      id: 10,
      image: AppAssets.imagesHistologist,
      name: 'Oncology',
    ),
  ];
}
