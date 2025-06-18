import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nawel/core/utils/assets_manager.dart';

class PromoBox extends StatelessWidget {
  const PromoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),

          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 8,
              spreadRadius: .5,
            ),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(AssetsManager.securityVault, fit: BoxFit.cover),
            const SizedBox(width: 5),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Got a code!',

                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Add your code and save on your orders',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
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
