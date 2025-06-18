import 'package:flutter/material.dart';
import 'package:nawel/core/utils/assets_manager.dart';

class PopularRestaurants extends StatelessWidget {
  const PopularRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {'name': 'Allo Beirut', 'time': '32 mins'},
      {'name': 'Laffah', 'time': '38 mins'},
      {'name': 'Falafil Al Rabiah', 'time': '44 mins'},
      {'name': 'Barbar', 'time': '34 mins'},
    ];

    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: SizedBox(
        height: 120,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Container(
              width: 100,
              margin: const EdgeInsets.only(right: 0),
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(AssetsManager.res),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item['name']!,
                    style: const TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 12,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        item['time']!,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
