import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/menu/menu.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KaborAppBar(
        title: 'Payment',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Kabor Balance',
                textAlign: TextAlign.center,
                style: context.$style.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Transform.translate(
                          offset: const Offset(0, -25),
                          child: Text(
                            AppConstants.ngnSymbol,
                            textScaleFactor: 1,
                            style: context.$style.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
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
                              fontWeight: FontWeight.w900,
                              color: AppColors.primaryColor,
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
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PaymentCard(
                  icon: Iconsax.wallet_add5,
                  text: 'Add',
                  onTap: () => context.pushNamed(AppRoutes.addFund),
                ),
                PaymentCard(
                  icon: Iconsax.bank5,
                  text: 'Withdraw',
                  onTap: () => context.pushNamed(AppRoutes.wihdraw),
                ),
                PaymentCard(
                  icon: Iconsax.send_15,
                  text: 'Send',
                  isSend: true,
                  onTap: () => context.pushNamed(AppRoutes.sendFund),
                ),
              ],
            ),
            const Gap(30),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Payment Method',
                    style: context.$style.labelLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Icon(
                  Iconsax.arrow_right_3,
                  size: 16,
                )
              ],
            ),
            const Divider(),
            const Gap(30),
            Text(
              'My Transactions',
              style: context.$style.labelLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(10),
            const TransactionTab(),
            const Gap(20),
            Flexible(
              child: ListView.separated(
                itemCount: 5,
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) {
                  return const Gap(15);
                },
                itemBuilder: (BuildContext context, int index) {
                  return const TransactionTile();
                },
              ),
            ),
            SolidButton(
              text: 'View More',
              color: Colors.white,
              textColor: AppColors.primaryColor,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
