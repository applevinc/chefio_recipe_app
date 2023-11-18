import 'package:chefio_recipe_app/common/views/recipe/upload_recipe/upload_recipe_screen.dart';
import 'package:chefio_recipe_app/config/app_session.dart';
import 'package:chefio_recipe_app/modules/home/screens/home.screen.dart';
import 'package:chefio_recipe_app/assets/icons.dart';
import 'package:chefio_recipe_app/modules/notification/notification.dart';
import 'package:chefio_recipe_app/modules/profile/screens/profile_screen.dart';
import 'package:chefio_recipe_app/styles/styles.dart';
import 'package:chefio_recipe_app/utils/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashBoardView extends StatefulWidget {
  const DashBoardView({Key? key, this.pageIndex = 0}) : super(key: key);

  final int pageIndex;

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  late int selectedPageIndex = widget.pageIndex;

  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();

    final authUser = AppSession.authUser;

    if (authUser == null) return;

    _pages = [
      const HomeScreen(),
      const UploadRecipeScreen(),
      const NotificationsScreen(),
      ProfileScreen(user: authUser),
    ];
  }

  void _onItemTapped(int index) {
    if (index == 1) {
      AppNavigator.to(context, const UploadRecipeScreen());
      return;
    }

    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(selectedPageIndex),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: selectedPageIndex == 1
          ? null
          : BottomNavigationBar(
              currentIndex: selectedPageIndex,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedLabelStyle: AppText.bold500(context).copyWith(fontSize: 12.sp),
              unselectedLabelStyle: AppText.bold500(context).copyWith(fontSize: 12.sp),
              selectedItemColor: AppColors.primary,
              unselectedItemColor: AppColors.secondaryText,
              onTap: _onItemTapped,
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
