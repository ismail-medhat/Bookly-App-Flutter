import 'auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repos/auth_repo.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepository}) : super(AuthInitial());

  AuthRepository authRepository;

  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final result =
          await authRepository.login(email: email, password: password);
      if (result == null) {
        emit(AuthFaliure(message: 'User not found'));
      } else {
        emit(AuthSuccess(user: result));
      }
    } catch (e) {
      emit(AuthFaliure(message: e.toString()));
    }
  }

  Future<void> registerUser(
      {required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final result =
          await authRepository.createAccount(email: email, password: password);
      if (result == null) {
        emit(AuthFaliure(message: 'User not found'));
      } else {
        emit(AuthSuccess(user: result));
      }
    } catch (e) {
      emit(AuthFaliure(message: e.toString()));
    }
  }
}
