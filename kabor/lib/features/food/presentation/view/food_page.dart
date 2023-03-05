import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:kabor/core/core.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180&q=80',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Positioned(
                    left: 15,
                    top: 10,
                    child: AppCloseButton(
                      color: AppColors.primaryColor2,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Poached - GRA, Ilorin',
                          style: context.$style.headline5?.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          'Poached- GRA, Ilorin',
                          style: context.$style.labelLarge?.copyWith(),
                        ),
                      ],
                    ),
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Poached, garnished with parlsey ',
                          style: context.$style.labelLarge?.copyWith(),
                        ),
                        Text(
                          'NGN 3500',
                          style: context.$style.labelLarge?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const Gap(20),
                    Text(
                      'Select your side ',
                      style: context.$style.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      'Choose 1',
                      style: context.$style.labelLarge?.copyWith(),
                    ),
                    const Gap(20),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'French Toast ',
                        style: context.$style.labelLarge?.copyWith(),
                      ),
                      trailing: Radio(
                        value: false,
                        groupValue: '',
                        onChanged: (value) {},
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'French Toast ',
                        style: context.$style.labelLarge?.copyWith(),
                      ),
                      trailing: Radio(
                        value: false,
                        groupValue: '',
                        onChanged: (value) {},
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'French Toast ',
                        style: context.$style.labelLarge?.copyWith(),
                      ),
                      trailing: Radio(
                        value: false,
                        groupValue: '',
                        onChanged: (value) {},
                      ),
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Quantity ',
                            style: context.$style.titleSmall?.copyWith(
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        const QuantityRangeButton(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Text(
                    'NGN 7000',
                    style: context.$style.headline5?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const Gap(5),
                  Text(
                    '3 Items ',
                    style: context.$style.labelLarge?.copyWith(
                      color: AppColors.dark2,
                    ),
                  ),
                  const Gap(15),
                  Expanded(
                    child: SolidButton(
                      text: 'View Order',
                      onPressed: () =>
                          context.pushNamed(AppRoutes.orderDetails),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
