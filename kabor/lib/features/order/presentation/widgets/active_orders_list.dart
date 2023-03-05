import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kabor/core/configs/app_extensions.dart';
import 'package:kabor/core/router/app_routes.dart';

class ActiveOrders extends StatelessWidget {
  const ActiveOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return const OrderCard();
      },
      separatorBuilder: (context, index) => const Divider(
        color: Colors.grey,
      ),
      itemCount: 3,
    );
  }
}

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(AppRoutes.viewOrders),
      child: ListTile(
        leading: Container(
          height: 42,
          width: 49,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: const DecorationImage(
              image: AssetImage('assets/images/foodd.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Poached -GRA, Ilorin',
              style: context.$style.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            // const Gap(5),
            Text(
              'Poached, garnished with parlsey  ',
              style: context.$style.labelLarge,
            ),
            // const Gap(5),
            Text(
              'Delivery, 10:15 -10:30am',
              style: context.$style.bodyLarge!.copyWith(color: Colors.grey),
            ),
          ],
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.black,
          size: 15,
        ),
      ),
    );
  }
}
