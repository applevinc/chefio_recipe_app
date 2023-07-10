import 'package:chefio_recipe_app/src/shared/assets/icons.dart';
import 'package:chefio_recipe_app/src/shared/styles/colors.dart';
import 'package:chefio_recipe_app/src/shared/widgets/others/grey_divider.dart';
import 'package:chefio_recipe_app/src/modules/search/layouts/filter_bottomsheet.dart';
import 'package:chefio_recipe_app/src/modules/search/layouts/history_listview.dart';
import 'package:chefio_recipe_app/src/modules/search/layouts/suggestion_chips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends SearchDelegate {
  SearchScreen()
      : super(
          searchFieldStyle: GoogleFonts.inter(
            color: AppColors.secondaryText,
            fontSize: 15.0.sp,
            letterSpacing: 0.5.sp,
            fontWeight: FontWeight.w500,
          ),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
        );

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        backgroundColor: Colors.white,
        toolbarHeight: 96.h,
        toolbarTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.mainText),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.form,
        hintStyle: Theme.of(context).textTheme.bodyLarge,
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
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());

          showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            builder: (context) => const AddFilterView(),
          );
        },
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
    return Column(
      children: const [
        GreyDivider(),
        //RecipesGrid(),
      ],
    );
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
