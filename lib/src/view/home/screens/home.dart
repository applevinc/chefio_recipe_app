import 'package:chefio_recipe_app/src/view/home/components/appbar.dart';
import 'package:chefio_recipe_app/src/view/home/screens/gridview.dart';
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
