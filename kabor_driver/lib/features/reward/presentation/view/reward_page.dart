import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor_driver/core/core.dart';
import 'package:kabor_driver/features/reward/presentation/widgets/reward_app_tab_tile.dart';
import 'package:kabor_driver/features/reward/presentation/widgets/reward_card.dart';
import 'package:kabor_driver/features/reward/presentation/widgets/rewards_tab.dart';

final tabsProvider = StateProvider<List<RewardAppTabItem>>((ref) {
  return [
    RewardAppTabItem(
      text: 'Driver',
      textNum: '0',
    ),
    RewardAppTabItem(
      text: 'Rider',
      textNum: '0',
    ),
  ];
});

class RewardPage extends HookConsumerWidget {
  const RewardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabs = ref.watch(tabsProvider);
    final currentTab = useState(0);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          'Rewards',
                          style: context.$style.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(20),
                InkResponse(
                  onTap: () => context.pushNamed(AppRoutes.promoCode),
                  child: Container(
                    height: 56,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xffF2F2F5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Enter promo  code',
                          style: context.$style.titleMedium!.copyWith(),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                ),
                const Gap(10),
                Text(
                  'Your rewards',
                  style: context.$style.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(5),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: RewardAppTab(
                    items: tabs,
                    currentIndex: currentTab.value,
                    onChanged: (value) {
                      currentTab.value = value;
                    },
                  ),
                ),
                const Gap(20),
                IndexedStack(
                  index: currentTab.value,
                  children: const [
                    RewardCard(),
                    RewardCard(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
