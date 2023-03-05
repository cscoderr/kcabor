import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:kabor_driver/core/core.dart';
import 'package:kabor_driver/core/widgets/src/custom_button.dart';

class PromoCode extends StatelessWidget {
  const PromoCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Row(
                children: [
                  InkResponse(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset('assets/images/xback.svg'),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Promo code',
                        style: context.$style.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(60),
              Center(
                child: SvgPicture.asset('assets/images/gifts.svg'),
              ),
              const Gap(50),
              const AppTextField(
                labelText: 'Enter promo code',
              ),
              const Spacer(),
              const MyCustombutton(
                text: 'Apply',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
