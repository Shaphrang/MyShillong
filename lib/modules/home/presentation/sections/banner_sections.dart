//lib\modules\home\presentation\sections\banner_sections.dart
import 'package:flutter/material.dart';

class BannerSection extends StatelessWidget {
  const BannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = [
      [Color(0xFFE53935), Color(0xFFFF7043)],
      [Color(0xFF2563EB), Color(0xFF42A5F5)],
      [Color(0xFF16A34A), Color(0xFF4CAF50)],
      [Color(0xFF8E24AA), Color(0xFFBA68C8)],
      [Color(0xFFFFA000), Color(0xFFFFD54F)],
    ];

    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return Container(
            width: 260,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: colors[index],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(16),
            child: const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Special Offers",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}