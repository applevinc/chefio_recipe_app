import 'dart:io';

import 'package:chefio_recipe_app/shared/viewmodels/base_viewmodel.dart';

class ScanFoodResultsViewModel extends BaseViewModel {
  late File image;

  ScanFoodResultsViewModel({required this.image});
}
