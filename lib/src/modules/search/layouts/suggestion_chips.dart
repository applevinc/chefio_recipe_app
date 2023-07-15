import 'package:chefio_recipe_app/src/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const List<String> _suggestions = ['sushi', 'sandwich', 'seafood', 'fried rice'];

class SearchSuggestions extends StatelessWidget {
  const SearchSuggestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Search suggestions',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.headlineText, fontSize: 17.sp, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 24.h),
          Wrap(
            spacing: 8.w,
            children: List.generate(_suggestions.length, (index) {
              var suggestion = _suggestions[index];

              return ChoiceChip(
                label: Text(
                  suggestion,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.headlineText),
                ),
                labelStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.headlineText),
                disabledColor: AppColors.form,
                selected: false,
              );
            }),
          ),
        ],
      ),
    );
  }
}
