import 'package:chefio_recipe_app/modules/home/screens/search/components/search_appbar_component.dart';
import 'package:chefio_recipe_app/shared/styles/styles.dart';
import 'package:chefio_recipe_app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SearchAppBarComponent(),
            GreyDivider(),
            _SearchHistoryView(),
            GreyDivider(),
            _SearchSuggestions(),
          ],
        ),
      ),
    );
  }
}

class _SearchHistoryView extends StatelessWidget {
  const _SearchHistoryView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 24.w),
      itemCount: 2,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return item(context: context, title: 'Pancakes');
      },
      separatorBuilder: (context, index) => SizedBox(height: 4.h),
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
                  'Pancakes',
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

const List<String> _suggestions = ['sushi', 'sandwich', 'seafood', 'fried rice'];

class _SearchSuggestions extends StatelessWidget {
  const _SearchSuggestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Search suggestions',
            style: AppText.bold700(context).copyWith(
              color: AppColors.headlineText,
              fontSize: 17.sp,
            ),
          ),
          SizedBox(height: 24.h),
          Wrap(
            spacing: 8.w,
            runSpacing: 16.h,
            children: List.generate(
              _suggestions.length,
              (index) => choice(context: context, label: _suggestions[index]),
            ),
          ),
        ],
      ),
    );
  }

  Widget choice({required BuildContext context, required String label}) {
    return UnconstrainedBox(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 24.w),
          decoration: BoxDecoration(
            color: AppColors.form,
            borderRadius: BorderRadius.circular(32.r),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: AppText.bold500(context).copyWith(
              color: AppColors.headlineText,
              fontSize: 15.sp,
            ),
          ),
        ),
      ),
    );
  }
}
