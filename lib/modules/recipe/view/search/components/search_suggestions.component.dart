import 'package:chefio_recipe_app/modules/recipe/view/search/search_recipe.controller.dart';
import 'package:chefio_recipe_app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SearchSuggestionsComponent extends StatelessWidget {
  const SearchSuggestionsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final searchSuggestions = context.read<SearchRecipeController>().searchSuggestions;

    if (searchSuggestions.isEmpty) {
      return const SizedBox.shrink();
    }

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
              (index) {
                final searchSuggestion = searchSuggestions[index];
                return SearchSuggestionItemComponent(text: searchSuggestion);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SearchSuggestionItemComponent extends StatefulWidget {
  const SearchSuggestionItemComponent({super.key, required this.text});

  final String text;

  @override
  State<SearchSuggestionItemComponent> createState() =>
      _SearchSuggestionItemComponentState();
}

class _SearchSuggestionItemComponentState extends State<SearchSuggestionItemComponent> {
  late final text = widget.text;

  void search() async {
    final controller = context.read<SearchRecipeController>();
    controller.queryController.text = text;
    await controller.search(text);
  }

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: GestureDetector(
        onTap: search,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 24.w),
          decoration: BoxDecoration(
            color: AppColors.form,
            borderRadius: BorderRadius.circular(32.r),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
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
