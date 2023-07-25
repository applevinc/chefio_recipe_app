import 'package:chefio_recipe_app/modules/home/models/search_suggestion.dart';
import 'package:chefio_recipe_app/modules/home/screens/search/search_viewmodel.dart';
import 'package:chefio_recipe_app/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SearchSuggestionView extends StatelessWidget {
  const SearchSuggestionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<SearchSuggestion> searchSuggestions =
        context.read<SearchViewModel>().searchSuggestions;

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
              searchSuggestions.length,
              (index) => choice(
                context: context,
                label: searchSuggestions[index].text,
              ),
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
