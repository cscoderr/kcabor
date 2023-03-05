import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/address/address.dart';
import 'package:kabor/features/home/home.dart';
import 'package:kabor/features/home/presentation/widgets/artisan_tab.dart';
import 'package:kabor/features/home/presentation/widgets/food_tab.dart';
import 'package:kabor/features/home_artisan/widgets/home_tab_card.dart';
import 'package:kabor/features/ride/home/home.dart' as ridetab;

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
      text: 'Artisan',
      icon: Iconsax.user,
    ),
  ];
});

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scaffoldKey = useState(GlobalKey<ScaffoldState>());
    final tabs = ref.watch(tabsProvider);
    final currentTab = useState(0);
    final locationData = ref.watch(currentLocationDataProvider);
    final isArtisan = useState(false);
    return Scaffold(
      key: scaffoldKey.value,
      drawer: const AppDrawer(),
      body: Stack(
        children: [
          if (currentTab.value == 1)
            locationData.when(
              data: (location) {
                return GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(location.latitude, location.longitude),
                    zoom: 17.4746,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    // _controller.complete(controller);
                  },
                  compassEnabled: false,
                  myLocationButtonEnabled: false,
                );
              },
              error: (error, _) => Center(
                child: Text(error.toString()),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
          _buildTopWidget(
            context,
            scaffoldKey: scaffoldKey.value,
            tabs: tabs,
            currentTab: currentTab,
            isArtisan: isArtisan,
          ),
          if (currentTab.value == 1)
            const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ridetab.HomePage(),
            ),
          // Positioned.fill(
          //   top: 300,
          //   child: IndexedStack(
          //     index: currentTab.value,
          //     children: const [
          //       FoodTab(),
          //       ridetab.HomePage(),
          //       if (1 == 1) HomeTabCard() else ArtisanTab(),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildTopWidget(
    BuildContext context, {
    required GlobalKey<ScaffoldState> scaffoldKey,
    required List<HomeAppTabItem> tabs,
    required ValueNotifier<int> currentTab,
    ValueNotifier<bool>? isArtisan,
  }) {
    return Positioned.fill(
      top: MediaQuery.of(context).padding.top + 10,
      left: 20,
      right: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InkResponse(
                onTap: () {
                  isArtisan?.value = !isArtisan.value;
                  scaffoldKey.currentState?.openDrawer();
                },
                child: Material(
                  elevation: 3,
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(50),
                  child: const CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Iconsax.menu_1,
                      size: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const Gap(10),
              if (currentTab.value != 1)
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
                onTap: () => context.pushNamed(AppRoutes.notificationPage),
                child: Material(
                  elevation: 3,
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(50),
                  child: const CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Iconsax.notification,
                      size: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Gap(20),
          SearchTextField(
            fillColor:
                currentTab.value == 1 ? Colors.white : Colors.transparent,
            onTap: () => context.pushNamed(
              currentTab.value == 1
                  ? AppRoutes.pickup
                  : AppRoutes.searchRestaurant,
            ),
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
          Expanded(
            child: IndexedStack(
              index: currentTab.value,
              children: [
                const FoodTab(),
                const SizedBox.shrink(),
                if (isArtisan?.value ?? false)
                  const HomeTabCard()
                else
                  const ArtisanTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
