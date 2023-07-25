import 'package:chefio_recipe_app/modules/home/screens/search/components/search_filter_sheet.dart';
import 'package:chefio_recipe_app/shared/assets/icons.dart';
import 'package:chefio_recipe_app/shared/styles/styles.dart';
import 'package:chefio_recipe_app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      init();
    });
  }

  void init() {}

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              prefixIcon: const TextFieldIcon(icon: AppIcons.search),
              suffixIcon: searchController.text.isEmpty
                  ? null
                  : const TextFieldIcon(icon: AppIcons.closeCircle),
              hintText: 'Search',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.r),
                borderSide: BorderSide.none,
              ),
              fillColor: AppColors.form,
              onChanged: (query) {
                setState(() {});
              },
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
    );
  }
}
