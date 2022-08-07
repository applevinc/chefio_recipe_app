import 'package:chefio_recipe_app/src/modules/dashboard/components/appbar.dart';
import 'package:chefio_recipe_app/src/modules/dashboard/screens/gridview.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: HomeAppBar(),
        body: GridViewBody(),
      ),
    );
  }
}
