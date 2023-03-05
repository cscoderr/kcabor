import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class RequestPaymentPage extends ConsumerWidget {
  const RequestPaymentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const KaborAppBar(
        title: 'Scan me',
        leading: AppCloseButton(
          color: AppColors.primaryColor2,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                      child: Stack(
                        children: [
                          SfBarcodeGenerator(
                            value: 'www.syncfusion.com',
                            symbology: QRCode(),
                          ),
                          if (2 == 3)
                            Positioned.fill(
                              child: Image.asset(AppImages.logoDark),
                            )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '23344567',
                          style: context.$style.titleLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Icon(Iconsax.copy),
                      ],
                    ),
                  ],
                ),
              ),
              SolidButton(
                text: 'Share',
                onPressed: () {
                  Share.share(
                    'check out my website https://example.com',
                    subject: 'Look what I made!',
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
