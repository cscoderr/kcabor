import 'package:app_models/app_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/authentication/authentication.dart';

class FullNamePage extends StatefulHookConsumerWidget {
  const FullNamePage({super.key});

  @override
  ConsumerState<FullNamePage> createState() => _FullNamePageState();
}

class _FullNamePageState extends ConsumerState<FullNamePage> {
  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final checkEmail = ref.watch(checkEmailVMProvider);
    final authModel = ref.watch(authModelProvider);
    useListenable(_emailController);
    useListenable(_firstNameController);
    useListenable(_lastNameController);

    ref.listen<AsyncValue<BaseModel>>(checkEmailVMProvider, (_, state) {
      state.maybeWhen(
        data: (data) {
          final authData = authModel.copyWith(
            firstName: _firstNameController.text,
            lastName: _lastNameController.text,
            email: _emailController.text,
          );
          ref.read(authModelProvider.notifier).update((state) => authData);
          context.pushNamed(
            AppRoutes.codeVerification,
            queryParams: {
              'email': _emailController.text,
            },
          );
        },
        error: (error, _) {
          context.errorMessage(error.toString());
        },
        orElse: () {},
      );
    });
    return Scaffold(
      body: KcaborLoader(
        isLoading: checkEmail.maybeWhen(
          orElse: () => false,
          loading: () => true,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppBackButton(),
                  const Gap(20),
                  Text(
                    'Enter your details',
                    style: context.$style.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Drivers will confirm it’s you upon arrival',
                    style: context.$style.titleMedium,
                  ),
                  const Gap(15),
                  AppTextField(
                    controller: _firstNameController,
                    hintText: 'Enter your first name',
                    keyboardType: TextInputType.text,
                    validator: AppValidator.firstName,
                    prefixIcon: const Icon(
                      Iconsax.user,
                      color: AppColors.dark,
                    ),
                  ),
                  const Gap(20),
                  AppTextField(
                    controller: _lastNameController,
                    hintText: 'Enter your last name',
                    keyboardType: TextInputType.text,
                    validator: AppValidator.lastName,
                    prefixIcon: const Icon(
                      Iconsax.user,
                      color: AppColors.dark,
                    ),
                  ),
                  const Gap(20),
                  AppTextField(
                    controller: _emailController,
                    hintText: 'Enter your email',
                    keyboardType: TextInputType.emailAddress,
                    validator: AppValidator.email,
                    prefixIcon: const Icon(
                      Iconsax.sms,
                      color: AppColors.dark,
                    ),
                  ),
                  const Spacer(),
                  SolidButton(
                    text: 'Next',
                    onPressed: (_formKey.currentState?.validate() ?? false)
                        ? () => ref
                            .read(checkEmailVMProvider.notifier)
                            .checkEmail(_emailController.text)
                        : null,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
