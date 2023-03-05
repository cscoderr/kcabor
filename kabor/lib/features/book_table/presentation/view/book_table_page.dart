import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/book_table/book_table.dart';

class BookTablePage extends HookConsumerWidget {
  const BookTablePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tables = useState(<String>[]);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppCloseButton(
                    color: AppColors.primaryColor2,
                  ),
                  Text(
                    'Book a table',
                    style: context.$style.titleLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const AppCallButton(),
                ],
              ),
              const Gap(40),
              const SelectBox(
                value: '',
                items: [
                  SelectBoxItem(
                    value: '',
                    child: Text('No of memebers'),
                  ),
                  SelectBoxItem(
                    value: '1',
                    child: Text('1'),
                  ),
                  SelectBoxItem(
                    value: '3',
                    child: Text('3'),
                  ),
                  SelectBoxItem(
                    value: '5',
                    child: Text('5'),
                  )
                ],
              ),
              const Gap(20),
              const DateInputBox(
                hintText: 'Select Date',
              ),
              const Gap(20),
              const DateInputBox(
                hintText: 'Select Time',
                mode: DateTimeFieldPickerMode.time,
              ),
              const Gap(30),
              Text(
                'Pick a table',
                style: context.$style.titleSmall!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 17,
                  ),
                  itemCount: 30,
                  itemBuilder: (BuildContext context, int index) {
                    return BookTableButton(
                      text: '${index + 1}',
                      selected: tables.value.contains('${index + 1}'),
                      onTap: () {
                        tables.value.add('${index + 1}');
                        tables.value;
                      },
                    );
                  },
                ),
              ),
              const Gap(10),
              SolidButton(
                text: 'Book Reservation',
                onPressed: () => context.pushNamed(AppRoutes.reservation),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
