import 'package:flutter/material.dart';
import 'package:nawel/core/utils/assets_manager.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.pink.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.asset(AssetsManager.banner, fit: BoxFit.contain),
      ),
    );
  }
}
