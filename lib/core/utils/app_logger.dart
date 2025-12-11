// Package imports:
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class AppLogger {
  static Future<void> log({
    required String level,
    required String message,
    String? stack,
    String? userId,
  }) async {
    try {
      await supabase.from('app_logs').insert({
        'level': level,
        'message': message,
        'stack': stack,
        'user_id': userId,
      });
    } catch (e) {
      // evita que falha no logging quebre o app
      print('Erro ao gravar log: $e');
    }
  }
}
