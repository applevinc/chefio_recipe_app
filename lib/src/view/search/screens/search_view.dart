import 'package:chefio_recipe_app/src/core/assets/icons.dart';
import 'package:chefio_recipe_app/src/core/theme/colors.dart';
import 'package:chefio_recipe_app/src/core/widgets/grey_divider.dart';
import 'package:chefio_recipe_app/src/view/search/layouts/history_listview.dart';
import 'package:chefio_recipe_app/src/view/search/layouts/suggestion_chips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        backgroundColor: Colors.white,
        toolbarHeight: 96.h,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.form,
        hintStyle: Theme.of(context).textTheme.bodyText1,
        contentPadding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 19.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.r),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        padding: EdgeInsets.only(right: 24.w),
        icon: SvgPicture.asset(AppIcons.filter),
        onPressed: () {},
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.chevron_left,
        color: AppColors.mainText,
      ),
      onPressed: () {
        FocusScope.of(context).requestFocus(FocusNode());
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      children: const [
        GreyDivider(),
        HistoryListView(),
        GreyDivider(),
        SearchSuggestions(),
      ],
    );
  }
}
