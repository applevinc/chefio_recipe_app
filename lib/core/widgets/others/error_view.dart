import 'package:chefio_recipe_app/core/models/failure.dart';
import 'package:chefio_recipe_app/styles/text.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    super.key,
    required this.error,
    required this.refetch,
    this.iconSize = 100,
  });

  final Failure? error;
  final double iconSize;
  final Function() refetch;

  @override
  Widget build(BuildContext context) {
    String message = '';

    if (error != null) {
      message = error!.message;
    } else {
      message = InternalFailure().message;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error,
          size: iconSize,
          color: Colors.red,
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 30, right: 30),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: AppText.bold600(context).copyWith(
                fontSize: 14,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: refetch,
          child: const Icon(Icons.refresh),
        ),
      ],
    );
  }
}
