import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/configs/app_extensions.dart';

import '../../../core/widgets/src/kcabor_loader.dart';
import '../views/view_model/notification_viewmodel.dart';

class NotificationCard extends HookConsumerWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getNotification = ref.watch(getNotificationVMProvider);
    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          ref.read(getNotificationVMProvider.notifier).getNotification();
        });
        return null;
      },
      [],
    );
    return SizedBox(
      child: getNotification.when(
        data: (data) {
          final response = data;
          return response.isEmpty
              ? const Center(
                  child: Text('No Notifications'),
                )
              : ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final notification = response[index];
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[100],
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                NetworkImage(notification.data?.image ?? ''),
                          ),
                          const Gap(10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    notification.data?.title ?? '',
                                    style: context.$style.titleMedium!.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Gap(MediaQuery.of(context).size.width * .22),
                                  Text(
                                    '2mins ago',
                                    style: context.$style.bodySmall,
                                  )
                                ],
                              ),
                              const Gap(5),
                              Text(
                                notification.data?.description ?? '',
                                style: context.$style.bodyLarge,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: response.length,
                  separatorBuilder: (context, index) => const Gap(10),
                );
        },
        error: (error, stack) => Center(
          child: Text(error.toString()),
        ),
        loading: () => const Center(
          child: KcaborProgressIndicator(),
        ),
      ),
    );
  }
}
