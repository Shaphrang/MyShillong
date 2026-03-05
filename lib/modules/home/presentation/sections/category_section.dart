//lib\modules\home\presentation\sections\category_section.dart
import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      "All",
      "Cafes",
      "Restaurants",
      "Clothing",
      "Homestays",
      "Accessories",
      "Tourism",
    ];

    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        itemBuilder: (context, index) {

          return Container(
            margin: const EdgeInsets.only(right: 8),
            padding: const EdgeInsets.symmetric(horizontal: 14),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: index == 0
                  ? Colors.black
                  : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Text(
              categories[index],
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: index == 0
                    ? Colors.white
                    : Colors.black87,
              ),
            ),
          );
        },
      ),
    );
  }
}