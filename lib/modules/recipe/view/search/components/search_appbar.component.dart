import 'dart:io';

import 'package:chefio_recipe_app/core/widgets/others/back_drop.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/requests/search_filter.request.dart';
import 'package:chefio_recipe_app/modules/recipe/view/search/sheets/filter/search_filter.sheet.dart';
import 'package:chefio_recipe_app/modules/recipe/view/search/search_recipe.controller.dart';
import 'package:chefio_recipe_app/assets/icons.dart';
import 'package:chefio_recipe_app/styles/styles.dart';
import 'package:chefio_recipe_app/core/widgets/widgets.dart';
import 'package:chefio_recipe_app/utils/navigator.dart';
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
  void onTapFilterIcon() async {
    final controller = context.read<SearchRecipeController>();
    final catergories = controller.categories;

    if (catergories.isEmpty) {
      return;
    }

    final result = await showModalBottomSheet(
      context: context,
      builder: (context) => SearchFilterSheet(categories: catergories),
    );

    if (result == null) {
      return;
    }

    final request = result as SearchFilterRequest;
    await controller.searchByFilter(request);
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SearchRecipeController>();
    final queryController = controller.queryController;

    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10.h),
      child: Column(
        children: [
          DashBackDrop(
            child: Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    icon: Icon(
                      Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
                      color: AppColors.mainText,
                      size: 24.sp,
                    ),
                    onPressed: () {
                      context.pop();
                    },
                  ),
                  Expanded(
                    child: Hero(
                      tag: 'search',
                      child: Material(
                        type: MaterialType.transparency,
                        child: CustomTextField(
                          controller: queryController,
                          autofocus: true,
                          readOnly: controller.busy(SearchLoadingState.init),
                          prefixIcon: const TextFieldIcon(icon: AppIcons.search),
                          suffixIcon: queryController.text.isEmpty
                              ? null
                              : TextFieldIcon(
                                  icon: AppIcons.closeCircle,
                                  onTap: () {
                                    queryController.clear();
                                    setState(() {});
                                  },
                                ),
                          hintText: 'Search',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.r),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: AppColors.form,
                          onChanged: (query) => controller.search(query),
                        ),
                      ),
                    ),
                  ),
                  if (controller.busy(SearchLoadingState.init))
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: SizedBox(
                        width: 24.h,
                        height: 24.h,
                      ),
                    ),
                  if (!controller.busy(SearchLoadingState.init))
                    IconButton(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      icon: SvgPicture.asset(
                        AppIcons.filter,
                        height: 24.h,
                        width: 24.h,
                      ),
                      onPressed: onTapFilterIcon,
                    ),
                ],
              ),
            ),
          ),
          const GreyDivider(),
        ],
      ),
    );
  }
}
