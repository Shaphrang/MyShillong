//lib/modules/home/presentation/sections/category_card_section.dart
import 'package:flutter/material.dart';

class CategoryCardSection extends StatelessWidget {
  const CategoryCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        "name": "Cafes",
        "icon": Icons.local_cafe,
        "color": Color(0xFFF97316),
        "bg": Color(0xFFFFF4ED)
      },
      {
        "name": "Restaurants",
        "icon": Icons.restaurant,
        "color": Color(0xFFEF4444),
        "bg": Color(0xFFFFF1F2)
      },
      {
        "name": "Clothing",
        "icon": Icons.checkroom,
        "color": Color(0xFF8B5CF6),
        "bg": Color(0xFFF5F3FF)
      },
      {
        "name": "Homestays",
        "icon": Icons.home,
        "color": Color(0xFF10B981),
        "bg": Color(0xFFECFDF5)
      },
      {
        "name": "Accessories",
        "icon": Icons.watch,
        "color": Color(0xFFF59E0B),
        "bg": Color(0xFFFFFBEB)
      },
      {
        "name": "Tourism",
        "icon": Icons.landscape,
        "color": Color(0xFF0EA5E9),
        "bg": Color(0xFFF0F9FF)
      },
      {
        "name": "Shop",
        "icon": Icons.shopping_bag,
        "color": Color(0xFFEC4899),
        "bg": Color(0xFFFDF2F8)
      },
      {
        "name": "Events",
        "icon": Icons.event,
        "color": Color(0xFF6366F1),
        "bg": Color(0xFFEEF2FF)
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 8,
          mainAxisSpacing: 10,
          childAspectRatio: 0.85,
        ),
        itemBuilder: (context, index) {
          final item = categories[index];

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              /// floating pill icon
              Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                  color: item["bg"] as Color,
                  borderRadius: BorderRadius.circular(20),

                  /// floating effect
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: Icon(
                  item["icon"] as IconData,
                  size: 20,
                  color: item["color"] as Color,
                ),
              ),

              const SizedBox(height: 4),

              /// category label
              Text(
                item["name"] as String,
                style: const TextStyle(
                  fontSize: 10.5,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          );
        },
      ),
    );
  }
}