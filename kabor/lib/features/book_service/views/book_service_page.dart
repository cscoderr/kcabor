import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/core/widgets/src/custom_button.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class BookService extends StatelessWidget {
  const BookService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KaborAppBar(title: 'Book service'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Information',
                style: context.$style.bodyLarge,
              ),
              const Gap(10),
              Text(
                'Your Address',
                style: context.$style.bodyLarge,
              ),
              const Gap(10),
              const AppTextField(
                prefixIcon: Icon(Iconsax.location),
                hintText: 'Enter Address',
              ),
              const Gap(10),
              AppTextField(
                suffixIcon: const Icon(Iconsax.calendar),
                labelText: 'Pick a date ',
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.white,
                    clipBehavior: Clip.none,
                    elevation: 10,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    builder: (context) {
                      return Column(
                        children: [
                          const Gap(10),
                          Text(
                            'Pick a date',
                            style: context.$style.titleLarge,
                          ),
                          const Gap(3),
                          SfDateRangePicker(
                            showNavigationArrow: true,
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              const Gap(10),
              const AppTextField(
                suffixIcon: Icon(Iconsax.timer_1),
                labelText: 'Select a time  ',
              ),
              const Gap(15),
              Text(
                'Description',
                style: context.$style.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(10),
              const AppTextField(
                hintText: 'Description',
              ),
              const Spacer(),
              MyCustombutton(
                text: 'Continue',
                onTap: () => context.pushNamed(AppRoutes.reviewBooking),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
