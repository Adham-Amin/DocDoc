import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_styles.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class SelectDateSection extends StatefulWidget {
  const SelectDateSection({super.key, required this.selectDate});
  final Function(String) selectDate;

  @override
  State<SelectDateSection> createState() => _SelectDateSectionState();
}

class _SelectDateSectionState extends State<SelectDateSection> {
  DateTime selectedValue = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select Date', style: AppStyles.textSemiBold18),
        HeightBox(24),
        SizedBox(
          height: 80.h,
          child: DatePicker(
            DateTime.now(),
            initialSelectedDate: DateTime.now(),
            daysCount: 10,
            selectionColor: AppColors.primary,
            selectedTextColor: AppColors.white,
            onDateChange: (date) {
              setState(() {
                widget.selectDate(DateFormat('yyyy-MM-dd').format(date));
                selectedValue = date;
              });
            },
          ),
        ),
      ],
    );
  }
}
