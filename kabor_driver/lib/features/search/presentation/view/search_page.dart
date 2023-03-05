import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor_driver/core/core.dart';
import 'package:kabor_driver/features/ride/ride.dart';

class SearchPage extends HookConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOnline = useState(true);
    return MapScafffold(
      children: [
        _buildTopWidget(
          isOnline: isOnline,
        ),
        _buildBottomWidget(context),
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

  Widget _buildBottomWidget(BuildContext context) {
    return Positioned(
      bottom: 50,
      right: 0,
      left: 0,
      child: AppSearchButton(
        radius: 40,
        iconSize: 40,
        onTap: () => context.pushNamed(AppRoutes.connectRider),
      ),
    );
  }
}
