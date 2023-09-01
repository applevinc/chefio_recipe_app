import 'package:chefio_recipe_app/modules/recipe/screens/upload_recipe/upload_recipe_viewmodel.dart';
import 'package:chefio_recipe_app/modules/shared/cooking_duration/cooking_duration_view.dart';
import 'package:chefio_recipe_app/shared/assets/icons.dart';
import 'package:chefio_recipe_app/shared/styles/colors.dart';
import 'package:chefio_recipe_app/shared/styles/text.dart';
import 'package:chefio_recipe_app/shared/utils/messenger.dart';
import 'package:chefio_recipe_app/shared/widgets/buttons/custom_button.dart';
import 'package:chefio_recipe_app/shared/widgets/inputs/custom_textfield.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class UploadRecipeStepOneView extends StatefulWidget {
  const UploadRecipeStepOneView({Key? key}) : super(key: key);

  @override
  State<UploadRecipeStepOneView> createState() => _UploadRecipeStepOneViewState();
}

class _UploadRecipeStepOneViewState extends State<UploadRecipeStepOneView> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController foodNameController;
  late final TextEditingController foodDescriptionController;

  @override
  void initState() {
    super.initState();
    foodNameController = TextEditingController();
    foodDescriptionController = TextEditingController();
  }

  @override
  void dispose() {
    foodNameController.dispose();
    foodDescriptionController.dispose();
    super.dispose();
  }

  void moveToNext() {
    if (_formKey.currentState!.validate()) {
      final viewModel = context.read<UploadRecipeViewModel>();

      if (viewModel.coverPhoto == null) {
        Messenger.error(context: context, message: 'Cover photo is required');
        return;
      }

      viewModel.pageController.jumpToPage(1);
      viewModel.setPageNo(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const _CoverPhotoView(),
            SizedBox(height: 24.h),
            CustomTextField(
              title: 'Food Name',
              hintText: 'Enter food name',
              controller: foodNameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your food name';
                }
                return null;
              },
            ),
            SizedBox(height: 24.h),
            CustomTextField(
              title: 'Description',
              hintText: 'Tell a little about your food',
              controller: foodDescriptionController,
              maxLines: 3,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(
                  color: Color(0xffd0dbea),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter tell us about your food';
                }
                return null;
              },
            ),
            SizedBox(height: 24.h),
            const CookingDurationView<UploadRecipeViewModel>(),
            SizedBox(height: 60.h),
            AppButton(
              label: 'NEXT',
              onPressed: moveToNext,
            ),
          ],
        ),
      ),
    );
  }
}

class _CoverPhotoView extends StatelessWidget {
  const _CoverPhotoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<UploadRecipeViewModel>();
    final coverPhoto = viewModel.coverPhoto;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: coverPhoto == null ? viewModel.pickCoverPhoto : null,
          child: DottedBorder(
            borderType: BorderType.RRect,
            dashPattern: [8.w, 4.w],
            color: AppColors.outline,
            radius: Radius.circular(16.r),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16.r)),
              child: Builder(
                builder: (context) {
                  if (coverPhoto == null) {
                    return addCoverPhotoView(context);
                  }

                  return Image.file(
                    coverPhoto,
                    width: 327.w,
                    height: 161.h,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
        ),
        if (coverPhoto != null)
          Positioned(
            top: -5.h,
            right: -4.w,
            child: GestureDetector(
              onTap: viewModel.removeCoverPhoto,
              child: Container(
                padding: EdgeInsets.all(5.sp),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x07000000),
                      blurRadius: 26.79,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.close,
                  size: 14.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget addCoverPhotoView(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 17.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              AppIcons.uploadImage,
              width: 64.h,
              height: 64.h,
            ),
          ),
          SizedBox(height: 16.h),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Add Cover Photo',
              style: AppText.bold700(context).copyWith(
                color: AppColors.headlineText,
                fontWeight: FontWeight.w700,
                fontSize: 15.sp,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            '(up to 12 Mb)',
            style: AppText.bold500(context).copyWith(
              fontSize: 12.sp,
              color: AppColors.secondaryText,
            ),
          ),
        ],
      ),
    );
  }
}
