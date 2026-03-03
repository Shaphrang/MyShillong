//lib\modules\home\presentation\sections\best_deals_section.dart
import 'package:flutter/material.dart';
import '../../domain/entities/offer.dart';
import '../widgets/compact_offer_card.dart';

class BestDealsSection extends StatelessWidget {
  final String title;
  final List<Offer> deals;
  final bool showViewAll;

  const BestDealsSection({
    super.key,
    required this.title,
    required this.deals,
    required this.showViewAll,
  });

  @override
  Widget build(BuildContext context) {
    if (deals.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// Section Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (showViewAll)
                TextButton(
                  onPressed: () {},
                  child: const Text("View All"),
                )
            ],
          ),
        ),

        const SizedBox(height: 8),

        /// Vertical compact list
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: deals.length,
          itemBuilder: (context, index) {
            return CompactOfferCard(offer: deals[index]);
          },
        ),

        const SizedBox(height: 16),
      ],
    );
  }
}