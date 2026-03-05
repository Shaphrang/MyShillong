//lib\modules\home\presentation\pages\home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../sections/banner_sections.dart';
import '../providers/home_providers.dart';
import '../sections/best_deals_section.dart';
import '../sections/category_section.dart';
import '../sections/welcome_hero_section.dart';
import '../sections/category_card_section.dart';
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
      backgroundColor: const Color(0xFFF6F7FB),
      body: SafeArea(
        child: state.when(
          loading: () => const HomeShimmer(),
          error: (e, _) => _ErrorState(message: e.toString()),
          data: (homeData) {
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [

//lib\modules\home\presentation\pages\home_page.dart

SliverToBoxAdapter(child: WelcomeHeroSection()),

SliverToBoxAdapter(child: SizedBox(height: 10)),

SliverToBoxAdapter(child: CategoryCardSection()),

SliverToBoxAdapter(child: SizedBox(height: 10)),

SliverToBoxAdapter(child: BannerSection()),

SliverToBoxAdapter(child: SizedBox(height: 12)),

SliverToBoxAdapter(child: CategorySection()),

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