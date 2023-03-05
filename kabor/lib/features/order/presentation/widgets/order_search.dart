import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/order/presentation/widgets/order_search_list.dart';

class SearchOrders extends StatelessWidget {
  const SearchOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .80,
                    child: const AppTextField(
                      hintText: 'Pep',
                      prefix: Icon(Iconsax.search_normal),
                    ),
                  ),
                  InkResponse(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset('assets/images/xback.svg'),
                  ),
                ],
              ),
              const Gap(20),
              const Expanded(
                child: OrderSearchCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
