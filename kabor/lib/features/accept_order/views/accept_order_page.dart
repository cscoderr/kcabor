import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';

class AcceptOrder extends StatelessWidget {
  const AcceptOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KaborAppBar(
        title: 'Hairsylist',
        trailing: TextButton(
          onPressed: () {},
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
                    SvgPicture.asset('assets/images/messages_3.svg')
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
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .42,
                    child: Container(
                      height: 56,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(34),
                        color: Colors.transparent,
                        border: Border.all(
                          width: 2,
                          color: const Color(0xff3DA925),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Decline',
                          style: context.$style.titleLarge!.copyWith(
                            color: const Color(0xff3DA925),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .42,
                    child: InkResponse(
                      onTap: () => context.pushNamed(AppRoutes.bookingCheckout),
                      child: Container(
                        height: 56,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(34),
                          color: const Color(0xff3DA925),
                        ),
                        child: Center(
                          child: Text(
                            'Accept ',
                            style: context.$style.titleLarge!.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
