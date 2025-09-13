import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_styles.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotesSection extends StatelessWidget {
  const NotesSection({super.key, required this.notes});

  final Function(String) notes;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Notes', style: AppStyles.textSemiBold18),
        HeightBox(24),
        TextField(
          onChanged: notes,
          maxLines: 3,
          decoration: InputDecoration(
            fillColor: Color(0xffF2F4F7),
            filled: true,
            hintText: 'Write your comment here...',
            hintStyle: AppStyles.textRegular14.copyWith(
              color: AppColors.grey.withValues(alpha: 0.5),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: AppColors.primary, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
