import 'package:chefio_recipe_app/src/core/assets/icons.dart';
import 'package:chefio_recipe_app/src/core/theme/colors.dart';
import 'package:chefio_recipe_app/src/view/home/screens/home.dart';
import 'package:chefio_recipe_app/src/view/notification/notification.dart';
import 'package:chefio_recipe_app/src/view/profile/profile.dart';
import 'package:chefio_recipe_app/src/view/scan/scan.dart';
import 'package:chefio_recipe_app/src/view/upload/screens/upload.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    UploadScreen(),
    ScanScreen(),
    NotificationsScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
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
              selectedLabelStyle: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 12.sp, color: AppColors.primary),
              unselectedLabelStyle:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12.sp),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ScanScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 8.h),
                Text(
                  'Scan',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12.sp),
                ),
                SizedBox(height: 12.h),
              ],
            ),
    );
  }
}
