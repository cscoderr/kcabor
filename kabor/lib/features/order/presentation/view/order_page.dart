import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:kabor/core/configs/app_extensions.dart';
import 'package:kabor/core/router/app_routes.dart';
import 'package:kabor/features/order/presentation/widgets/active_orders_list.dart';
import 'package:kabor/features/order/presentation/widgets/previous_orders_list.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        'Orders',
                        style: context.$style.titleLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  InkResponse(
                    onTap: () => context.pushNamed(AppRoutes.searchOrders),
                    child: SvgPicture.asset('assets/images/search_icon.svg'),
                  )
                ],
              ),
              const Gap(20),
              Text(
                'Active Orders',
                style: context.$style.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(10),
              SizedBox(
                height: MediaQuery.of(context).size.height * .25,
                child: const ActiveOrders(),
              ),
              const Gap(15),
              Text(
                'Previous Orders ',
                style: context.$style.titleMedium!
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              const Gap(10),
              SizedBox(
                height: MediaQuery.of(context).size.height * .30,
                child: const PrviousOrders(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
