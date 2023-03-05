// ignore_for_file: lines_longer_than_80_chars

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor_driver/core/core.dart';

final onboardingProvider = StateProvider<List<Onboarding>>((ref) {
  return [
    Onboarding(
      image: AppImages.slider1,
      title: 'Ride around safely at an affordable rate',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis',
    ),
    Onboarding(
      image: AppImages.slider2,
      title: 'Fast Food Delivery with comfort ',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis',
    ),
    Onboarding(
      image: AppImages.slider3,
      title: 'Instant connection with an artisan ',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis',
    ),
  ];
});
