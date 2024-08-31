import 'package:chefio_recipe_app/modules/recipe/view/search/search_recipe.controller.dart';
import 'package:chefio_recipe_app/styles/styles.dart';
import 'package:chefio_recipe_app/core/widgets/others/grey_divider.dart';
import 'package:chefio_recipe_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SearchHistoryComponent extends StatelessWidget {
  const SearchHistoryComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final searchHistories = context.read<SearchRecipeController>().searchHistories;

    if (searchHistories.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 24.w),
          itemCount: searchHistories.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final searchHistory = searchHistories[index];
            return SearchHistoryItemComponent(text: searchHistory);
          },
          separatorBuilder: (context, index) => SizedBox(height: 4.h),
        ),
        const GreyDivider(),
      ],
    );
  }
}

class SearchHistoryItemComponent extends StatefulWidget {
  const SearchHistoryItemComponent({super.key, required this.text});

  final String text;

  @override
  State<SearchHistoryItemComponent> createState() => _SearchHistoryItemComponentState();
}

class _SearchHistoryItemComponentState extends State<SearchHistoryItemComponent> {
  late final text = widget.text;

  void search() async {
    final controller = context.read<SearchRecipeController>();
    controller.queryController.text = text;
    await controller.search(text);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: search,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          children: [
            Row(
              children: [
                Icon(
                  Icons.history,
                  color: AppColors.secondaryText,
                  size: 24.sp,
                ),
                SizedBox(width: 17.w),
                Text(
                  text.toTitleCase,
                  style: AppText.bold500(context).copyWith(
                    fontSize: 17.sp,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.north_west,
              color: AppColors.secondaryText,
            ),
          ],
        ),
      ),
    );
  }
}
