import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_student_app/helper/shared_prefs_helper.dart';
import 'package:school_student_app/repository/auth_repository.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository repository;

  LoginCubit(this.repository) : super(LoginInitial());

  Future<void> login(
    String username,
    String password,
  ) async {
    if (username.trim().isEmpty || password.isEmpty) {
      emit(
        LoginError('Please enter username and password'),
      );
      return;
    }

    try {
      emit(LoginLoading());

      final response = await repository.login(
        username.trim(),
        password,
      );

      await SharedPrefsHelper.saveToken(
        response.token,
      );

      final isStudent = response.roles.any(
        (role) => role.roleId == 6 && role.title.toLowerCase() == 'student',
      );

      if (!isStudent) {
        emit(
          LoginError(
            'This account is not a student account',
          ),
        );
        return;
      }

      emit(LoginSuccess());
    } catch (e) {
      emit(
        LoginError(
          e.toString().replaceFirst('Exception: ', ''),
        ),
      );
    }
  }
}
