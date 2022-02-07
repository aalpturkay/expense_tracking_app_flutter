import 'package:dio/dio.dart';
import 'package:expense_tracking_app/features/auth/models/login/login_request_model.dart';
import 'package:expense_tracking_app/features/auth/models/login/login_response_model.dart';
import 'package:expense_tracking_app/features/auth/models/register/register_request_model.dart';
import 'package:expense_tracking_app/features/auth/models/register/register_response_model.dart';

abstract class IAuthService {
  final Dio dio;

  IAuthService(this.dio);
  Future<RegisterResponseModel?> register(
      RegisterRequestModel registerRequestModel);
  Future<LoginResponseModel?> login(LoginRequestModel loginRequestModel);
}
