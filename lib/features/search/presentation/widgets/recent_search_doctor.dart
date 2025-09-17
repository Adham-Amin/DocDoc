import 'package:docdoc/core/helper/search_history_helper.dart';
import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_styles.dart';
import 'package:docdoc/core/widgets/height_and_width.dart';
import 'package:flutter/material.dart';

class RecentSearchSection extends StatefulWidget {
  const RecentSearchSection({super.key, required this.onChanged});

  final Function(String) onChanged;

  @override
  State<RecentSearchSection> createState() => _RecentSearchSectionState();
}

class _RecentSearchSectionState extends State<RecentSearchSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Recent Search', style: AppStyles.textSemiBold18),
            Spacer(),
            GestureDetector(
              onTap: () {
                SearchHistoryHelper.clearSearchHistory();
                setState(() {});
              },
              child: Text(
                'Clear All History',
                style: AppStyles.textRegular12.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
        HeightBox(16),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: SearchHistoryHelper.getSearchHistory().length,
          itemBuilder: (context, index) => RecentSearchItem(
            query: SearchHistoryHelper.getSearchHistory()[index],
            onTap: widget.onChanged,
          ),
        ),
      ],
    );
  }
}

class RecentSearchItem extends StatefulWidget {
  const RecentSearchItem({super.key, required this.query, required this.onTap});

  final String query;
  final Function(String) onTap;

  @override
  State<RecentSearchItem> createState() => _RecentSearchItemState();
}

class _RecentSearchItemState extends State<RecentSearchItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(Icons.search, color: AppColors.grey),
      title: GestureDetector(
        onTap: () => widget.onTap(widget.query),
        child: Text(
          widget.query,
          style: AppStyles.textRegular14.copyWith(color: AppColors.grey),
        ),
      ),
      trailing: InkWell(
        onTap: () async {
          await SearchHistoryHelper.removeSearchHistory(query: widget.query);
          if (mounted) {
            context
                .findAncestorStateOfType<_RecentSearchSectionState>()
                ?.setState(() {});
          }
        },
        child: Icon(Icons.close, color: AppColors.grey),
      ),
    );
  }
}
