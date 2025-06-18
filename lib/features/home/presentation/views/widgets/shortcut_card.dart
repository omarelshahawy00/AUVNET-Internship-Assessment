import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nawel/core/utils/assets_manager.dart';

class ShortcutCardList extends StatelessWidget {
  const ShortcutCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 19),
      child: SizedBox(
        height: 90,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            ShortcutCard(
              title: 'Past orders',
              image: AssetsManager.transactionOrder,
            ),
            ShortcutCard(title: 'Super Saver', image: AssetsManager.group9),
            ShortcutCard(title: 'Must-tries', image: AssetsManager.group9),
            ShortcutCard(title: 'Give Back', image: AssetsManager.group9),
            ShortcutCard(
              title: 'Best Sellers',
              image: AssetsManager.starFilled,
            ),
          ],
        ),
      ),
    );
  }
}

class ShortcutCard extends StatelessWidget {
  final String title;
  final String image;

  const ShortcutCard({required this.title, required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),

          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: const Color(0xffffeee6),
            borderRadius: BorderRadius.circular(12),
          ),
          child: SvgPicture.asset(image, fit: BoxFit.contain),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
