import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/authentication/authentication.dart';

class PhoneNumberPage extends StatefulHookConsumerWidget {
  const PhoneNumberPage({super.key});

  @override
  ConsumerState<PhoneNumberPage> createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends ConsumerState<PhoneNumberPage> {
  final _formKey = GlobalKey<FormState>();
  final _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final verifyPhoneVM = ref.watch(verifyPhoneVMProvider);
    final countryCode = useState('');
    useListenable(_phoneNumberController);

    ref.listen<AsyncValue<String>>(verifyPhoneVMProvider, (previous, state) {
      //context.pushNamed(AppRoutes.codeVerification)
      state.maybeWhen(
        data: (data) {
          context.pushNamed(
            AppRoutes.codeVerification,
            queryParams: {
              'phoneNumber': _phoneNumberController.text,
              'countryCode': countryCode.value,
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
        isLoading: verifyPhoneVM.maybeWhen(
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
                    "What's your number ?",
                    style: context.$style.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const Gap(20),
                  Text(
                    "We'll send you a code to verify your phone",
                    style: context.$style.titleMedium,
                  ),
                  const Gap(10),
                  IntlPhoneTextField(
                    hintText: 'Enter phone number',
                    onInputChanged: (value) {
                      countryCode.value = value.dialCode ?? '';
                      _phoneNumberController.text = value.parseNumber();
                    },
                    validator: AppValidator.phoneNumber,
                  ),
                  const Spacer(),
                  SolidButton(
                    text: 'Next',
                    onPressed: (_formKey.currentState?.validate() ?? false)
                        ? () => _submit(countryCode.value)
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

  void _submit(String countryCode) {
    if (_formKey.currentState!.validate()) {
      ref.read(verifyPhoneVMProvider.notifier).verifyPhone(
            phone: _phoneNumberController.text,
            countryCode: countryCode,
          );
    }
  }
}
