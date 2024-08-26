import 'package:chefio_recipe_app/modules/profile/screens/profile.controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileAppBarComponent extends StatelessWidget {
  const ProfileAppBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final isAuthUserProfile = context.read<ProfileController>().isAuthUserProfile;

    if (isAuthUserProfile == null || isAuthUserProfile) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    return const SliverToBoxAdapter(
      child: Row(
        children: [
          BackButton(),
          Spacer(),
          IgnorePointer(
            ignoring: true,
            child: BackButton(color: Colors.transparent),
          ),
        ],
      ),
    );
  }
}
