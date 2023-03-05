import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor_driver/core/core.dart';
import 'package:timelines/timelines.dart';

class TripDetailsPage extends StatefulWidget {
  const TripDetailsPage({super.key});

  @override
  State<TripDetailsPage> createState() => _TripDetailsPageState();
}

class _TripDetailsPageState extends State<TripDetailsPage> {
  Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    final data = _data;
    return Scaffold(
      appBar: const KaborAppBar(
        title: 'Trip Details',
        trailing: AppExportButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(AppImages.chat),
                ),
                const Gap(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your trip with Joseph',
                        style: context.$style.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        itemSize: 30,
                        itemBuilder: (context, _) => const Icon(
                          Iconsax.star1,
                          color: Color(0xFFE5B800),
                        ),
                        onRatingUpdate: print,
                      ),
                    ],
                  ),
                ),
                Text(
                  'N4500',
                  style: context.$style.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const Gap(10),
            Container(
              height: 200,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: GoogleMap(
                initialCameraPosition: const CameraPosition(
                  target: LatLng(37.42796133580664, -122.085749655962),
                  zoom: 14.4746,
                ),
                myLocationButtonEnabled: false,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
            const Gap(20),
            Text(
              'Trip info',
              style: context.$style.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const Gap(20),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Date',
                    style: context.$style.labelLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  'Sep 22, 2022. 8:21am',
                  style: context.$style.labelLarge?.copyWith(
                    color: AppColors.dark2,
                  ),
                ),
              ],
            ),
            const Gap(5),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Car',
                    style: context.$style.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Text(
                  'Toyota Camry PSCEFGJ',
                  style: context.$style.titleMedium?.copyWith(
                    color: AppColors.dark2,
                  ),
                ),
              ],
            ),
            const Gap(20),
            _DeliveryProcesses(processes: data),
            const Gap(10),
            const Divider(),
            const Gap(10),
            Text(
              'Payment',
              style: context.$style.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const Gap(20),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Fare (7.20mi, 3m, 45s)',
                    style: context.$style.labelLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.dark,
                    ),
                  ),
                ),
                Text(
                  'NGN 4,500',
                  style: context.$style.labelLarge?.copyWith(
                    color: AppColors.dark,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Promo',
                    style: context.$style.bodySmall?.copyWith(
                      color: AppColors.dark2,
                    ),
                  ),
                ),
                Text(
                  'NGN 0',
                  style: context.$style.bodySmall?.copyWith(
                    color: AppColors.dark2,
                  ),
                ),
              ],
            ),
            const Gap(10),
            const Divider(),
            const Gap(10),
            Text(
              'Total ',
              style: context.$style.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            Row(
              children: [
                SvgPicture.asset(AppIcons.card),
                Text(
                  'Card 1226**',
                  style: context.$style.bodySmall?.copyWith(
                    color: AppColors.dark2,
                  ),
                ),
              ],
            ),
            const Gap(20),
            const Divider(),
            const Gap(20),
            Center(
              child: Text(
                'Get Help',
                style: context.$style.labelLarge?.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}

class _DeliveryProcesses extends StatelessWidget {
  const _DeliveryProcesses({Key? key, required this.processes})
      : super(key: key);

  final List<_DeliveryProcess> processes;
  @override
  Widget build(BuildContext context) {
    return FixedTimeline.tileBuilder(
      theme: TimelineThemeData(
        nodePosition: 0,
        color: AppColors.primaryColor,
        indicatorTheme: const IndicatorThemeData(
          position: 0,
          size: 16,
        ),
        connectorTheme: const ConnectorThemeData(
          thickness: 3,
        ),
      ),
      builder: TimelineTileBuilder.connected(
        connectionDirection: ConnectionDirection.before,
        itemCount: processes.length,
        contentsBuilder: (_, index) {
          return Padding(
            padding: (index != (processes.length - 1))
                ? const EdgeInsets.only(left: 8, bottom: 60)
                : const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  text: TextSpan(
                    text: processes[index].message!.message,
                    children: [
                      TextSpan(
                        text: ' ${processes[index].message!.createdAt}',
                        style: context.$style.bodySmall?.copyWith(
                          color: AppColors.dark,
                        ),
                      ),
                    ],
                    style: context.$style.bodySmall?.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                Text(
                  processes[index].name,
                  style: context.$style.labelLarge?.copyWith(),
                ),
                Text(
                  processes[index].message!.address,
                  style: context.$style.bodySmall,
                ),
              ],
            ),
          );
        },
        indicatorBuilder: (_, index) {
          return const DotIndicator(
            color: AppColors.primaryColor,
          );
        },
        connectorBuilder: (_, index, ___) => const SolidLineConnector(
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}

List<_DeliveryProcess> get _data => const [
      _DeliveryProcess(
        'Shoprite Kwara Mall',
        message: _DeliveryMessage(
          '8:21am',
          'Pick-up',
          'Fate Road, Ilorin, Nigeria',
        ),
      ),
      _DeliveryProcess(
        '23 Lower Basin',
        message: _DeliveryMessage(
          '8:45am',
          'Drop-off',
          'Basin Road, Ilorin, Nigeria',
        ),
      ),
    ];

class _DeliveryProcess {
  const _DeliveryProcess(
    this.name, {
    this.message,
  });

  final String name;
  final _DeliveryMessage? message;
}

class _DeliveryMessage {
  const _DeliveryMessage(this.createdAt, this.message, this.address);

  final String createdAt; // final DateTime createdAt;
  final String message;
  final String address;

  @override
  String toString() {
    return '$createdAt $message $address';
  }
}
