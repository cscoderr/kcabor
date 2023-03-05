import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor_driver/core/core.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KaborAppBar(
        title: 'Edit Profile',
        trailing: AppEditButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage(AppImages.chat),
                ),
                Positioned(
                  bottom: -5,
                  right: -2,
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Iconsax.edit_25,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(30),
            const AppTextField(
              prefixIcon: Icon(Iconsax.user),
              suffixIcon: Icon(Iconsax.close_circle),
              hintText: 'Full Name',
            ),
            const Spacer(),
            SolidButton(
              text: 'Done',
              onPressed: () {},
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
