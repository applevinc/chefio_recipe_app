import 'package:chefio_recipe_app/modules/home/screens/search/components/search_filter_sheet.dart';
import 'package:chefio_recipe_app/modules/home/screens/search/search_viewmodel.dart';
import 'package:chefio_recipe_app/shared/assets/icons.dart';
import 'package:chefio_recipe_app/shared/styles/styles.dart';
import 'package:chefio_recipe_app/shared/widgets/widgets.dart';
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

  @override
  Widget build(BuildContext context) {
    final viewmodel = context.watch<SearchViewModel>();

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.h, bottom: 24.h),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.chevron_left,
                  color: AppColors.mainText,
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: CustomTextField(
                  controller: searchController,
                  autofocus: true,
                  readOnly: viewmodel.busy(SearchLoadingState.init),
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
                  onChanged: (query) => viewmodel.execute(query),
                ),
              ),
              SizedBox(width: 10.w),
              IconButton(
                padding: EdgeInsets.only(right: 24.w),
                icon: SvgPicture.asset(AppIcons.filter),
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());

                  showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => const SearchFilterSheet(),
                  );
                },
              ),
            ],
          ),
        ),
        const GreyDivider(),
      ],
    );
  }
}
