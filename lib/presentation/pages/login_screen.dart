import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // ============================================================
  // Controllers
  // ============================================================

  final TextEditingController _usernameController =
      TextEditingController();

  final TextEditingController _passwordController =
      TextEditingController();

  // ============================================================
  // Form
  // ============================================================

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // ============================================================
  // State
  // ============================================================

  bool _obscurePassword = true;
  bool _rememberMe = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // ============================================================
  // Login
  // ============================================================

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // ----------------------------------------------------------
    // TODO:
    // هون لاحقاً منربط Login API
    //
    // مثال:
    //
    // final response = await authRepository.login(
    //   username: _usernameController.text.trim(),
    //   password: _passwordController.text,
    // );
    //
    // ----------------------------------------------------------

    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) return;

    setState(() {
      _isLoading = false;
    });

    // مؤقتاً لإظهار أن الزر يعمل
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Login API will be connected here'),
      ),
    );
  }

  // ============================================================
  // Forgot Password
  // ============================================================

  void _forgotPassword() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Forgot password screen will be added here'),
      ),
    );
  }

  // ============================================================
  // Build
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 20,
                  ),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 480,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildHeader(),

                          const SizedBox(height: 32),

                          _buildLoginCard(),

                          const SizedBox(height: 24),

                          _buildFooter(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // ============================================================
  // Header
  // ============================================================

  Widget _buildHeader() {
    return Column(
      children: [
        // Logo
        Container(
          width: 82,
          height: 82,
          decoration: BoxDecoration(
            gradient: AppGradients.buttonGradient,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.25),
                blurRadius: 25,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: const Icon(
            Icons.school_rounded,
            color: Colors.white,
            size: 42,
          ),
        ),

        const SizedBox(height: 22),

        const Text(
          'Welcome Back!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),

        const SizedBox(height: 8),

        const Text(
          'Sign in to access your student account',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // Login Card
  // ============================================================

  Widget _buildLoginCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.cardBorder,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.07),
            blurRadius: 30,
            offset: const Offset(0, 12),
          ),
          const BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sign In',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              'Enter your account details below',
              style: TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
              ),
            ),

            const SizedBox(height: 24),

            _buildUsernameField(),

            const SizedBox(height: 18),

            _buildPasswordField(),

            const SizedBox(height: 14),

            _buildRememberRow(),

            const SizedBox(height: 22),

            _buildLoginButton(),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // Username Field
  // ============================================================

  Widget _buildUsernameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Username or Email',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),

        const SizedBox(height: 8),

        TextFormField(
          controller: _usernameController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,

          decoration: InputDecoration(
            hintText: 'Enter your username or email',
            prefixIcon: const Icon(
              Icons.person_outline_rounded,
              color: AppColors.primary,
            ),

            suffixIcon: _usernameController.text.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      _usernameController.clear();
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.close_rounded,
                      size: 20,
                    ),
                  )
                : null,
          ),

          onChanged: (_) {
            setState(() {});
          },

          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Please enter your username or email';
            }

            return null;
          },
        ),
      ],
    );
  }

  // ============================================================
  // Password Field
  // ============================================================

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Password',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),

        const SizedBox(height: 8),

        TextFormField(
          controller: _passwordController,
          obscureText: _obscurePassword,
          textInputAction: TextInputAction.done,

          onFieldSubmitted: (_) {
            _login();
          },

          decoration: InputDecoration(
            hintText: 'Enter your password',

            prefixIcon: const Icon(
              Icons.lock_outline_rounded,
              color: AppColors.primary,
            ),

            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
              icon: Icon(
                _obscurePassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: AppColors.textSecondary,
              ),
            ),
          ),

          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }

            if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }

            return null;
          },
        ),
      ],
    );
  }

  // ============================================================
  // Remember Me + Forgot Password
  // ============================================================

  Widget _buildRememberRow() {
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: _rememberMe,
            activeColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            onChanged: (value) {
              setState(() {
                _rememberMe = value ?? false;
              });
            },
          ),
        ),

        const SizedBox(width: 8),

        const Expanded(
          child: Text(
            'Remember me',
            style: TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
          ),
        ),

        TextButton(
          onPressed: _forgotPassword,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Text(
            'Forgot Password?',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // Login Button
  // ============================================================

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: AppGradients.buttonGradient,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.25),
              blurRadius: 16,
              offset: const Offset(0, 7),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: _isLoading ? null : _login,

          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            disabledBackgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),

          child: _isLoading
              ? const SizedBox(
                  width: 23,
                  height: 23,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.white,
                    ),
                  ),
                )
              : const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(width: 10),

                    Icon(
                      Icons.arrow_forward_rounded,
                      size: 20,
                      color: Colors.white,
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  // ============================================================
  // Footer
  // ============================================================

  Widget _buildFooter() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 1,
                color: AppColors.cardBorder,
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'Student Portal',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textLight,
                ),
              ),
            ),

            Expanded(
              child: Container(
                height: 1,
                color: AppColors.cardBorder,
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),

        const Text(
          'Your school. Your progress. Your future.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: AppColors.textLight,
          ),
        ),
      ],
    );
  }
}