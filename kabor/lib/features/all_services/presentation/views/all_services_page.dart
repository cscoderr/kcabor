import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/all_services/presentation/widgets/all_services_list.dart';

class AllServicesPage extends StatefulHookConsumerWidget {
  const AllServicesPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AllServicesPageState();
}

class _AllServicesPageState extends ConsumerState<AllServicesPage> {
  @override
  Widget build(BuildContext context) {
    final checkedFilter = useState(List<bool>.filled(6, false));
    return Scaffold(
      appBar: KaborAppBar(
        title: 'All Services',
        trailing: AppFilterButton(
          onTap: () => _buildFilterBottomSheet(
            context,
            checkedFilter: checkedFilter,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: const [
            AppSearchField(
              hasSuffix: false,
            ),
            Gap(25),
            Expanded(
              child: AllServicesCard(),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _buildFilterBottomSheet(
    BuildContext context, {
    required ValueNotifier<List<bool>> checkedFilter,
  }) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      clipBehavior: Clip.none,
      elevation: 10,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text(
                          'Salon',
                          style: context.$style.bodyMedium,
                        ),
                        trailing: Checkbox(
                          value: checkedFilter.value[index],
                          checkColor: Colors.white,
                          shape: const CircleBorder(),
                          side: BorderSide.none,
                          activeColor: const Color(0xff3DA925),
                          onChanged: (val) {
                            checkedFilter.value[index] = val!;
                          },
                        ),
                        onTap: () {
                          checkedFilter.value[index] = true;
                        },
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(
                      height: 3,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    itemCount: 6,
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                const Gap(5),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: InkResponse(
                    onTap: () {
                      checkedFilter.value = List<bool>.filled(6, false);
                    },
                    child: Container(
                      height: 56,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(34),
                        color: const Color(0xff3DA925),
                      ),
                      child: Center(
                        child: Text(
                          'Clear Filter',
                          style: context.$style.bodyLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }
}
