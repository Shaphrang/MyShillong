//lib\modules\home\domain\usecases\get_home_data.dart
import '../entities/home_data.dart';
import '../repositories/home_repository.dart';

class GetHomeData {
  final HomeRepository repository;

  GetHomeData(this.repository);

  Future<HomeData> call({
    required double userLat,
    required double userLng,
  }) {
    return repository.getHomeData(
      userLat: userLat,
      userLng: userLng,
    );
  }
}