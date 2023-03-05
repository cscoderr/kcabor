import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:kabor/core/configs/app_extensions.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/core/widgets/src/app_back_button.dart';

class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Row(
                children: [
                  const AppBackButton(),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Awotundun Maimunah ',
                        style: context.$style.titleLarge,
                      ),
                    ),
                  ),
                  SvgPicture.asset('assets/images/call.svg'),
                ],
              ),
              const Gap(20),
              Center(
                child: Text(
                  'Monday 9:38 AM',
                  style: context.$style.bodyMedium!.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ),
              const Gap(10),
              Center(
                child: Text(
                  'Keep your account safe-never share personal or account information in this chat including phone numbers. PINs or passcodes, Kabor will never ask for this information over chat.',
                  textAlign: TextAlign.center,
                  style: context.$style.bodyMedium,
                ),
              ),
              const Gap(10),
              Align(
                alignment: Alignment.centerRight,
                child: BubbleNormal(
                  text: 'I’m here',
                  color: const Color(0xff3DA925),
                  textStyle: context.$style.bodyLarge!.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              const Gap(5),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Delivered',
                  textAlign: TextAlign.right,
                  style: context.$style.bodyMedium!.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ),
              const Spacer(),
              AppTextField(
                hintText: 'Send a message',
                radius: 30,
                prefix: SvgPicture.asset(
                  'assets/images/chat1.svg',
                ),
                suffix: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset('assets/images/camera.svg'),
                      const Gap(5),
                      SvgPicture.asset('assets/images/vn.svg'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
