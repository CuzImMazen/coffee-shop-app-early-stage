import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  SupabaseClient supabaseClient = Supabase.instance.client;

  Future<AuthResponse> signUp(String email, String password) async {
    AuthResponse authResponse = await supabaseClient.auth.signUp(
      email: email,
      password: password,
    );
    return authResponse;
  }

  Future<AuthResponse> signIn(String email, String password) async {
    AuthResponse authResponse = await supabaseClient.auth.signInWithPassword(
      email: email,
      password: password,
    );
    return authResponse;
  }

  Future<void> signOut() async {
    await supabaseClient.auth.signOut();
  }
}
