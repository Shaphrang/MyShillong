//lib\modules\home\data\datasources\home_remote_datasource.dart
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeRemoteDataSource {
  final SupabaseClient supabase;

  HomeRemoteDataSource(this.supabase);

  Future<Map<String, dynamic>> fetchHomeData({
    required double userLat,
    required double userLng,
  }) async {
    final response = await supabase.rpc(
      'get_home_data', // your RPC function name
      params: {
        'user_lat': userLat,
        'user_lng': userLng,
      },
    );

    return response as Map<String, dynamic>;
  }
}