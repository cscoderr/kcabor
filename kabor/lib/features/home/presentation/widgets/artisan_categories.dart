import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:kabor/core/configs/app_extensions.dart';

class ArtisanCategories extends StatelessWidget {
  const ArtisanCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              height: 58,
              width: 58,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color(0xffFFCD99),
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
      itemCount: 6,
      separatorBuilder: (context, index) => const SizedBox(width: 10),
    );
  }
}
