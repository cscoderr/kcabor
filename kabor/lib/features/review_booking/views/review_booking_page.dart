import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/core/widgets/src/custom_button.dart';

class ReviewBooking extends StatefulWidget {
  const ReviewBooking({
    super.key,
  });

  @override
  State<ReviewBooking> createState() => _ReviewBookingState();
}

class _ReviewBookingState extends State<ReviewBooking> {
  int hours = 1;

  void increment() {
    setState(() {
      hours++;
    });
  }

  void decrement() {
    setState(() {
      hours--;
      if (hours < 1) {
        hours = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KaborAppBar(title: 'Book Service'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/mama.png'),
                  ),
                  const Gap(5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Patricia Johnson',
                        style: context.$style.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Gap(3),
                      Text(
                        'Hairstylist',
                        style: context.$style.bodyLarge!.copyWith(
                          color: const Color(0xff3DA925),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    'NGN 500/hr',
                    style: context.$style.titleLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const Gap(10),
              Row(
                children: [
                  const Icon(Iconsax.edit),
                  const Gap(10),
                  const Icon(Iconsax.trash),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        'Number of hrs',
                        style: context.$style.bodyLarge,
                      ),
                      const Gap(10),
                      InkResponse(
                        onTap: decrement,
                        child: SvgPicture.asset('assets/images/decrement.svg'),
                      ),
                      const Gap(10),
                      Text(
                        hours.toString(),
                        style: context.$style.titleLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Gap(10),
                      InkResponse(
                        onTap: increment,
                        child: SvgPicture.asset('assets/images/increment.svg'),
                      ),
                    ],
                  )
                ],
              ),
              const Gap(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Items subtotal',
                    style: context.$style.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'NGN 1,000',
                    style: context.$style.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              const Spacer(),
              MyCustombutton(
                text: 'Review Booking ',
                onTap: () => context.pushNamed(AppRoutePaths.reviewYourBooking),
              )
            ],
          ),
        ),
      ),
    );
  }
}
