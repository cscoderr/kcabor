import 'package:flutter/material.dart';
import 'package:kabor/features/order/presentation/widgets/active_orders_list.dart';

class PrviousOrders extends StatelessWidget {
  const PrviousOrders({super.key});

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
