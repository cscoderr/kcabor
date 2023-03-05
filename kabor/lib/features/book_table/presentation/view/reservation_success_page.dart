import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:kabor/core/core.dart';

class ReservationSuccessPage extends StatelessWidget {
  const ReservationSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SvgPicture.asset(
                      AppImages.reservation,
                    ),
                    const Gap(20),
                    Text(
                      'Yay, Your Reservation has\nbeen booked ',
                      textAlign: TextAlign.center,
                      style: context.$style.titleLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(40),
              SolidButton(
                text: 'Place an order',
                onPressed: () {},
              ),
              const Gap(10),
              AdaptiveTextButton(
                text: 'No, thanks',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
