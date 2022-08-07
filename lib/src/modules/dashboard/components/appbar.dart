import 'package:chefio_recipe_app/src/shared/assets/icons.dart';
import 'package:chefio_recipe_app/src/shared/styles/colors.dart';
import 'package:chefio_recipe_app/src/shared/widgets/others/grey_divider.dart';
import 'package:chefio_recipe_app/src/shared/widgets/inputs/custom_textfield.dart';
import 'package:chefio_recipe_app/src/modules/dashboard/components/circular_tab_button.dart';
import 'package:chefio_recipe_app/src/modules/search/screens/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(278.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      backgroundColor: Colors.white,
      elevation: 0.0,
      toolbarHeight: 218.h,
      title: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(height: 16.h),
                CustomTextField(
                  hintText: 'Search',
                  prefixIcon: AppIcons.search,
                  border: false,
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    showSearch(
                      context: context,
                      delegate: SearchScreen(),
                    );
                  },
                ),
                SizedBox(height: 24.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Category',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: AppColors.headlineText),
                  ),
                ),
                SizedBox(height: 16.h),
                const HorizontalListViewCircleTabButtons(),
                SizedBox(height: 23.h),
              ],
            ),
          ),
          const GreyDivider(),
        ],
      ),
      bottom: const _CustomTabbar(),
    );
  }
}

class _CustomTabbar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomTabbar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(38.h);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.outline,
                  width: 1.h,
                ),
              ),
            ),
          ),
        ),
        TabBar(
          labelColor: const Color(0xff3e5481),
          labelStyle: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontWeight: FontWeight.w600),
          unselectedLabelColor: AppColors.secondaryText,
          unselectedLabelStyle: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontWeight: FontWeight.w600),
          indicatorColor: AppColors.primary,
          indicatorWeight: 3.h,
          tabs: const [
            Tab(text: 'Left'),
            Tab(text: 'Right'),
          ],
        )
      ],
    );
  }
}
