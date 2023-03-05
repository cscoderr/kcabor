import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/core/theme/src/app_colors.dart';
import 'package:kabor/features/home/presentation/widgets/home_app_tab.dart';
import 'package:kabor/features/home/presentation/widgets/home_app_tab_item.dart';
import 'package:kabor/features/home_artisan/widgets/home_tab_card.dart';

final tabsProvider = StateProvider<List<HomeAppTabItem>>((ref) {
  return [
    HomeAppTabItem(
      text: 'Food',
      icon: Iconsax.cake5,
    ),
    HomeAppTabItem(
      text: 'Ride',
      icon: Iconsax.car5,
    ),
    HomeAppTabItem(
      text: 'Home',
      icon: Icons.brush,
    ),
  ];
});

class HomeArtisan extends HookConsumerWidget {
  const HomeArtisan({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scaffoldKey = useState(GlobalKey<ScaffoldState>());
    final tabs = ref.watch(tabsProvider);
    final currentTab = useState(0);
    return Scaffold(
      key: scaffoldKey.value,
      drawer: const Drawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Material(
                      elevation: 3,
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Iconsax.menu_1,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Gap(10),
                    RichText(
                      text: const TextSpan(
                        text: 'Welcome ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            text: 'Tommy',
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    InkResponse(
                      onTap: () =>
                          context.pushNamed(AppRoutes.notificationPage),
                      child: Material(
                        elevation: 3,
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                        child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Iconsax.notification,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(20),
                HomeAppTab(
                  items: tabs,
                  currentIndex: currentTab.value,
                  onChanged: (value) {
                    currentTab.value = value;
                  },
                ),
                const Gap(20),
                IndexedStack(
                  index: currentTab.value,
                  children: const [
                    Center(
                      child: Text('Food'),
                    ),
                    Center(
                      child: Text('ride'),
                    ),
                    HomeTabCard(),
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
