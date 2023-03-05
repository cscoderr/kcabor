import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/authentication/authentication.dart';

class LoginPage extends StatefulHookConsumerWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _emailOrPhoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // useListenable(_emailOrPhoneController);
    // useListenable(_passwordController);
    final passwordObsecure = useState(true);
    final state = ref.watch(loginProvider);

    ref.listen<AsyncValue<void>>(loginProvider, (_, status) {
      status.maybeWhen(
        orElse: () {},
        data: (_) {
          context.pushNamed(AppRoutes.authWelcome);
        },
        error: (error, _) {
          context.errorMessage(error.toString());
        },
      );
    });
    return Scaffold(
      body: KcaborLoader(
        isLoading: state.maybeWhen(
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
                  const Center(
                    child: AppLogo(),
                  ),
                  const Gap(30),
                  Text(
                    'Login',
                    style: context.$style.titleLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const Gap(2),
                  Text(
                    'Type in all your details to login',
                    style: context.$style.bodyLarge?.copyWith(
                      color: AppColors.dark,
                    ),
                  ),
                  const Gap(20),
                  Text(
                    'Email/Phone',
                    style: context.$style.bodyLarge?.copyWith(
                      color: AppColors.dark,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(5),
                  AppTextField(
                    controller: _emailOrPhoneController,
                    hintText: 'Enter your phone or email',
                    validator: AppValidator.emailOrPhone,
                    prefixIcon: const Icon(
                      Iconsax.sms,
                      color: AppColors.dark4,
                    ),
                  ),
                  const Gap(20),
                  Text(
                    'Password',
                    style: context.$style.bodyLarge?.copyWith(
                      color: AppColors.dark,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(5),
                  AppTextField(
                    controller: _passwordController,
                    hintText: 'Enter your password ',
                    obsecureText: passwordObsecure.value,
                    validator: AppValidator.loginPassword,
                    prefixIcon: const Icon(
                      Iconsax.lock_14,
                      color: AppColors.dark4,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () =>
                          passwordObsecure.value = !passwordObsecure.value,
                      child: Icon(
                        passwordObsecure.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye,
                        color: AppColors.dark4,
                      ),
                    ),
                  ),
                  const Gap(10),
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot your Password',
                        style: context.$style.titleSmall?.copyWith(
                          color: AppColors.primaryColor,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const Gap(10),
                  SolidButton(
                    text: 'Log in',
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        ref.read(loginProvider.notifier).login(
                              email: _emailOrPhoneController.text,
                              password: _passwordController.text,
                            );
                      }
                    },
                  ),
                  const Gap(20),
                  SolidButton(
                    color: AppColors.dark,
                    border: BorderSide.none,
                    onPressed: () => context.pushNamed(AppRoutes.authWelcome),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppIcons.apple),
                        const Gap(20),
                        Text(
                          'Log In with Apple',
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(20),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: AppColors.primaryColor,
                            ),
                          ),
                          child: Image.asset(
                            AppIcons.facebook,
                            height: 25,
                            width: 25,
                          ),
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: AppColors.primaryColor,
                            ),
                          ),
                          child: SvgPicture.asset(
                            AppIcons.google,
                            height: 25,
                            width: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(20),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have a Kaabor account ? ",
                        style: context.$style.titleSmall,
                        children: [
                          TextSpan(
                            text: 'Create account',
                            style: context.$style.titleSmall!.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () =>
                                  context.pushNamed(AppRoutes.phoneNumber),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Gap(10),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Sign up as an artisan. ',
                        style: context.$style.titleSmall,
                        children: [
                          TextSpan(
                            text: 'Sign up',
                            style: context.$style.titleSmall!.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () =>
                                  context.pushNamed(AppRoutes.phoneNumber),
                          )
                        ],
                      ),
                    ),
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
