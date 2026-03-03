//lib\modules\home\data\repositories\home_repository_impl.dart
import '../../domain/entities/home_data.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_datasource.dart';
import '../models/home_data_model.dart';
import '../models/offer_model.dart';
import '../models/category_model.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl(this.remoteDataSource);

  HomeData? _cachedData;
  DateTime? _lastFetchTime;

  @override
  Future<HomeData> getHomeData({
    required double userLat,
    required double userLng,
  }) async {
    // ✅ 5-minute cache
    if (_cachedData != null &&
        _lastFetchTime != null &&
        DateTime.now().difference(_lastFetchTime!).inMinutes < 5) {
      return _cachedData!;
    }

    final json = await remoteDataSource.fetchHomeData(
      userLat: userLat,
      userLng: userLng,
    );

    final model = HomeDataModel.fromJson(json);

    // ✅ Map JSON → Domain Entities
final categories = (model.categories as List)
    .map((e) => CategoryModel.fromJson(e).toEntity())
    .toList();

final foodOffers = (model.foodOffers as List)
    .map((e) => OfferModel.fromJson(e).toEntity())
    .toList();

final clothingOffers = (model.clothingOffers as List)
    .map((e) => OfferModel.fromJson(e).toEntity())
    .toList();
final homeData = HomeData(
  userArea: model.userArea,
  generatedAt: DateTime.tryParse(model.generatedAt) ?? DateTime.now(),
  categories: categories,
  foodOffers: foodOffers,
  clothingOffers: clothingOffers,
  foodTotalCount: model.foodTotalCount,
  clothingTotalCount: model.clothingTotalCount,
);

    _cachedData = homeData;
    _lastFetchTime = DateTime.now();

    return homeData;
  }
}