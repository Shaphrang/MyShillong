  //lib\modules\home\data\models\offer_model.dart
import '../../domain/entities/offer.dart';

class OfferModel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;

  final String businessId;
  final String businessName;
  final String? logoUrl;
  final String? area;
  final String? phoneWhatsapp;

  OfferModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.businessId,
    required this.businessName,
    this.logoUrl,
    this.area,
    this.phoneWhatsapp,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      id: json['id'].toString(),
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['image_url'] ?? '',
      businessId: json['business_id']?.toString() ?? '',
      businessName: json['business_name'] ?? '',
      logoUrl: json['logo_url'],
      area: json['area'],
      phoneWhatsapp: json['phone_whatsapp'],
    );
  }

  Offer toEntity() {
    return Offer(
      id: id,
      title: title,
      description: description,
      imageUrl: imageUrl,
      businessId: businessId,
      businessName: businessName,
      logoUrl: logoUrl,
      area: area,
      phoneWhatsapp: phoneWhatsapp,
    );
  }
}