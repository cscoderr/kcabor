import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:kabor/core/core.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppLogo(),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipPath(
                    clipper: AuthImageClipper(),
                    child: Container(
                      height: 250,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  Center(
                    child: SvgPicture.asset(AppImages.welcome),
                  ),
                ],
              ),
            ),
            // SvgPicture.asset(AppImages.welcome),
            const Gap(40),
            Text(
              'Welcome to Kabor',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SolidButton(
                    text: 'Sign up as User',
                    onPressed: () => context.pushNamed(AppRoutes.phoneNumber),
                  ),
                  const Gap(15),
                  BorderButton(
                    text: 'Sign up as an artisan',
                    onPressed: () => context.goNamed(AppRoutes.login),
                  ),
                  // const AdaptivePrimaryButton(),
                ],
              ),
            ),
            const Gap(10),
          ],
        ),
      ),
    );
  }
}
