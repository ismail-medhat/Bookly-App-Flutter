import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  AuthSuccess({required this.user});
  final User user;
}

class AuthFaliure extends AuthState {
  AuthFaliure({required this.message});
  final String message;
}
