import 'package:chefio_recipe_app/common/views/dashboard/dashboard.controller.dart';
import 'package:chefio_recipe_app/modules/recipe/view/upload_recipe/upload_recipe.screen.dart';
import 'package:chefio_recipe_app/assets/icons.dart';
import 'package:chefio_recipe_app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class DashBoardComponent extends StatelessWidget {
  const DashBoardComponent({super.key, this.pageIndex = 0});

  static String route = '/dashboard';

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DashboardController(pageIndex: pageIndex),
      child: const _DashBoardComponent(),
    );
  }
}

class _DashBoardComponent extends StatelessWidget {
  const _DashBoardComponent();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<DashboardController>();
    final fontStyle = AppText.bold500(context).copyWith(fontSize: 12.sp);

    return Scaffold(
      body: controller.currentPage,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              offset: const Offset(0, -1),
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: controller.pageIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedLabelStyle: fontStyle,
          unselectedLabelStyle: fontStyle,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.secondaryText,
          items: <BottomNavigationBarItem>[
            bottomNavigationBarItem(
              label: 'Home',
              icon: DashboardIcons.home,
              activeIcon: DashboardIcons.homeActive,
            ),
            bottomNavigationBarItem(
              label: 'Upload',
              icon: DashboardIcons.upload,
              activeIcon: DashboardIcons.upload,
            ),
            bottomNavigationBarItem(
              label: 'Notification',
              icon: DashboardIcons.notification,
              activeIcon: DashboardIcons.notificationActive,
            ),
            bottomNavigationBarItem(
              label: 'Profile',
              icon: DashboardIcons.profile,
              activeIcon: DashboardIcons.profileActive,
            ),
          ],
          onTap: (index) {
            if (index == 1) {
              context.push(UploadRecipeScreen.route);
              return;
            }

            controller.setPageIndex(index);
          },
        ),
      ),
    );
  }

  BottomNavigationBarItem bottomNavigationBarItem({
    required String label,
    required String icon,
    required String activeIcon,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(icon),
      activeIcon: SvgPicture.asset(activeIcon),
      label: label,
    );
  }
}
