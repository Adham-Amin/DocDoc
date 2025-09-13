import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:docdoc/features/doctor_detatils/domain/entities/review_entity.dart';
import 'package:docdoc/features/doctor_detatils/presentation/widgets/review_item.dart';
import 'package:flutter/material.dart';

class ReviewsDoctor extends StatelessWidget {
  const ReviewsDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: ReviewEntity.reviews.length,
      itemBuilder: (context, index) =>
          ReviewItem(review: ReviewEntity.reviews[index]),
      separatorBuilder: (context, index) => HeightBox(16),
    );
  }
}
