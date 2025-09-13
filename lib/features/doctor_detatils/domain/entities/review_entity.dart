import 'package:docdoc/core/utils/app_assets.dart';

class ReviewEntity {
  final String image;
  final String name;
  final String comment;

  ReviewEntity({
    required this.image,
    required this.name,
    required this.comment,
  });

  static List<ReviewEntity> reviews = [
    ReviewEntity(
      image: AppAssets.imagesReviewOne,
      name: 'John Doe',
      comment:
          'As someone who lives in a remote area with limited access to healthcare, this telemedicine app has been a game changer for me. I can easily schedule virtual appointments with doctors and get the care I need without having to travel long distances.',
    ),
    ReviewEntity(
      image: AppAssets.imagesReviewTwo,
      name: 'Jane Smith',
      comment:
          'I had a great experience using this telemedicine app. The doctor I spoke with was knowledgeable and attentive, and I felt like I received the same level of care as I would have in person. Highly recommend!',
    ),
    ReviewEntity(
      image: AppAssets.imagesReviewThree,
      name: 'Michael Johnson',
      comment:
          'This telemedicine app has made it so easy for me to manage my chronic condition. I can check in with my doctor regularly without having to take time off work or arrange for transportation. It\'s been a lifesaver!',
    ),
  ];
}
