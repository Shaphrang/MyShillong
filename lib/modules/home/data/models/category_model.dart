//lib\modules\home\data\models\category_model.dart

import '../../domain/entities/category.dart';

class CategoryModel {
  final String id;
  final String name;
  final String iconUrl;

  CategoryModel({
    required this.id,
    required this.name,
    required this.iconUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      iconUrl: json['icon_url'] ?? '',
    );
  }

  Category toEntity() {
    return Category(
      id: id,
      name: name,
      iconUrl: iconUrl,
    );
  }
}