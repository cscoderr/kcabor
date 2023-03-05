import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor_driver/core/core.dart';
import 'package:kabor_driver/features/earnings/views/earnings_page.dart';
import 'package:kabor_driver/features/home/home.dart';
import 'package:kabor_driver/features/reward/reward.dart';
import 'package:kabor_driver/features/schedule_event/presentation/view/schedule_event_page.dart';

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
          Earnings(),
          ScheduleEventPage(),
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
            icon: Icon(Iconsax.money_4),
            label: 'Earnings',
            activeIcon: Icon(Iconsax.money_45),
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.calendar_1),
            label: 'Schedule',
            activeIcon: Icon(Iconsax.calendar5),
          )
        ],
      ),
    );
  }
}
