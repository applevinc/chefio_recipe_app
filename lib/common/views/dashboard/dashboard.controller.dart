import 'package:chefio_recipe_app/features/recipe/view/upload/upload_recipe.screen.dart';
import 'package:chefio_recipe_app/config/app_session.dart';
import 'package:chefio_recipe_app/common/views/home/home.screen.dart';
import 'package:chefio_recipe_app/features/notification/notification.dart';
import 'package:chefio_recipe_app/features/profile/screens/profile.screen.dart';
import 'package:chefio_recipe_app/utils/utils.dart';
import 'package:flutter/material.dart';

class DashboardController extends ViewController {
  DashboardController({required int pageIndex}) {
    _pageIndex = pageIndex;

    pages = [
      const HomeScreen(),
      const UploadRecipeScreen(),
      const NotificationsScreen(),
      if (AppSession.authUser != null) ProfileScreen(user: AppSession.authUser!),
    ];
  }

  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  late final List<Widget> pages;

  Widget get currentPage => pages[pageIndex];

  void setPageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }
}
