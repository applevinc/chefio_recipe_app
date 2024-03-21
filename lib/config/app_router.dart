import 'package:chefio_recipe_app/features/auth/view/sign_up/sign_up.screen.dart';
import 'package:chefio_recipe_app/features/recipe/domain/entities/recipe.dart';
import 'package:chefio_recipe_app/common/models/user.dart';
import 'package:chefio_recipe_app/common/views/dashboard/dashboard.component.dart';
import 'package:chefio_recipe_app/common/views/onboarding/onboarding.screen.dart';
import 'package:chefio_recipe_app/features/recipe/view/grid/detail/recipe_detail.screen.dart';
import 'package:chefio_recipe_app/features/recipe/view/upload/upload_recipe.screen.dart';
import 'package:chefio_recipe_app/features/auth/view/forgot_password/forgot_password.screen.dart';
import 'package:chefio_recipe_app/features/auth/view/sign_in/sign_in.screen.dart';
import 'package:chefio_recipe_app/features/auth/view/sign_up/confirmation/confirm_signup.screen.dart';
import 'package:chefio_recipe_app/features/auth/view/sign_up/create_profile/create_profile.screen.dart';
import 'package:chefio_recipe_app/common/views/home/home.screen.dart';
import 'package:chefio_recipe_app/features/recipe/view/search/search_recipe.screen.dart';
import 'package:chefio_recipe_app/features/notification/notification.dart';
import 'package:chefio_recipe_app/features/profile/screens/profile.screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: OnboardingScreen.route,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: SignInScreen.route,
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: SignUpScreen.route,
      builder: (context, state) => const SignUpScreen(),
      routes: [
        GoRoute(
          path: ConfirmSignUpScreen.routeName,
          builder: (context, state) {
            final email = state.extra as String;
            return ConfirmSignUpScreen(email: email);
          },
        ),
        GoRoute(
          path: CreateProfileScreen.routeName,
          builder: (context, state) => const CreateProfileScreen(),
        ),
      ],
    ),
    GoRoute(
      path: ForgotPasswordScreen.route,
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    GoRoute(
      path: DashBoardComponent.route,
      builder: (context, state) {
        final pageIndex = state.extra as int? ?? 0;
        return DashBoardComponent(pageIndex: pageIndex);
      },
    ),
    GoRoute(
      path: HomeScreen.route,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: NotificationsScreen.route,
      builder: (context, state) => const NotificationsScreen(),
    ),
    GoRoute(
      path: UploadRecipeScreen.route,
      builder: (context, state) => const UploadRecipeScreen(),
    ),
    GoRoute(
      path: SearchRecipeScreen.route,
      builder: (context, state) => const SearchRecipeScreen(),
    ),
    GoRoute(
      path: ProfileScreen.route,
      builder: (context, state) {
        final user = state.extra as User;
        return ProfileScreen(user: user);
      },
    ),
    GoRoute(
      path: RecipeDetailScreen.route,
      builder: (context, state) {
        final recipe = state.extra as Recipe;
        return RecipeDetailScreen(recipe);
      },
    ),
  ],
);
