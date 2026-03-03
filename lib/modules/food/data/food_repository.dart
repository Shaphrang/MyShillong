import 'food_remote_source.dart';

class FoodRepository {
  final FoodRemoteSource _remote = FoodRemoteSource();

  Future<List<dynamic>> getTodayOffers() {
    return _remote.getTodayOffers();
  }
}