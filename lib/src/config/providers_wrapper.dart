import 'package:chefio_recipe_app/src/config/locator/locator.dart';
import 'package:chefio_recipe_app/src/modules/auth/screens/sign_in/sign_in_viewmodel.dart';
import 'package:chefio_recipe_app/src/modules/auth/services/interfaces/i_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProvidersWrapper extends StatelessWidget {
  const ProvidersWrapper({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignInViewModel(authService: locator<IAuthService>())),
      ],
      child: child,
    );
  }
}
