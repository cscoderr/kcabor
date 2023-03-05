import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:kabor/core/core.dart';
import 'package:kabor/features/home/presentation/widgets/nearby_lists.dart';
import 'package:kabor/features/home_artisan/widgets/monthly_revenue_chart.dart';
import 'package:kabor/features/home_artisan/widgets/services_lists.dart';

class HomeTabCard extends StatelessWidget {
  const HomeTabCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: SvgPicture.asset('assets/images/verify.svg')),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkResponse(
                onTap: () => context.pushNamed(AppRoutes.allServices),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  height: 125,
                  width: 112,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xffF2F2F5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset('assets/images/tile.svg'),
                      Text(
                        '1',
                        style: context.$style.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Total Services',
                        style: context.$style.bodyLarge!.copyWith(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkResponse(
                onTap: () => context.pushNamed(AppRoutes.totalBookings),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  height: 125,
                  width: 112,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xffF2F2F5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset('assets/images/tile.svg'),
                      Text(
                        '1315',
                        style: context.$style.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Total Bookings',
                        style: context.$style.bodyLarge!.copyWith(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkResponse(
                onTap: () => context.pushNamed(AppRoutes.earnings),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  height: 125,
                  width: 112,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xffF2F2F5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset('assets/images/tile.svg'),
                      Text(
                        'N534,000',
                        style: context.$style.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Total Earnings',
                        style: context.$style.bodyLarge!.copyWith(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Gap(20),
          Text(
            'Your Monthly Revenue',
            style: context.$style.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(10),
          const MonthlyRevenue(),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Your Services',
                style: context.$style.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () => context.pushNamed(AppRoutes.allServices),
                child: Text(
                  'View All',
                  style: context.$style.bodyLarge!.copyWith(
                    color: const Color(0xff3DA925),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          const Gap(10),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 230,
            child: const ServicesCard(),
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Nearby Services',
                style: context.$style.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () => context.pushNamed(AppRoutes.allServices),
                child: Text(
                  'View All',
                  style: context.$style.bodyLarge!.copyWith(
                    color: const Color(0xff3DA925),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          const Gap(10),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 270,
            child: const NearbyServices(),
          ),
        ],
      ),
    );
  }
}
