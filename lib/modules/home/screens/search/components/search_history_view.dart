import 'package:chefio_recipe_app/modules/home/models/search_history.dart';
import 'package:chefio_recipe_app/modules/home/screens/search/search_viewmodel.dart';
import 'package:chefio_recipe_app/styles/styles.dart';
import 'package:chefio_recipe_app/common/widgets/others/grey_divider.dart';
import 'package:chefio_recipe_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SearchHistoryView extends StatelessWidget {
  const SearchHistoryView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<SearchHistory> searchHistories =
        context.read<SearchViewModel>().searchHistories;

    return Column(
      children: [
        ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 24.w),
          itemCount: searchHistories.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => item(
            context: context,
            title: searchHistories[index].text,
          ),
          separatorBuilder: (context, index) => SizedBox(height: 4.h),
        ),
        const GreyDivider(),
      ],
    );
  }

  Widget item({required BuildContext context, required String title}) {
    return InkWell(
      onTap: () {},
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
                  title.toTitleCase,
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
