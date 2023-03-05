import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/core/widgets/src/custom_button.dart';

class ReviewYourBooking extends StatelessWidget {
  const ReviewYourBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KaborAppBar(title: 'Review your booking'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your information',
                style: context.$style.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(20),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Address',
                      style: context.$style.bodyLarge,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          '45, Awotundun Street, Lagos',
                          style: context.$style.bodyLarge,
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Gap(10),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Time and Date',
                      style: context.$style.bodyLarge,
                    ),
                    const Gap(5),
                    Row(
                      children: [
                        Text(
                          '4:00 PM',
                          style: context.$style.bodyLarge,
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        )
                      ],
                    ),
                    const Gap(5),
                    Text(
                      '20th, Sept ,2022',
                      style: context.$style.bodyLarge,
                    ),
                  ],
                ),
              ),
              const Gap(10),
              Text(
                'Your Payment',
                style: context.$style.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(20),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Payment Method',
                      style: context.$style.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Row(
                          children: [
                            const Image(
                              image: AssetImage('assets/images/mastercard.png'),
                            ),
                            const Gap(5),
                            Text(
                              'Card 1226**',
                              style: context.$style.bodyLarge,
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Gap(10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 56,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xffF2F2F5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Promo Code',
                        style: context.$style.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      )
                    ],
                  ),
                ),
              ),
              const Spacer(),
              MyCustombutton(
                text: 'Book ',
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.white,
                    clipBehavior: Clip.none,
                    elevation: 10,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    builder: (context) {
                      return StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/images/book_success.svg',
                              ),
                              const Gap(20),
                              Text(
                                'Booking Successful',
                                style: context.$style.titleLarge!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Gap(25),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: MyCustombutton(
                                  text: 'View Booking Details ',
                                  onTap: () => context.pushNamed(
                                    AppRoutePaths.bookingCheckout,
                                  ),
                                ),
                              ),
                              const Gap(15),
                              TextButton(
                                onPressed: () => context
                                    .pushNamed(AppRoutePaths.notificationPage),
                                child: Text(
                                  'No, thanks',
                                  style: context.$style.titleLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
