import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/features/reward/presentation/widgets/reward_app_tab_tile.dart';

class RewardAppTab extends HookConsumerWidget {
  const RewardAppTab({
    super.key,
    required this.items,
    required this.currentIndex,
    this.onChanged,
  });

  final List<RewardAppTabItem> items;
  final ValueChanged<int>? onChanged;
  final int currentIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: items.length,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: items
                    .asMap()
                    .entries
                    .map(
                      (e) => GestureDetector(
                        onTap: () {
                          onChanged?.call(e.key);
                        },
                        child: RewardAppTabTile(
                          isActive: e.key == currentIndex,
                          textNum: e.value.textNum,
                          text: e.value.text,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
