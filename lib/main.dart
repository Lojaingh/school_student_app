import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:school_student_app/constant/student_app_color.dart';
import 'package:school_student_app/cubit/login/login_cubit.dart';
import 'package:school_student_app/network/dio_client.dart';
import 'package:school_student_app/repository/auth_repository.dart';
import 'package:school_student_app/service/auth_service.dart';

import 'presentation/screens/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DioClient.init();

  runApp(const StudentApp());
}

class StudentApp extends StatelessWidget {
  const StudentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(
        AuthRepository(
          AuthService(DioClient.dio),
        ),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Student App',
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: StudentAppColors.background,
          colorScheme: ColorScheme.fromSeed(
            seedColor: StudentAppColors.primary,
          ),
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
