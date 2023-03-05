import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/home/home.dart';
import 'package:kabor/features/order/presentation/view/order_page.dart';
import 'package:kabor/features/reward/reward.dart';

class TabPage extends HookConsumerWidget {
  const TabPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = useState(0);
    return Scaffold(
      body: IndexedStack(
        index: currentIndex.value,
        children: const [
          HomePage(),
          RewardPage(),
          OrderPage(),
          HomePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex.value,
        unselectedItemColor: AppColors.dark3,
        selectedItemColor: AppColors.primaryColor,
        unselectedLabelStyle: const TextStyle(
          color: Colors.black,
        ),
        enableFeedback: true,
        showUnselectedLabels: true,
        onTap: (value) => currentIndex.value = value,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home),
            label: 'Home',
            activeIcon: Icon(Iconsax.home_15),
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.box),
            label: 'Rewards',
            activeIcon: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Icon(Iconsax.box_15),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.receipt_text),
            label: 'Orders',
            activeIcon: Icon(Iconsax.receipt_text5),
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.category),
            label: 'More',
            activeIcon: Icon(Iconsax.category5),
          )
        ],
      ),
    );
  }
}
