import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/menu/settings/presentation/edit_profile/edit_profile.dart';
import 'package:kabor/features/menu/settings/presentation/edit_profile/provider/edit_profile_provider.dart';

class EditProfilePage extends ConsumerWidget {
  EditProfilePage({super.key});

  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(editProfileProvider.notifier);
    return Scaffold(
      appBar: const KaborAppBar(
        title: 'Edit Profile',
        trailing: AppEditButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Form(
          key: _formKey,
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
              AppTextField(
                prefixIcon: const Icon(Iconsax.user),
                suffixIcon: const Icon(Iconsax.close_circle),
                hintText: 'Full Name',
                controller: _nameController,
              ),
              const Gap(15),
              AppTextField(
                prefixIcon: const Icon(Iconsax.user),
                suffixIcon: const Icon(Iconsax.close_circle),
                hintText: 'Email',
                controller: _nameController,
              ),
              const Spacer(),
              SolidButton(
                text: 'Done',
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    ref.read(editProfileProvider.notifier).onFirstNameChanged(
                          _nameController.text.split(' ').first.trim(),
                        );
                    ref.read(editProfileProvider.notifier).onLastNameChanged(
                          _nameController.text.split(' ').last.trim(),
                        );
                    ref.read(editProfileProvider.notifier).onEmailChanged(
                          '',
                        );
                    ref.read(editProfileProvider.notifier).updateProfile();
                  }
                },
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
