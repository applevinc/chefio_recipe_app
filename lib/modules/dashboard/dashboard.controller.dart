import 'package:chefio_recipe_app/modules/recipe/view/upload/upload_recipe.screen.dart';
import 'package:chefio_recipe_app/config/app_session.dart';
import 'package:chefio_recipe_app/modules/home/home.screen.dart';
import 'package:chefio_recipe_app/modules/notification/notification.dart';
import 'package:chefio_recipe_app/modules/profile/screens/profile.screen.dart';
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
