class Offer {
  final String id;
  final String title;
  final String description;
  final String imageUrl;

  final String businessId;
  final String businessName;
  final String? logoUrl;
  final String? area;
  final String? phoneWhatsapp;

  const Offer({
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
}