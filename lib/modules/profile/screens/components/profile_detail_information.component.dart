import 'package:chefio_recipe_app/core/models/failure.dart';
import 'package:chefio_recipe_app/core/widgets/buttons/custom_button.dart';
import 'package:chefio_recipe_app/core/widgets/image/custom_cached_network_image.dart';
import 'package:chefio_recipe_app/core/widgets/others/grey_divider.dart';
import 'package:chefio_recipe_app/modules/profile/screens/profile.controller.dart';
import 'package:chefio_recipe_app/styles/styles.dart';
import 'package:chefio_recipe_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfileDetailInformationComponent extends StatefulWidget {
  const ProfileDetailInformationComponent({super.key});

  @override
  State<ProfileDetailInformationComponent> createState() =>
      _ProfileDetailInformationComponentState();
}

class _ProfileDetailInformationComponentState extends State<ProfileDetailInformationComponent> {
  void _handleFollow() async {
    try {
      await context.read<ProfileController>().updateFollowStatus();

      if (!mounted) {
        return;
      }
    } on Failure catch (e) {
      Messenger.error(context: context, message: e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ProfileController>();
    final user = controller.user;
    final bool? isAuthUserProfile = controller.isAuthUserProfile;

    if (isAuthUserProfile == null) {
      return const SizedBox.shrink();
    }

    return SliverPadding(
      padding: EdgeInsets.only(top: 20.h),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: CustomCacheNetworkImage(
                imageUrl: user.photoUrl,
                height: 100.h,
                width: 100.h,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              user.fullName.toTitleCase,
              textAlign: TextAlign.center,
              style: AppText.bold700(context).copyWith(
                fontSize: 17.sp,
              ),
            ),
            SizedBox(height: 24.h),
            Wrap(
              spacing: 55.w,
              children: [
                _CountColumn(label: 'Recipes', count: user.recipeCount),
                _CountColumn(label: 'Following', count: user.followingCount),
                _CountColumn(label: 'Followers', count: user.followersCount),
              ],
            ),
            if (isAuthUserProfile == false)
              Padding(
                padding: EdgeInsets.only(top: 32.h),
                child: AppButton(
                  label: user.isFollowing == true ? 'Unfollow' : 'Follow',
                  showBorder: user.isFollowing == true ? true : false,
                  borderColor: AppColors.primary,
                  labelColor: user.isFollowing == true ? AppColors.primary : Colors.white,
                  backgroundColor:
                      user.isFollowing == true ? Colors.transparent : AppColors.primary,
                  onPressed: _handleFollow,
                ),
              ),
            SizedBox(height: 24.h),
            const GreyDivider(),
          ],
        ),
      ),
    );
  }
}

class _CountColumn extends StatelessWidget {
  const _CountColumn({
    required this.label,
    required this.count,
  });

  final String label;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count.toString(),
          textAlign: TextAlign.center,
          style: AppText.bold700(context).copyWith(
            fontSize: 17.sp,
          ),
        ),
        Text(
          label,
          textAlign: TextAlign.center,
          style: AppText.bold500(context).copyWith(
            fontSize: 12.sp,
            color: const Color(0xFF9FA5C0),
          ),
        ),
      ],
    );
  }
}
