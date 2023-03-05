import 'package:app_models/app_models.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/authentication/authentication.dart';
import 'package:kabor/features/authentication/data/models/auth_model.dart';

class CodeVerificationPage extends StatefulHookConsumerWidget {
  const CodeVerificationPage({
    super.key,
    this.phoneNumber,
    this.countryCode,
    this.email,
    this.verificationType = VerificationType.phone,
  });
  final String? phoneNumber;
  final String? countryCode;
  final VerificationType verificationType;
  final String? email;

  @override
  ConsumerState createState() => _CodeVerificationPageState();
}

class _CodeVerificationPageState extends ConsumerState<CodeVerificationPage> {
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();
  String? _email;

  @override
  void initState() {
    super.initState();
    _email = widget.email;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final verifyOtpVM = ref.watch(verifyOtpVMProvider);
    final verifyEmail = ref.watch(verifyEmailVMProvider);
    final authModel = ref.watch(authModelProvider);
    useListenable(_otpController);

    phoneNumberListener(authModel);
    emailListener(authModel);

    return Scaffold(
      body: KcaborLoader(
        isLoading: verifyOtpVM.isLoading || verifyEmail.isLoading,
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
                  _buildTitle(),
                  const Gap(20),
                  RichText(
                    text: TextSpan(
                      text: 'Enter the code sent to ',
                      style: context.$style.titleMedium,
                      children: [
                        TextSpan(
                          text: receipentText,
                          style: context.$style.titleMedium!.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Gap(10),
                  AppOtpTextField(
                    otpController: _otpController,
                    onCompleted: (value) => _submit(),
                  ),
                  const Gap(5),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Didn't receive code ? ",
                        style: context.$style.titleMedium,
                        children: [
                          TextSpan(
                            text: 'Resend code',
                            style: context.$style.titleMedium!.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // ref.read(
                                //   resendOtpProvider(
                                //     phone: widget.phoneNumber!,
                                //     countryCode: widget.countryCode!,
                                //   ),
                                // );
                              },
                          )
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  SolidButton(
                    text: 'Next',
                    onPressed: isValid ? _submit : null,
                    //context.pushNamed(AppRoutes.fullName),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    if (widget.verificationType == VerificationType.email) {
      return Text(
        'Check your email?',
        style: context.$style.headlineMedium!.copyWith(
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      );
    }
    return Text(
      "What's the code?",
      style: context.$style.headlineMedium!.copyWith(
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    );
  }

  void phoneNumberListener(AuthModel authModel) {
    ref.listen<AsyncValue<String>>(verifyOtpVMProvider, (_, state) {
      state.maybeWhen(
        data: (data) {
          final authData = authModel.copyWith(
            phoneNumber: widget.phoneNumber,
            countryCode: widget.countryCode,
          );
          ref.read(authModelProvider.notifier).update((state) => authData);
          context.pushNamed(AppRoutes.fullName);
        },
        error: (error, _) {
          context.errorMessage(error.toString());
        },
        orElse: () {},
      );
    });
  }

  void emailListener(AuthModel authModel) {
    ref.listen<AsyncValue<BaseModel>>(verifyEmailVMProvider, (_, state) {
      state.maybeWhen(
        data: (data) {
          final authData = authModel.copyWith(
            email: _email,
          );
          ref.read(authModelProvider.notifier).update((state) => authData);
          context.pushNamed(AppRoutes.createPassword);
        },
        error: (error, _) {
          context.errorMessage(error.toString());
        },
        orElse: () {},
      );
    });
  }

  String get receipentText {
    if (widget.verificationType == VerificationType.email) {
      return widget.email!;
    } else {
      return '${widget.countryCode} ${widget.phoneNumber}';
    }
  }

  bool get isValid =>
      _otpController.text.isNotEmpty && _otpController.text.length == 4;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      if (widget.verificationType == VerificationType.email) {
        ref.read(verifyEmailVMProvider.notifier).verifyEmail(
              email: widget.email!,
              otp: _otpController.text,
            );
        return;
      } else if (widget.verificationType == VerificationType.phone) {
        ref.read(verifyOtpVMProvider.notifier).verifyOtp(
              phone: widget.phoneNumber!,
              countryCode: widget.countryCode!,
              otp: _otpController.text,
            );
      }
    }
  }
}
