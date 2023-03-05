import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:kabor/core/core.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              SvgPicture.asset(AppImages.locationTracking),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      'Allow push notifications to track your orders',
                      textAlign: TextAlign.left,
                      style: context.$style.headline5!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const Gap(20),
                    Text(
                      "Turn on push notifications to get updates on your driver's location and be notified about special offers and discounts ",
                      textAlign: TextAlign.left,
                      style: context.$style.titleMedium,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SolidButton(
                text: 'Allow',
                onPressed: () => context.pushNamed(AppRoutes.paymentInfo),
              ),
              const Gap(5),
              AdaptiveTextButton(
                text: 'Skip',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
