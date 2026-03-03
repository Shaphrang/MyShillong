//lib\modules\home\presentation\pages\home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../sections/banner_sections.dart';
import '../providers/home_providers.dart';
import '../sections/best_deals_section.dart';
import '../sections/category_section.dart';
import '../widgets/shimer_widgets.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(homeControllerProvider.notifier)
          .loadHome(25.5788, 91.8933);
    });
  }
  

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeControllerProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: state.when(
          loading: () => const HomeShimmer(),
          error: (e, _) => _ErrorState(message: e.toString()),
          data: (homeData) {
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [

SliverToBoxAdapter(child: _WelcomeSection()),

SliverToBoxAdapter(child: SizedBox(height: 16)),

SliverToBoxAdapter(child: BannerSection()),

SliverToBoxAdapter(child: SizedBox(height: 20)),

SliverToBoxAdapter(child: CategoryChips()),

SliverToBoxAdapter(child: SizedBox(height: 20)),

SliverToBoxAdapter(
  child: BestDealsSection(
    title: "Food Offers",
    deals: homeData.foodOffers,
    showViewAll: homeData.hasFoodViewAll,
  ),
),

SliverToBoxAdapter(
  child: BestDealsSection(
    title: "Clothing Offers",
    deals: homeData.clothingOffers,
    showViewAll: homeData.hasClothingViewAll,
  ),
),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _WelcomeSection extends StatelessWidget {
  const _WelcomeSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF16A34A),
            Color(0xFF0F7B53),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [

          /// Top Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.menu, color: Colors.white),
              Text(
                "MyShillong",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Icon(Icons.notifications_none, color: Colors.white),
            ],
          ),

          const SizedBox(height: 20),

          /// Search
          Container(
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: "Search deals...",
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class _ErrorState extends StatelessWidget {
  final String message;

  const _ErrorState({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          "Something went wrong\n$message",
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}