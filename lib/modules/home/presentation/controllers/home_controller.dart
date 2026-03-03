//lib\modules\home\presentation\controllers\home_controller.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/home_data.dart';
import '../../domain/usecases/get_home_data.dart';

class HomeController extends StateNotifier<AsyncValue<HomeData>> {
  final GetHomeData getHomeData;

  HomeController(this.getHomeData) : super(const AsyncLoading());

  Future<void> loadHome(double lat, double lng) async {
    try {
      state = const AsyncLoading();
      final data = await getHomeData(userLat: lat, userLng: lng);
      state = AsyncData(data);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }
}