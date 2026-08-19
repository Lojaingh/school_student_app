import 'package:dio/dio.dart';
import 'package:school_student_app/model/login_model.dart';
import 'package:school_student_app/service/auth_service.dart';

class AuthRepository {
  final AuthService service;

  AuthRepository(this.service);

  Future<LoginResponse> login(
    String username,
    String password,
  ) async {
    try {
      final response = await service.login(
        username: username,
        password: password,
      );

      return LoginResponse.fromJson(
        Map<String, dynamic>.from(response.data),
      );
    } on DioException catch (e) {
      final data = e.response?.data;

      if (data is Map && data['message'] != null) {
        throw Exception(data['message'].toString());
      }

      throw Exception(
        e.message ?? 'Unable to connect to the server',
      );
    }
  }
}
