import 'package:chefio_recipe_app/config/locator/locator.dart';
import 'package:chefio_recipe_app/common/views/home/home.controller.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/repositories/i_recipe_repository.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/repositories/i_search_recipe_repository.dart';
import 'package:chefio_recipe_app/modules/recipe/view/search/search_recipe.controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProvidersWrapper extends StatelessWidget {
  const ProvidersWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeController(
            recipeRepository: locator<IRecipeRepository>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => SearchRecipeController(
            searchService: locator<ISearchRecipeRepository>(),
            recipeRepository: locator<IRecipeRepository>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
