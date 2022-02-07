import 'package:bloc/bloc.dart';
import 'package:expense_tracking_app/exeptions/custom_exeptions.dart';
import 'package:expense_tracking_app/features/auth/models/login/login_request_model.dart';
import 'package:expense_tracking_app/features/auth/models/register/register_request_model.dart';
import 'package:expense_tracking_app/features/auth/services/auth_service.dart';
import 'package:expense_tracking_app/utils/token_util.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService authService;
  AuthCubit(this.authService) : super(AuthInitial());

  register({
    required String username,
    required String password,
  }) async {
    final registerRequestModel = RegisterRequestModel(
      username: username.trim(),
      password: password.trim(),
    );

    emit(AuthLoading());
    try {
      final response = await authService.register(registerRequestModel);
      if (response != null) {
        final accessToken = response.accessToken ?? "";
        await TokenUtil.setAccessToken(accessToken);

        emit(AuthLoaded());
      }
    } on UserConflictExeption catch (e) {
      emit(AuthError(message: e.message));
    } on InternalServerErrorExeption catch (e) {
      emit(AuthError(message: e.message));
    }
  }

  login({
    required String username,
    required String password,
  }) async {
    try {
      emit(AuthLoading());
      final response = await authService.login(LoginRequestModel(
        username: username.trim(),
        password: password.trim(),
      ));
      if (response != null) {
        emit(AuthLoaded());
      }
    } on UnauthorizedExeption catch (e) {
      emit(AuthError(message: e.message));
    } on InternalServerErrorExeption catch (e) {
      emit(AuthError(message: e.message));
    }
  }
}
