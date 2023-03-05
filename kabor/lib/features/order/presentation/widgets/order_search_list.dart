import 'package:flutter/material.dart';
import 'package:kabor/core/configs/app_extensions.dart';

class OrderSearchCard extends StatelessWidget {
  const OrderSearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ListTile(
          leading: const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/tea.png'),
          ),
          trailing: Text(
            'View',
            style: context.$style.bodyLarge!.copyWith(
              color: const Color(0xff3DA925),
            ),
          ),
          title: Text(
            'Pepe’s Morning',
            style: context.$style.bodyLarge,
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(
        thickness: 1,
        height: 20,
        color: Colors.grey,
      ),
      itemCount: 3,
    );
  }
}
