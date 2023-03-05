// ignore_for_file: cascade_invocations

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/onboarding/onboarding.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends HookConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = usePageController();
    final sliders = ref.watch(onboardingProvider);
    final _currentIndex = useState(0);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              onPageChanged: (value) {
                _currentIndex.value = value;
              },
              itemBuilder: (context, index) {
                return _buildTitleWidget(
                  context,
                  onboarding: sliders[index],
                );
              },
              itemCount: sliders.length,
            ),
            const Positioned(
              left: 50,
              right: 50,
              child: AppLogo(),
            ),
            Column(
              children: [
                const Spacer(),
                IgnorePointer(
                  child: Stack(
                    children: [
                      ClipPath(
                        clipper: AuthImageClipper(),
                        child: Container(
                          height: 250,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        switchInCurve: Curves.easeIn,
                        child: KeyedSubtree(
                          key: ValueKey(_currentIndex.value),
                          child: Center(
                            child: SvgPicture.asset(
                              sliders[_currentIndex.value].image!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(20),
                _buildIndicatorWidget(_controller),
                const Gap(150),
                const Spacer(),
              ],
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: 20,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SolidButton(
                      text: 'Get Started',
                      onPressed: () => context.goNamed(AppRoutes.welcome),
                    ),
                    const Gap(15),
                    RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: Theme.of(context).textTheme.bodyText1,
                        children: [
                          TextSpan(
                            text: 'Log In',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => context.goNamed(AppRoutes.login),
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: AppColors.primaryColor,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleWidget(
    BuildContext context, {
    required Onboarding onboarding,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const Gap(340 + 30),
          SizedBox(
            height: 130,
            child: Column(
              children: [
                Text(
                  onboarding.title!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                ),
                const Gap(15),
                Text(
                  onboarding.description!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildIndicatorWidget(PageController controller) {
    return SizedBox(
      height: 20,
      child: Center(
        child: SmoothPageIndicator(
          effect: const ExpandingDotsEffect(
            dotHeight: 7,
            dotWidth: 7,
            expansionFactor: 4,
            activeDotColor: AppColors.primaryColor,
            dotColor: AppColors.lightGreyColor,
          ),
          controller: controller,
          count: 3,
        ),
      ),
    );
  }
}
