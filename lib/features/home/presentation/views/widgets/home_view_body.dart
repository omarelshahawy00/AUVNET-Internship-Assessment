import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/features/home/presentation/views/widgets/header_card.dart';
import 'package:nawel/features/home/presentation/views/widgets/my_carousel_with_indicator.dart';
import 'package:nawel/features/home/presentation/views/widgets/popular_restaurants.dart';
import 'package:nawel/features/home/presentation/views/widgets/promo_box.dart';
import 'package:nawel/features/home/presentation/views/widgets/service_card.dart';
import 'package:nawel/features/home/presentation/views/widgets/shortcut_card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderCard(),
          const SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Services:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          const SizedBox(height: 20),
          const ServiceCardList(),
          const SizedBox(height: 20),
          const PromoBox(),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Shortcuts:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          const SizedBox(height: 20),
          const ShortcutCardList(),
          const SizedBox(height: 25),
          const CustomCarouselWithIndicator(),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const Text(
              'Popular restaurants nearby',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          const SizedBox(height: 16),
          const PopularRestaurants(),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
