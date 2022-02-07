import 'package:dio/dio.dart';
import 'package:expense_tracking_app/features/auth/models/login/login_request_model.dart';
import 'package:expense_tracking_app/features/auth/models/register/register_request_model.dart';
import 'package:expense_tracking_app/features/auth/services/auth_service.dart';
import 'package:expense_tracking_app/utils/dio_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AuthService service;

  generateService() {
    service = AuthService(DioUtil.createDioInstance());
  }

  group('AuthService', () {
    setUp(() => generateService());
    test(
      'test register method',
      () async {
        final response = await service.register(
            RegisterRequestModel(username: "alp32131235", password: "12345"));

        expect(response?.accessToken?.isNotEmpty, true);
      },
    );
    test(
      'test login method',
      () async {
        final response = await service.login(
            LoginRequestModel(username: "aykutalp35", password: "12345"));

        expect(response?.accessToken?.isNotEmpty, true);
      },
    );
  });
}
