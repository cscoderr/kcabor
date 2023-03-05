import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor_driver/core/core.dart';
import 'package:kabor_driver/core/widgets/src/custom_button.dart';
import 'package:kabor_driver/features/booking_checkout/widgets/timelines.dart';

class BookingCheckout extends StatelessWidget {
  const BookingCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KaborAppBar(
        title: 'Hairsylist',
        trailing: TextButton(
          onPressed: () => context.pushNamed(AppRoutes.acceptOrder),
          child: Text(
            'Status ',
            style: context.$style.labelLarge!.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 55,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/images/hairstylist.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Gap(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '#12258',
                        style: context.$style.bodyLarge!.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      const Gap(5),
                      Text(
                        'Hairstylist',
                        style: context.$style.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Gap(5),
                      Text(
                        '25 Sept,2022. 4:50pm',
                        style: context.$style.bodyLarge!.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Gap(20),
              Text(
                'Booking Description',
                style: context.$style.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(10),
              Text(
                'Mahkfj lnlnnalnkfnlkamn flmlanlmfknflnjafla fkn',
                style: context.$style.bodyLarge!.copyWith(
                  color: Colors.grey,
                ),
              ),
              const Gap(30),
              Text(
                'Artisan Details ',
                style: context.$style.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(10),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xffF2F2F5),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/mama.png'),
                      radius: 30,
                    ),
                    const Gap(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Patricia Johnson ',
                          style: context.$style.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Gap(5),
                        Text(
                          'talk2borlah@gmail.com',
                          style: context.$style.bodyLarge,
                        ),
                        const Gap(5),
                        Row(
                          children: [
                            const Icon(
                              Iconsax.location,
                              size: 15,
                              color: Color(0xff3DA925),
                            ),
                            const Gap(5),
                            Text(
                              'Fate Road, Ilorin, Nigeria',
                              style: context.$style.bodyLarge!.copyWith(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    InkResponse(
                      onTap: () => context.pushNamed(AppRoutes.chats),
                      child: SvgPicture.asset('assets/images/messages_3.svg'),
                    )
                  ],
                ),
              ),
              const Gap(10),
              Text(
                'Price Details',
                style: context.$style.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Items subtotal',
                    style: context.$style.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('NGN 1,000', style: context.$style.titleMedium),
                ],
              ),
              const Gap(10),
              Text(
                'Booking Status',
                style: context.$style.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(5),
              const TimeLiness(),
              const Spacer(),
              MyCustombutton(
                text: 'Cancel Booking',
                onTap: () {
                  context.pushNamed(AppRoutes.chats);
                  // showDialog(
                  //   context: context,
                  //   barrierDismissible: true,
                  //   builder: (context) {
                  //     return Column(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         SizedBox(
                  //           height: 200,
                  //           child: AlertDialog(
                  //             backgroundColor: Colors.white,
                  //             shape: const RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.all(
                  //                 Radius.circular(15),
                  //               ),
                  //             ),
                  //             title: Center(
                  //               child: Text(
                  //                 'Cancel this booking ?',
                  //                 style: context.$style.titleLarge!.copyWith(
                  //                   fontWeight: FontWeight.bold,
                  //                 ),
                  //               ),
                  //             ),
                  //             content: Column(
                  //               children: [
                  //                 Center(
                  //                   child: Text(
                  //                     'Are you sure you want to cancel this booking',
                  //                     style: context.$style.bodyLarge,
                  //                   ),
                  //                 ),
                  //                 const Divider(
                  //                   thickness: 1,
                  //                   color: Colors.grey,
                  //                   height: 15,
                  //                 )
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.symmetric(horizontal: 65),
                  //           child: Container(
                  //             height: 60,
                  //             width: MediaQuery.of(context).size.width * 50,
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(15),
                  //               color: Colors.white,
                  //             ),
                  //             child: Center(
                  //               child: Text(
                  //                 'Don’t Cancel',
                  //                 style: context.$style.titleLarge,
                  //               ),
                  //             ),
                  //           ),
                  //         )
                  //       ],
                  //     );
                  //   },
                  // );
                  // // actions: [
                  // //   CustomButton(
                  // //     title: "Continue",
                  // //     onTap: () => context.back(),
                  // //     width: MediaQuery.of(context).size.width,
                  // //   ),
                  // //   const SizedBox(height: 10)
                  // // ]);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
