import 'dart:io';
import 'package:dio/dio.dart';
import 'package:expense_tracking_app/constants/path_constants.dart';
import 'package:expense_tracking_app/exeptions/custom_exeptions.dart';
import 'package:expense_tracking_app/features/auth/models/login/login_request_model.dart';
import 'package:expense_tracking_app/features/auth/models/login/login_response_model.dart';
import 'package:expense_tracking_app/features/auth/models/register/register_request_model.dart';
import 'package:expense_tracking_app/features/auth/models/register/register_response_model.dart';
import 'package:expense_tracking_app/features/auth/services/IAuthService.dart';
import 'package:expense_tracking_app/utils/token_util.dart';

class AuthService extends IAuthService {
  AuthService(Dio dio) : super(dio);

  @override
  Future<LoginResponseModel?> login(LoginRequestModel loginRequestModel) async {
    LoginResponseModel? responseData;
    try {
      final response =
          await dio.post(PathConstants.loginUrl, data: loginRequestModel);

      if (response.statusCode == HttpStatus.created) {
        responseData = LoginResponseModel.fromJson(response.data);

        final accessToken = responseData.accessToken ?? "";
        await TokenUtil.setAccessToken(accessToken);
      }
    } on DioError catch (e) {
      switch (e.response?.statusCode) {
        case HttpStatus.unauthorized:
          throw UnauthorizedExeption("Invalid username or password.");
        default:
          throw InternalServerErrorExeption("Something went wrong.");
      }
    }

    return responseData;
  }

  @override
  Future<RegisterResponseModel?> register(
      RegisterRequestModel registerRequestModel) async {
    final RegisterResponseModel data;
    try {
      final response =
          await dio.post(PathConstants.registerUrl, data: registerRequestModel);
      data = RegisterResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      switch (e.response?.statusCode) {
        case HttpStatus.conflict:
          throw UserConflictExeption(
              "This username is already exist. Please provide another one.");
        default:
          throw InternalServerErrorExeption("Something went wrong.");
      }
    }

    return data;
  }
}
