import 'package:chefio_recipe_app/src/core/assets/icons.dart';
import 'package:chefio_recipe_app/src/core/theme/app_colors.dart';
import 'package:chefio_recipe_app/src/core/widgets/textfield.dart';
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
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                SizedBox(height: 16.h),
                const _HorizontalListViewCircleButtons(),
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

class _CircleButtonModel {
  int id;
  String label;
  Color bgColor;
  Color labelColor;

  _CircleButtonModel({
    required this.id,
    required this.label,
    required this.labelColor,
    required this.bgColor,
  });
}

class CircleButtonModelNotifier extends ChangeNotifier {}

class _HorizontalListViewCircleButtons extends StatefulWidget {
  const _HorizontalListViewCircleButtons({
    Key? key,
  }) : super(key: key);

  @override
  State<_HorizontalListViewCircleButtons> createState() =>
      _HorizontalListViewCircleButtonsState();
}

class _HorizontalListViewCircleButtonsState
    extends State<_HorizontalListViewCircleButtons> {
  final _buttons = [
    _CircleButtonModel(
      id: 0,
      label: 'All',
      labelColor: Colors.white,
      bgColor: AppColors.primary,
    ),
    _CircleButtonModel(
      id: 1,
      label: 'Food',
      labelColor: AppColors.secondaryText,
      bgColor: AppColors.form,
    ),
    _CircleButtonModel(
      id: 2,
      label: 'Drink',
      labelColor: AppColors.secondaryText,
      bgColor: AppColors.form,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(_buttons.length, (index) {
        var button = _buttons[index];

        return _CircleButton(
          label: button.label,
          bgColor: button.bgColor,
          labelColor: button.labelColor,
        );
      }),
    );
  }
}

class _CircleButton extends StatelessWidget {
  const _CircleButton({
    Key? key,
    required this.label,
    required this.bgColor,
    required this.labelColor,
  }) : super(key: key);

  final String label;
  final Color bgColor;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 48.h,
        margin: EdgeInsets.only(right: 16.w),
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(32.r),
        ),
        child: Text(
          label,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: labelColor, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
