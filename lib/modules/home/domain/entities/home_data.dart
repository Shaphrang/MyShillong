//lib\modules\home\domain\entities\home_data.dart

import 'category.dart';
import 'offer.dart';

class HomeData {
  final String userArea;
  final DateTime generatedAt;

  final List<Category> categories;
  final List<Offer> foodOffers;
  final List<Offer> clothingOffers;

  final int foodTotalCount;
  final int clothingTotalCount;

  const HomeData({
    required this.userArea,
    required this.generatedAt,
    required this.categories,
    required this.foodOffers,
    required this.clothingOffers,
    required this.foodTotalCount,
    required this.clothingTotalCount,
  });

  bool get hasFoodViewAll => foodTotalCount > 10;
  bool get hasClothingViewAll => clothingTotalCount > 10;
}