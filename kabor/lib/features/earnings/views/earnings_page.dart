import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/core/widgets/src/custom_button.dart';

class Earnings extends StatelessWidget {
  const Earnings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KaborAppBar(
        title: 'Earnings',
        trailing: SvgPicture.asset('assets/images/calendar.svg'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child:
                    Text('Oct 5th - Oct 10', style: context.$style.bodyLarge),
              ),
              const Gap(10),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Transform.translate(
                          offset: const Offset(0, -25),
                          child: Text(
                            'N',
                            textScaleFactor: 1,
                            style: context.$style.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      WidgetSpan(
                        child: Transform.translate(
                          offset: const Offset(0, 1),
                          child: Text(
                            '50,000',
                            style: context.$style.headline4!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      WidgetSpan(
                        child: Transform.translate(
                          offset: const Offset(0, -25),
                          child: Text(
                            '.00',
                            textScaleFactor: 1,
                            style: context.$style.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(10),
              Center(
                child: Text(
                  '24rides in 21hr 18min',
                  style: context.$style.bodyLarge!.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ),
              const Gap(10),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .65,
                  child: MyCustombutton(
                    text: 'Cashout N50,000',
                    onTap: () => context.pushNamed(AppRoutes.expressPay),
                  ),
                ),
              ),
              const Gap(15),
              Center(
                child: TextButton(
                  onPressed: () => context.pushNamed(AppRoutes.earningList),
                  child: Text(
                    'See earning list',
                    style: context.$style.titleMedium!.copyWith(
                      decoration: TextDecoration.underline,
                      color: const Color(0xff3DA925),
                    ),
                  ),
                ),
              ),
              const Gap(10),
              Text(
                'Recent Earnings',
                style: context.$style.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Today Oct 11',
                        style: context.$style.bodyLarge,
                      ),
                      const Gap(5),
                      Text(
                        '10 rides , 2hr 18min',
                        style: context.$style.bodyLarge!.copyWith(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  Text(
                    'N20,000',
                    style: context.$style.bodyLarge,
                  )
                ],
              ),
              const Gap(10),
              Text(
                'Yesterday',
                style: context.$style.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Oct 11',
                        style: context.$style.bodyLarge,
                      ),
                      const Gap(5),
                      Text(
                        '10 rides , 2hr 18min',
                        style: context.$style.bodyLarge!.copyWith(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  Text(
                    'N20,000',
                    style: context.$style.bodyLarge,
                  )
                ],
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Oct 11',
                        style: context.$style.bodyLarge,
                      ),
                      const Gap(5),
                      Text(
                        '10 rides , 2hr 18min',
                        style: context.$style.bodyLarge!.copyWith(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  Text(
                    'N20,000',
                    style: context.$style.bodyLarge,
                  )
                ],
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Oct 11',
                        style: context.$style.bodyLarge,
                      ),
                      const Gap(5),
                      Text(
                        '10 rides , 2hr 18min',
                        style: context.$style.bodyLarge!.copyWith(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  Text(
                    'N20,000',
                    style: context.$style.bodyLarge,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
