//lib\modules\home\home_module.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'data/datasources/home_remote_datasource.dart';
import 'data/repositories/home_repository_impl.dart';
import 'domain/repositories/home_repository.dart';
import 'domain/usecases/get_home_data.dart';

final supabaseProvider = Provider<SupabaseClient>(
  (ref) => Supabase.instance.client,
);

final homeRemoteDataSourceProvider = Provider<HomeRemoteDataSource>(
  (ref) => HomeRemoteDataSource(ref.read(supabaseProvider)),
);

final homeRepositoryProvider = Provider<HomeRepository>(
  (ref) => HomeRepositoryImpl(ref.read(homeRemoteDataSourceProvider)),
);

final getHomeDataProvider = Provider<GetHomeData>(
  (ref) => GetHomeData(ref.read(homeRepositoryProvider)),
);