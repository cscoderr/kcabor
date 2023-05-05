import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kabor/app/app.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/menu/settings/presentation/edit_profile/edit_profile.dart';

import 'package:kabor/features/menu/settings/presentation/edit_profile/widgets/show_profile_pic_bottom.dart';

class EditProfilePage extends HookConsumerWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var img = File('');
    final state = ref.watch(editProfileProvider);
    final user = ref.read(appVMProvider.select((value) => value.user));
    final firstNameController = useTextEditingController(
      text: user.fName,
    );
    final lastNameController = useTextEditingController(
      text: user.lName,
    );
    final emailController = useTextEditingController(
      text: user.email,
    );

    ref.listen<EditProfileState>(editProfileProvider, (_, state) {
      if (state.status == EditProfileStatus.success) {
        // ref.read(appVMProvider.notifier).updateUser();
        context.successMessage(state.successMessage);
        // Navigator.pop(context);

        // context.pop();
      } else if (state.status == EditProfileStatus.error) {
        context.errorMessage(state.errorMessage);
      }
    });

    return KcaborLoader(
      isLoading: state.status == EditProfileStatus.loading,
      child: StatefulBuilder(
        builder: (context, setState) {
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
                    // clipBehavior: Clip.none,
                    children: [
                      InkResponse(
                        onTap: () => selectProfilePiclSheeet(context, (imgg) {
                          setState(
                            () {
                              img = imgg ?? File('');
                            },
                          );
                        }),
                        child: img.path.isNotEmpty
                            ? CircleAvatar(
                                radius: 35,
                                backgroundImage: FileImage(
                                  File(img.path),
                                ),
                              )
                            : Container(
                                height: MediaQuery.of(context).size.height * .1,
                                width: MediaQuery.of(context).size.width * .2,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: const Center(
                                  child: Icon(Icons.account_circle_outlined),
                                ),
                              ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkResponse(
                          onTap: () => selectProfilePiclSheeet(context, (imgg) {
                            setState(
                              () {
                                img = imgg ?? File('');
                              },
                            );
                          }),
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
                      ),
                    ],
                  ),
                  const Gap(30),
                  AppTextField(
                    prefixIcon: const Icon(Iconsax.user),
                    hintText: 'First Name',
                    onChanged: ref
                        .read(editProfileProvider.notifier)
                        .onFirstNameChanged,
                    controller: firstNameController,
                  ),
                  const Gap(20),
                  AppTextField(
                    prefixIcon: const Icon(Iconsax.user),
                    hintText: 'Last Name',
                    onChanged: ref
                        .read(editProfileProvider.notifier)
                        .onLastNameChanged,
                    controller: lastNameController,
                  ),
                  const Gap(20),
                  AppTextField(
                    prefixIcon: const Icon(Iconsax.user),
                    onChanged:
                        ref.read(editProfileProvider.notifier).onEmailChanged,
                    // suffixIcon: const Icon(Iconsax.close_circle),
                    hintText: 'Email',
                    controller: emailController,
                  ),
                  const Spacer(),
                  SolidButton(
                    text: 'Done',
                    onPressed: ref.read(editProfileProvider.notifier).isValid
                        ? () {
                            ref
                                .read(editProfileProvider.notifier)
                                .onImagehanged(img);
                            ref
                                .read(editProfileProvider.notifier)
                                .updateProfile();
                          }
                        : null,
                  ),
                  const Gap(20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
