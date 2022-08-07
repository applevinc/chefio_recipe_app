import 'package:chefio_recipe_app/src/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddIngredient extends StatelessWidget {
  const AddIngredient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        side: const BorderSide(color: AppColors.outline),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.add, color: AppColors.headlineText),
          SizedBox(width: 5.w),
          Text(
            'Ingredient',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: AppColors.headlineText),
          ),
        ],
      ),
      onPressed: () {},
    );
  }
}
