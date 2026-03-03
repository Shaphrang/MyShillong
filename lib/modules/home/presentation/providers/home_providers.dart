//lib\modules\home\presentation\providers\home_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/home_data.dart';
import '../controllers/home_controller.dart';
import '../../home_module.dart';

final homeControllerProvider =
    StateNotifierProvider<HomeController, AsyncValue<HomeData>>(
  (ref) => HomeController(ref.read(getHomeDataProvider)),
);