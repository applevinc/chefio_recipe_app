import 'package:chefio_recipe_app/modules/home/models/search_filter_request.dart';
import 'package:chefio_recipe_app/modules/home/screens/search/layouts/filter/search_filter_sheet.dart';
import 'package:chefio_recipe_app/modules/home/screens/search/search_viewmodel.dart';
import 'package:chefio_recipe_app/assets/icons.dart';
import 'package:chefio_recipe_app/styles/styles.dart';
import 'package:chefio_recipe_app/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SearchAppBarComponent extends StatefulWidget {
  const SearchAppBarComponent({super.key});

  @override
  State<SearchAppBarComponent> createState() => _SearchAppBarComponentState();
}

class _SearchAppBarComponentState extends State<SearchAppBarComponent> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void onTapFilterIcon() async {
    final viewModel = context.read<SearchViewModel>();
    final catergories = viewModel.categories;

    if (catergories.isEmpty) {
      return;
    }

    final result = await showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      builder: (context) => SearchFilterSheet(categories: catergories),
    );

    if (result != null) {
      searchController.clear();
      final request = result as SearchFilterRequest;
      await viewModel.searchByFilter(request);
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SearchViewModel>();

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.h, bottom: 24.h),
          child: Row(
            children: [
              IconButton(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                icon: Icon(
                  Icons.chevron_left,
                  color: AppColors.mainText,
                  size: 24.sp,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                child: Hero(
                  tag: 'search',
                  child: Material(
                    type: MaterialType.transparency,
                    child: CustomTextField(
                      controller: searchController,
                      autofocus: true,
                      readOnly: viewModel.busy(SearchLoadingState.init),
                      prefixIcon: const TextFieldIcon(icon: AppIcons.search),
                      suffixIcon: searchController.text.isEmpty
                          ? null
                          : TextFieldIcon(
                              icon: AppIcons.closeCircle,
                              onTap: () {
                                searchController.clear();
                                setState(() {});
                              },
                            ),
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.r),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: AppColors.form,
                      onChanged: (query) => viewModel.search(query),
                    ),
                  ),
                ),
              ),
              IconButton(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                icon: SvgPicture.asset(
                  AppIcons.filter,
                  height: 24.h,
                  width: 24.h,
                ),
                onPressed:
                    viewModel.busy(SearchLoadingState.init) ? () {} : onTapFilterIcon,
              ),
            ],
          ),
        ),
        const GreyDivider(),
      ],
    );
  }
}
