import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/authentication/authentication.dart';
import 'package:kabor/features/authentication/data/models/auth_model.dart';

class CreatePasswordPage extends StatefulHookConsumerWidget {
  const CreatePasswordPage({super.key});

  @override
  ConsumerState<CreatePasswordPage> createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends ConsumerState<CreatePasswordPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _refCodeController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _refCodeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final register = ref.watch(registerVMProvider);
    final authModel = ref.watch(authModelProvider);
    final passwordObsecure = useState(true);
    final confirmPasswordObsecure = useState(true);

    ref.listen<AsyncValue<void>>(registerVMProvider, (_, state) {
      state.maybeWhen(
        data: (data) {
          context.replaceNamed(AppRoutes.authWelcome);
        },
        error: (error, _) {
          context.errorMessage(error.toString());
        },
        orElse: () {},
      );
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBackButton(),
              const Gap(20),
              Text(
                'Create a password ',
                style: context.$style.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const Gap(5),
              Text(
                'Secure your account',
                style: context.$style.titleMedium,
              ),
              const Gap(20),
              AppTextField(
                controller: _passwordController,
                obsecureText: passwordObsecure.value,
                prefixIcon: const Icon(
                  Iconsax.lock_14,
                  color: AppColors.dark,
                ),
                hintText: 'Minimum of 8 characters',
                suffixIcon: GestureDetector(
                  onTap: () => passwordObsecure.value = !passwordObsecure.value,
                  child: Icon(
                    passwordObsecure.value ? Iconsax.eye_slash : Iconsax.eye,
                    color: AppColors.dark4,
                  ),
                ),
              ),
              const Gap(20),
              AppTextField(
                controller: _confirmPasswordController,
                obsecureText: confirmPasswordObsecure.value,
                prefixIcon: const Icon(
                  Iconsax.lock_14,
                  color: AppColors.dark,
                ),
                suffixIcon: GestureDetector(
                  onTap: () => confirmPasswordObsecure.value =
                      !confirmPasswordObsecure.value,
                  child: Icon(
                    confirmPasswordObsecure.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye,
                    color: AppColors.dark4,
                  ),
                ),
                hintText: 'Confirm password',
              ),
              const Gap(20),
              AppTextField(
                controller: _refCodeController,
                prefixIcon: const Icon(
                  Iconsax.share,
                  color: AppColors.dark,
                ),
                hintText: 'Enter referral code (optional)',
              ),
              const Spacer(),
              SolidButton(
                text: 'Save',
                onPressed: () => _submit(authModel),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit(AuthModel model) {
    final authData = model.copyWith(
      password: _passwordController.text,
      refCode: _refCodeController.text,
    );
    ref.read(authModelProvider.notifier).update((state) => authData);
    ref.read(registerVMProvider.notifier).register(authData);
  }
}
