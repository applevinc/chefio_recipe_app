import 'package:chefio_recipe_app/modules/scan_food/scan_food.sheet.dart';
import 'package:chefio_recipe_app/common/views/recipe/upload_recipe/upload_recipe_screen.dart';
import 'package:chefio_recipe_app/config/app_session.dart';
import 'package:chefio_recipe_app/modules/home/screens/home.screen.dart';
import 'package:chefio_recipe_app/assets/icons.dart';
import 'package:chefio_recipe_app/styles/colors.dart';
import 'package:chefio_recipe_app/modules/notification/notification.dart';
import 'package:chefio_recipe_app/modules/profile/screens/profile_screen.dart';
import 'package:chefio_recipe_app/styles/text.dart';
import 'package:chefio_recipe_app/utils/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashBoardView extends StatefulWidget {
  const DashBoardView({Key? key}) : super(key: key);

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  int _selectedIndex = 0;

  List<Widget?> _pages = [];

  @override
  void initState() {
    super.initState();

    final authUser = AppSession.authUser;

    if (authUser == null) return;

    _pages = [
      const HomeScreen(),
      const UploadRecipeScreen(),
      null,
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
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: _selectedIndex == 1
          ? null
          : BottomNavigationBar(
              currentIndex: _selectedIndex,
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: AppText.bold500(context).copyWith(fontSize: 12.sp),
              unselectedLabelStyle: AppText.bold500(context).copyWith(fontSize: 12.sp),
              selectedItemColor: AppColors.primary,
              unselectedItemColor: AppColors.secondaryText,
              selectedIconTheme: const IconThemeData(color: AppColors.primary),
              unselectedIconTheme: const IconThemeData(color: AppColors.secondaryText),
              onTap: _onItemTapped,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppIcons.home,
                    color:
                        _selectedIndex == 0 ? AppColors.primary : AppColors.secondaryText,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppIcons.upload,
                    color:
                        _selectedIndex == 1 ? AppColors.primary : AppColors.secondaryText,
                  ),
                  label: 'Upload',
                ),
                const BottomNavigationBarItem(
                  icon: SizedBox.shrink(),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppIcons.notification,
                    color:
                        _selectedIndex == 3 ? AppColors.primary : AppColors.secondaryText,
                  ),
                  label: 'Notification',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppIcons.profile,
                    color:
                        _selectedIndex == 4 ? AppColors.primary : AppColors.secondaryText,
                  ),
                  label: 'Profile',
                ),
              ],
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _selectedIndex == 1
          ? null
          : Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  backgroundColor: AppColors.primary,
                  elevation: 0.0,
                  child: SvgPicture.asset(AppIcons.scan),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return const ScanSheet();
                      },
                    );
                  },
                ),
                SizedBox(height: 8.h),
                Text(
                  'Scan',
                  style: AppText.bold500(context).copyWith(
                    fontSize: 12.sp,
                    color: AppColors.secondaryText,
                  ),
                ),
                SizedBox(height: 12.h),
              ],
            ),
    );
  }
}
