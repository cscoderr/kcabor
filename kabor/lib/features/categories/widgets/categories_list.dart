import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:kabor/core/configs/app_extensions.dart';

class CategoriesCard extends StatelessWidget {
  const CategoriesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
      ),
      itemCount: 11,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              height: 69,
              width: 69,
              decoration: BoxDecoration(
                color: const Color(0xffFFCD99),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: SvgPicture.asset('assets/images/salon_comb.svg'),
              ),
            ),
            const Gap(5),
            Text(
              'Salon',
              style: context.$style.bodyLarge,
            )
          ],
        );
      },
    );
  }
}
