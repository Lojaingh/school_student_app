import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:school_student_app/constant/student_app_color.dart';
import 'package:school_student_app/cubit/login/login_cubit.dart';
import 'package:school_student_app/cubit/login/login_state.dart';

import '../widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StudentAppColors.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 430,
              ),
              child: BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Login successful'),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }

                  if (state is LoginError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        backgroundColor: StudentAppColors.error,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return _buildCard(
                    context,
                    state,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(
    BuildContext context,
    LoginState state,
  ) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        26,
        34,
        26,
        28,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.94),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.white.withOpacity(0.9),
        ),
        boxShadow: [
          BoxShadow(
            color: StudentAppColors.primary.withOpacity(0.10),
            blurRadius: 35,
            offset: const Offset(0, 18),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildStudentIcon(),
          const SizedBox(height: 22),
          const Text(
            'Welcome, Student!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: StudentAppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Sign in to access your student portal',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.5,
              height: 1.5,
              color: StudentAppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 30),
          LoginForm(
            isLoading: state is LoginLoading,
            onLogin: (username, password) {
              context.read<LoginCubit>().login(
                    username,
                    password,
                  );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStudentIcon() {
    return Container(
      width: 88,
      height: 88,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: StudentAppGradients.icon,
        boxShadow: [
          BoxShadow(
            color: StudentAppColors.primary.withOpacity(0.22),
            blurRadius: 24,
            spreadRadius: 2,
            offset: const Offset(0, 9),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Icon(
            Icons.person_rounded,
            color: Colors.white,
            size: 52,
          ),
          Positioned(
            top: 12,
            child: Transform.rotate(
              angle: -0.08,
              child: const Icon(
                Icons.school_rounded,
                color: Colors.white,
                size: 39,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
