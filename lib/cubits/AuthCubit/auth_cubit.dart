import 'package:bloc/bloc.dart';
import 'package:coffe_shop/models/user.dart';
import 'package:coffe_shop/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthResponse authResponse = AuthResponse();
  UserModel user = UserModel();

  AuthCubit() : super(AuthInitial()) {
    Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      final session = data.session;
      final event = data.event;

      if (session == null || event == AuthChangeEvent.signedOut) {
        emit(AuthInitial());
      }
    });
  }

  signUp(String email, String password, BuildContext context) async {
    emit(AuthLoading());
    try {
      authResponse = await AuthService().signUp(email, password);
      user.email = authResponse.user?.email;
      user.id = authResponse.user?.id;
      user.createdAt = authResponse.user?.createdAt;
      emit(AuthSignUpSuccess(user: user));
    } on AuthException catch (e) {
      emit(AuthFailure(errorMessage: e.message));
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  signIn(String email, String password, BuildContext context) async {
    emit(AuthLoading());
    try {
      authResponse = await AuthService().signIn(email, password);
      user.email = authResponse.user?.email;
      user.id = authResponse.user?.id;
      user.createdAt = authResponse.user?.createdAt;
      emit(AuthSignInSuccess(user: user));
    } on AuthException catch (e) {
      emit(AuthFailure(errorMessage: e.message));
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  signOut() async {
    emit(AuthLoading());
    try {
      await AuthService().signOut();
      emit(AuthInitial());
    } on AuthException catch (e) {
      emit(AuthFailure(errorMessage: e.message));
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  Future<void> checkIfUserIsLoggedIn() async {
    // ignore: await_only_futures
    final session = await Supabase.instance.client.auth.currentSession;
    if (session != null) {
      user.email = session.user.email;
      user.id = session.user.id;
      user.createdAt = session.user.createdAt;
      emit(AuthSignInSuccess(user: user));
    } else {
      emit(AuthInitial());
    }
  }
}
