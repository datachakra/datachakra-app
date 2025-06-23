import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:email_validator/email_validator.dart';
import '../../../core/providers/auth_provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/widgets/logo_widget.dart';
import '../../../shared/widgets/gradient_button.dart';
import '../widgets/social_login_buttons.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authController = ref.watch(authControllerProvider);
    final isLoading = ref.watch(authLoadingProvider);
    final errorMessage = ref.watch(authErrorProvider);

    // Listen for auth state changes
    ref.listen(authStateProvider, (previous, next) {
      if (next.hasValue && next.value != null) {
        // User logged in successfully, navigate to dashboard
        context.go('/dashboard');
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo and Title
                  const HeaderLogo()
                      .animate()
                      .fadeIn(duration: 600.ms)
                      .scale(begin: const Offset(0.8, 0.8)),
                  
                  const SizedBox(height: 24),
                  
                  Text(
                    'Welcome Back',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  )
                      .animate()
                      .fadeIn(duration: 600.ms, delay: 200.ms)
                      .slideY(begin: 0.3, end: 0),
                  
                  const SizedBox(height: 8),
                  
                  Text(
                    'Continue your AI/ML mastery journey',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  )
                      .animate()
                      .fadeIn(duration: 600.ms, delay: 300.ms)
                      .slideY(begin: 0.3, end: 0),
                  
                  const SizedBox(height: 32),
                  
                  // Social Login Buttons
                  SocialLoginButtons(
                    onGooglePressed: () => _handleSocialLogin(() => authController.signInWithGoogle()),
                    onFacebookPressed: () => _handleSocialLogin(() => authController.signInWithFacebook()),
                    onApplePressed: () => _handleSocialLogin(() => authController.signInWithApple()),
                    isLoading: isLoading,
                  )
                      .animate()
                      .fadeIn(duration: 600.ms, delay: 400.ms)
                      .slideY(begin: 0.3, end: 0),
                  
                  const SizedBox(height: 24),
                  
                  // Divider
                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'or',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Email/Password Form
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Email Field
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!EmailValidator.validate(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: 'your@email.com',
                            prefixIcon: const Icon(Icons.email_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(AppConstants.radiusL),
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 16),
                        
                        // Password Field
                        TextFormField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            prefixIcon: const Icon(Icons.lock_outlined),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword ? Icons.visibility : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(AppConstants.radiusL),
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 16),
                        
                        // Remember Me & Forgot Password
                        Row(
                          children: [
                            Checkbox(
                              value: _rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value ?? false;
                                });
                              },
                            ),
                            const Text('Remember me'),
                            const Spacer(),
                            TextButton(
                              onPressed: () => context.push('/forgot-password'),
                              child: const Text('Forgot Password?'),
                            ),
                          ],
                        ),
                        
                        const SizedBox(height: 24),
                        
                        // Error Message
                        if (errorMessage != null) ...[
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(AppConstants.radiusL),
                              border: Border.all(color: Colors.red.withOpacity(0.3)),
                            ),
                            child: Text(
                              errorMessage,
                              style: TextStyle(color: Colors.red[700]),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                        
                        // Login Button
                        SizedBox(
                          width: double.infinity,
                          child: GradientButton(
                            text: 'Sign In',
                            onPressed: isLoading ? null : _handleEmailLogin,
                            gradient: AppColors.primaryGradient,
                            isLoading: isLoading,
                          ),
                        ),
                      ],
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 600.ms, delay: 500.ms)
                      .slideY(begin: 0.3, end: 0),
                  
                  const SizedBox(height: 24),
                  
                  // Sign Up Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextButton(
                        onPressed: () => context.push('/signup'),
                        child: const Text('Sign Up'),
                      ),
                    ],
                  )
                      .animate()
                      .fadeIn(duration: 600.ms, delay: 600.ms),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleEmailLogin() async {
    if (!_formKey.currentState!.validate()) return;
    
    ref.read(authErrorProvider.notifier).state = null;
    
    final success = await ref.read(authControllerProvider).signInWithEmailPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text,
    );
    
    if (success) {
      // Navigation handled by auth state listener
    }
  }

  Future<void> _handleSocialLogin(Future<bool> Function() loginMethod) async {
    ref.read(authErrorProvider.notifier).state = null;
    await loginMethod();
  }
}