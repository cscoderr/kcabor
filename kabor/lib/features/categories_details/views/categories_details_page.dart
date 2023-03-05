import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/categories_details/widgets/categories_app_bar.dart';
import 'package:kabor/features/categories_details/widgets/categories_appbar_items.dart';
import 'package:kabor/features/categories_details/widgets/categories_details_lists.dart';

final tabsProvider = StateProvider<List<CategoriesAppTabItem>>((ref) {
  return [
    CategoriesAppTabItem(
      text: 'All',
    ),
    CategoriesAppTabItem(
      text: 'Pedicure',
    ),
    CategoriesAppTabItem(
      text: 'Manicure',
    ),
    CategoriesAppTabItem(
      text: 'Massages ',
    ),
  ];
});

class CategoriesDetails extends HookConsumerWidget {
  const CategoriesDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabs = ref.watch(tabsProvider);
    final currentTab = useState(0);
    return Scaffold(
      appBar: const KaborAppBar(
        title: 'Salon',
        trailing: AppFilterButton(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppSearchField(
                  hasSuffix: false,
                ),
                const Gap(15),
                Text(
                  'Subcategories',
                  style: context.$style.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(15),
                SizedBox(
                  height: 40,
                  child: SubCategoriesAppTab(
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
                    CategoriesDetailsCard(),
                    CategoriesDetailsCard(),
                    CategoriesDetailsCard(),
                    CategoriesDetailsCard(),
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
