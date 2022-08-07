import 'package:chefio_recipe_app/src/modules/dashboard/components/circular_tab_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProvidersWrapper extends StatelessWidget {
  const ProvidersWrapper({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CircleButtonModelNotifier()),
      ],
      child: child,
    );
  }
}
