//lib\modules\home\presentation\sections\welcome_hero_section.dart
import 'package:flutter/material.dart';

class WelcomeHeroSection extends StatelessWidget {
  const WelcomeHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        /// abstract background shapes
        Positioned(
          top: -60,
          right: -60,
          child: Container(
            width: 220,
            height: 220,
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.07),
              shape: BoxShape.circle,
            ),
          ),
        ),

        Positioned(
          top: 30,
          left: -50,
          child: Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.05),
              shape: BoxShape.circle,
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Top bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.menu),
                  Icon(Icons.notifications_none),
                ],
              ),

              const SizedBox(height: 18),

              const Text(
                "MyShillong",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                "Discover local deals in Shillong",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}