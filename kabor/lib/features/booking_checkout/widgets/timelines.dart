import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/configs/app_extensions.dart';
import 'package:timelines/timelines.dart';

class TimeLiness extends StatelessWidget {
  const TimeLiness({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FixedTimeline.tileBuilder(
      theme: TimelineThemeData(
        color: const Color(0xff3DA925),
        nodePosition: 0,
        indicatorTheme: const IndicatorThemeData(
          size: 30,
        ),
        connectorTheme: const ConnectorThemeData(
          thickness: 2,
          space: 2,
          indent: 2,
        ),
      ),
      builder: TimelineTileBuilder.connected(
        indicatorBuilder: (context, index) => const DotIndicator(
          color: Color(0xff3DA925),
          child: Icon(
            Iconsax.tick_circle,
            color: Colors.white,
            size: 15,
          ),
        ),
        connectorBuilder: (context, index, type) => const DashedLineConnector(
          color: Color(0xff3DA925),
        ),
        itemExtent: 50,
        itemCount: 4,
        contentsBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            'Booking Accepted',
            style: context.$style.titleMedium,
          ),
        ),
      ),
    );
  }
}
