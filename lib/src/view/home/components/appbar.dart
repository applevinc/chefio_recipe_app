import 'package:chefio_recipe_app/src/core/assets/icons.dart';
import 'package:chefio_recipe_app/src/core/theme/colors.dart';
import 'package:chefio_recipe_app/src/core/widgets/textfield.dart';
import 'package:chefio_recipe_app/src/view/home/components/circular_tab_button.dart';
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
                const CustomTextField(
                  hintText: 'Search',
                  prefixIcon: AppIcons.search,
                  border: false,
                ),
                SizedBox(height: 24.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Category',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: AppColors.headlineText
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                const HorizontalListViewCircleTabButtons(),
                SizedBox(height: 23.h),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 8.h,
            color: AppColors.form,
          ),
        ],
      ),
      bottom: TabBar(
        labelColor: const Color(0xff3e5481),
        labelStyle:
            Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w600),
        unselectedLabelColor: AppColors.secondaryText,
        unselectedLabelStyle:
            Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w600),
        indicatorColor: AppColors.primary,
        indicatorWeight: 3.h,
        tabs: const [
          Tab(text: 'Left'),
          Tab(text: 'Right'),
        ],
      ),
    );
  }
}
