import 'package:docdoc/core/utils/app_styles.dart';
import 'package:docdoc/core/widgets/custom_list_tile.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:flutter/material.dart';

class BookInformationSection extends StatelessWidget {
  const BookInformationSection({
    super.key,
    required this.time,
    required this.note,
  });

  final String time;
  final String note;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Booking Information', style: AppStyles.textSemiBold16),
        HeightBox(16),
        CustomListTile(
          color: Color(0xff247CFF),
          icon: Icons.date_range,
          title: 'Date & Time',
          subtitle: time,
        ),
        CustomListTile(
          color: Color(0xff22C55E),
          icon: Icons.person,
          title: 'Notes',
          subtitle: note,
        ),
      ],
    );
  }
}
