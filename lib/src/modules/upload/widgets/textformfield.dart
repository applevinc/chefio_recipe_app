import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadFormField extends StatelessWidget {
  const UploadFormField({
    Key? key,
    required this.label,
    required this.hintText,
    this.maxLines,
  }) : super(key: key);

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
          style: Theme.of(context).textTheme.bodyText2,
        ),
        SizedBox(height: 10.h),
        TextFormField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodyText1,
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
