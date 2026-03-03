import '../../../core/network/supabase_client.dart';

class FoodRemoteSource {
  final _client = SupabaseClientProvider.client;

  Future<List<dynamic>> getTodayOffers() async {
    final response = await _client
        .schema('food')
        .from('offers')
        .select()
        .eq('is_active', true);

    return response;
  }
}