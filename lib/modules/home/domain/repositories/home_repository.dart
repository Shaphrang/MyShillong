//lib\modules\home\domain\repositories\home_repository.dart
import '../entities/home_data.dart';

abstract class HomeRepository {
  Future<HomeData> getHomeData({
    required double userLat,
    required double userLng,
  });
}