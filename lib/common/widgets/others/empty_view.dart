import 'package:chefio_recipe_app/styles/text.dart';
import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({
    super.key,
    required this.title,
    required this.refetch,
  });

  final String title;
  final Function() refetch;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            title,
            style: AppText.bold600(context).copyWith(
              fontSize: 14,
            ),
          ),
        ),
        TextButton(
          onPressed: refetch,
          child: const Icon(Icons.refresh),
        ),
      ],
    );
  }
}
