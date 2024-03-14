import 'package:chefio_recipe_app/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyRecipesComponent extends StatelessWidget {
  const EmptyRecipesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No recipes found',
        style: AppText.bold500(context).copyWith(
          fontSize: 17.sp,
        ),
      ),
    );
  }
}
