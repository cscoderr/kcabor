import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor_driver/app/data/data.dart';
import 'package:kabor_driver/features/address/address.dart';

final addressesStreamProvider =
    StreamProvider.autoDispose<List<GooglePlaceModel>>((ref) async* {
  final stream = ref.watch(kaborRepositoryProvider).searchAddressSream;
  yield* stream;
});

class AddressList extends HookConsumerWidget {
  const AddressList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final address = ref.watch(addressesStreamProvider);
    return Expanded(
      child: address.when(
        data: (addresses) {
          if (addresses.isEmpty) {
            const AddressTile(
              title: 'No address found',
              subtitle: '',
            );
          }
          return ListView.separated(
            itemBuilder: (context, index) {
              return AddressTile(
                title: addresses[index].address ?? '',
                subtitle: addresses[index].formattedAddress ?? '',
                onTap: () {},
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: addresses.length,
          );
        },
        error: (error, _) {
          return AddressTile(
            title: 'Error',
            subtitle: error.toString(),
          );
        },
        loading: SizedBox.shrink,
      ),
    );
  }
}
