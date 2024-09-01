import 'package:chefio_recipe_app/core/models/failure.dart';
import 'package:chefio_recipe_app/core/widgets/others/loading_overlay_view.dart';
import 'package:chefio_recipe_app/modules/auth/view/otp/otp.controller.dart';
import 'package:chefio_recipe_app/modules/auth/widgets/auth_view.dart';
import 'package:chefio_recipe_app/styles/colors.dart';
import 'package:chefio_recipe_app/styles/text.dart';
import 'package:chefio_recipe_app/core/widgets/buttons/custom_button.dart';
import 'package:chefio_recipe_app/core/widgets/inputs/otp_textfield.dart';
import 'package:chefio_recipe_app/utils/navigator.dart';
import 'package:chefio_recipe_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class OTPScreen<T extends OtpController> extends StatefulWidget {
  const OTPScreen({super.key, required this.nextRoute});

  final Widget nextRoute;

  @override
  State<OTPScreen<T>> createState() => _OTPScreenState<T>();
}

class _OTPScreenState<T extends OtpController> extends State<OTPScreen<T>> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      init();
    });
  }

  void init() {
    context.read<T>().startTimer();
  }

  void verify() async {
    try {
      await context.read<T>().verify();

      if (!mounted) {
        return;
      }

      context.go(widget.nextRoute);
      Messenger.success(context: context, message: 'Otp verified');
    } on Failure catch (e) {
      Messenger.error(context: context, message: e.message);
    }
  }

  void resendOtp() async {
    try {
      await context.read<T>().resendOtp();

      if (!mounted) {
        return;
      }

      Messenger.success(context: context, message: 'Code sent');
    } on Failure catch (e) {
      Messenger.error(context: context, message: e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<T>();

    return LoadingOverlayView(
      showOverLay: controller.anyObjectsBusy,
      child: AuthView(
        title: 'Check your email',
        subtitle: 'We\'ve sent the code to your email',
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              OTPField(controller: controller.textController),
              SizedBox(height: 48.h),
              _CodeExpiration<T>(),
              SizedBox(height: 24.h),
              AppButton(
                label: 'Verify',
                onPressed: verify,
              ),
              SizedBox(height: 16.h),
              AppButton(
                label: 'Send again',
                labelColor: AppColors.secondaryText,
                showBorder: true,
                backgroundColor: Colors.transparent,
                loadingIndicatorColor: AppColors.primary,
                onPressed: resendOtp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CodeExpiration<T extends OtpController> extends StatelessWidget {
  const _CodeExpiration({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppText.bold500(context).copyWith(
      fontSize: 15.sp,
    );
    final controller = context.watch<T>();

    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "code expires in:",
              style: style,
            ),
            const TextSpan(text: " "),
            TextSpan(
              text: controller.timeLeft,
              style: style.copyWith(color: AppColors.secondary),
            ),
          ],
        ),
      ),
    );
  }
}
