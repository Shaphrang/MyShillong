//lib\modules\home\data\models\home_data_model.dart
class HomeDataModel {
  final String userArea;
  final String generatedAt;

  final List<dynamic> categories;
  final List<dynamic> foodOffers;
  final List<dynamic> clothingOffers;

  final int foodTotalCount;
  final int clothingTotalCount;

  HomeDataModel({
    required this.userArea,
    required this.generatedAt,
    required this.categories,
    required this.foodOffers,
    required this.clothingOffers,
    required this.foodTotalCount,
    required this.clothingTotalCount,
  });

  factory HomeDataModel.fromJson(Map<String, dynamic> json) {
    return HomeDataModel(
      userArea: json['user_area'] ?? 'Shillong',
      generatedAt: json['generated_at'] ?? '',
      categories: json['categories'] ?? [],
      foodOffers: json['food_offers'] ?? [],
      clothingOffers: json['clothing_offers'] ?? [],
      foodTotalCount: json['food_total_count'] ?? 0,
      clothingTotalCount: json['clothing_total_count'] ?? 0,
    );
  }
}