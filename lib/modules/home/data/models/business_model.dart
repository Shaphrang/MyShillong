//lib\modules\home\data\models\business_model.dart
import '../../domain/entities/business.dart';

class BusinessModel {
  final String id;
  final String name;
  final String area;
  final String logoUrl;

  BusinessModel({
    required this.id,
    required this.name,
    required this.area,
    required this.logoUrl,
  });

  factory BusinessModel.fromJson(Map<String, dynamic> json) {
    return BusinessModel(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      area: json['area'] ?? '',
      logoUrl: json['logo_url'] ?? '',
    );
  }

  Business toEntity() {
    return Business(
      id: id,
      name: name,
      area: area,
      logoUrl: logoUrl,
    );
  }
}