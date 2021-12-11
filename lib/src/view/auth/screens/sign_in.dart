import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'Welcome Back',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(height: 8.0.h),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Please enter your account here',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15.0.sp),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.r),
              ),
            ),
          )
        ],
      ),
    );
  }
}
