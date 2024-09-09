import 'package:chefio_recipe_app/config/locator/locator.dart';
import 'package:chefio_recipe_app/modules/profile/domain/repositories/i_user_repository.dart';
import 'package:chefio_recipe_app/modules/profile/screens/components/profile_appbar.component.dart';
import 'package:chefio_recipe_app/modules/profile/screens/components/profile_detail_information.component.dart';
import 'package:chefio_recipe_app/modules/profile/screens/components/profile_tabs.component.dart';
import 'package:chefio_recipe_app/modules/profile/screens/profile.controller.dart';
import 'package:chefio_recipe_app/modules/profile/screens/tabs/profile_recipes.component.dart';
import 'package:chefio_recipe_app/modules/profile/screens/tabs/profile_recipes.controller.dart';
import 'package:chefio_recipe_app/modules/auth/domain/entities/user.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/repositories/i_recipe_list_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileController(
        user,
        userRepository: locator<IUserRepository>(),
      ),
      child: const _ProfileScreen(),
    );
  }
}

class _ProfileScreen extends StatelessWidget {
  const _ProfileScreen();

  @override
  Widget build(BuildContext context) {
    final user = context.read<ProfileController>().user;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                const ProfileAppBarComponent(),
                const ProfileDetailInformationComponent(),
                const ProfileTabsComponent(),
              ];
            },
            body: MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (_) => UserRecipesController(
                    user: user,
                    recipeListRepository: locator<IRecipeListRepository>(),
                  ),
                ),
                ChangeNotifierProvider(
                  create: (_) => UserLikedRecipesController(
                    user: user,
                    recipeListRepository: locator<IRecipeListRepository>(),
                  ),
                ),
              ],
              child: const TabBarView(
                children: [
                  ProfileRecipesTabComponent<UserRecipesController>(),
                  ProfileRecipesTabComponent<UserLikedRecipesController>(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
