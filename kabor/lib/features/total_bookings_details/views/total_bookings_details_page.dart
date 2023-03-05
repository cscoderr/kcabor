import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:kabor/core/configs/app_extensions.dart';
import 'package:kabor/core/widgets/src/app_back_button.dart';

class TotalBookingsDetails extends StatelessWidget {
  const TotalBookingsDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppBackButton(),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Writing',
                        textAlign: TextAlign.left,
                        style: context.$style.headline5!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(15),
            ],
          ),
        ),
      ),
    );
  }
}
