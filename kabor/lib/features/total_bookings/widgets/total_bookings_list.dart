import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:kabor/core/core.dart';

class TotalBookingsCard extends StatelessWidget {
  const TotalBookingsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => context.pushNamed(AppRoutes.acceptOrder),
          child: Card(
            elevation: 2,
            color: const Color(0xffF2F2F5),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 55,
                        width: 60,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage('assets/images/writer.png'),
                            fit: BoxFit.contain,
                          ),
                          borderRadius: BorderRadius.circular(8),
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
                          Text('Writing', style: context.$style.titleMedium),
                          const Gap(5),
                          Text(
                            '25 Sept,2022. 4:50pm',
                            style: context.$style.bodyLarge!.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 24,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: const Color(0xffE5B800),
                            ),
                            child: Center(
                              child: Text(
                                'Pending',
                                style: context.$style.bodyMedium!.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const Gap(5),
                          Text(
                            'N1000',
                            style: context.$style.titleMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                    height: 10,
                    color: Colors.grey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Client',
                        style: context.$style.titleLarge,
                      ),
                      Text(
                        'Awotundun Maimunah',
                        style: context.$style.bodyLarge,
                      )
                    ],
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Address',
                        style: context.$style.titleLarge,
                      ),
                      Text(
                        '20, Oko Erin, Ilorin',
                        style: context.$style.bodyLarge,
                      )
                    ],
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 48,
                        width: 162,
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
                            style: context.$style.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff3DA925),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 48,
                        width: 162,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(34),
                          color: const Color(0xff3DA925),
                        ),
                        child: Center(
                          child: Text(
                            'Accept ',
                            style: context.$style.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
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
      },
      separatorBuilder: (context, indexe) => const Gap(10),
      itemCount: 10,
    );
  }
}
