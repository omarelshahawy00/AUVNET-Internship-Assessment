import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/core/theme/colors_manager.dart';
import 'package:nawel/core/utils/assets_manager.dart';

class ServiceCardList extends StatelessWidget {
  const ServiceCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 19),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ServiceCard(
            title: 'Food',
            subtitle: 'Up to 50%',
            image: AssetsManager.bur,
          ),
          ServiceCard(
            title: 'Health & wellness',
            subtitle: '20 mins',
            image: AssetsManager.med,
          ),
          ServiceCard(
            title: 'Groceries',
            subtitle: '15 mins',
            image: AssetsManager.vege,
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  const ServiceCard({
    required this.title,
    required this.subtitle,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
          // width: 85,
          // height: 70,
          decoration: BoxDecoration(
            color: ColorsManager.borderFilledColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(child: Image.asset(image)),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: ColorsManager.primaryColor,

            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            subtitle,
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
        Text(title, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
