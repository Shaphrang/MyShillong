//lib\core\network\supabase_client.dart
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseClientProvider {
  static final client = Supabase.instance.client;
}