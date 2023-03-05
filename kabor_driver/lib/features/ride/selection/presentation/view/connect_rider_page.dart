import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor_driver/core/core.dart';
import 'package:kabor_driver/features/ride/ride.dart';

class ConnectRiderPage extends StatefulHookConsumerWidget {
  const ConnectRiderPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ConnectRiderPageState();
}

class _ConnectRiderPageState extends ConsumerState<ConnectRiderPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  ui.Image? _image;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )
      ..forward()
      ..repeat();
    _loadImage();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _loadImage() async {
    final _carIcon = await rootBundle.load(AppImages.carIcon);
    final bytes = Uint8List.view(_carIcon.buffer);
    final codec = await ui.instantiateImageCodec(
      bytes,
      targetHeight: 80,
    );
    final image = (await codec.getNextFrame()).image;
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    final rescan = useState(true);
    final isOnline = useState(true);
    return MapScafffold(
      children: [
        Positioned.fill(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                painter: SearchDriverPainter(
                  controller: _controller,
                  image: _image,
                ),
              );
            },
          ),
        ),
        if (rescan.value) _buildRescanBottomSheet(context, rescan),
        _buildTopWidget(isOnline: isOnline),
      ],
    );
  }

  Widget _buildTopWidget({
    required ValueNotifier<bool> isOnline,
  }) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppCloseButton(),
              FlutterSwitch(
                width: 45,
                height: 24,
                valueFontSize: 25,
                toggleSize: 15,
                activeColor: AppColors.primaryColor,
                inactiveColor: Colors.white,
                inactiveToggleColor: AppColors.primaryColor,
                value: isOnline.value,
                activeIcon: SvgPicture.asset(
                  AppImages.steering1,
                  color: AppColors.primaryColor,
                ),
                inactiveIcon: SvgPicture.asset(
                  AppImages.steering1,
                  color: Colors.white,
                ),
                switchBorder: Border.all(color: AppColors.primaryColor),
                onToggle: (value) {
                  isOnline.value = value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRescanBottomSheet(
    BuildContext context,
    ValueNotifier<bool> rescan,
  ) {
    return Positioned(
      bottom: 50,
      right: 20,
      left: 20,
      child: SolidButton(
        text: 'Rescan',
        onPressed: () {
          rescan.value = false;
          context.pushNamed(AppRoutes.newOrder);
        },
      ),
    );
  }
}

class SearchDriverPainter extends CustomPainter {
  SearchDriverPainter({
    required this.controller,
    required this.image,
  }) {
    _opacityAnimation = Tween<double>(begin: 100, end: 10).animate(controller);
    _radiusAnimation = Tween<double>(begin: 20, end: 50).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  final AnimationController controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _radiusAnimation;

  ui.Image? image;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size / 2;

    for (var i = 1; i <= 5; i++) {
      final paint = Paint()
        ..color =
            AppColors.primaryColor.withOpacity(_opacityAnimation.value / 100)
        ..strokeWidth = 5
        ..style = PaintingStyle.fill;
      canvas.drawCircle(
        Offset(center.width, center.height),
        i * _radiusAnimation.value,
        paint,
      );

      final imagePaint = Paint();
      if (image != null) {
        canvas.drawImage(
          image!,
          Offset(center.width - 20, center.height - 40),
          imagePaint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(SearchDriverPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(SearchDriverPainter oldDelegate) => false;
}
