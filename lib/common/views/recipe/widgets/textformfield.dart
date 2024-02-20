import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadFormField extends StatelessWidget {
  const UploadFormField({
    super.key,
    required this.label,
    required this.hintText,
    this.maxLines,
  });

  final String label;
  final String hintText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(height: 10.h),
        TextFormField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodyLarge,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.r),
              borderSide: const BorderSide(
                //color: AppColors.outline,
                width: 1.0,
                style: BorderStyle.solid,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
