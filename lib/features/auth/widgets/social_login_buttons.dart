import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../../../core/constants/app_constants.dart';

class SocialLoginButtons extends StatelessWidget {
  final VoidCallback onGooglePressed;
  final VoidCallback onFacebookPressed;
  final VoidCallback onApplePressed;
  final bool isLoading;

  const SocialLoginButtons({
    super.key,
    required this.onGooglePressed,
    required this.onFacebookPressed,
    required this.onApplePressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Google Sign In
        SocialLoginButton(
          icon: Icons.g_mobiledata,
          label: 'Continue with Google',
          backgroundColor: Colors.white,
          textColor: Colors.black87,
          borderColor: Colors.grey.shade300,
          onPressed: isLoading ? null : onGooglePressed,
        ),
        
        const SizedBox(height: 12),
        
        // Facebook Sign In
        SocialLoginButton(
          icon: Icons.facebook,
          label: 'Continue with Facebook',
          backgroundColor: const Color(0xFF1877F2),
          textColor: Colors.white,
          onPressed: isLoading ? null : onFacebookPressed,
        ),
        
        const SizedBox(height: 12),
        
        // Apple Sign In (iOS/macOS only)
        if (defaultTargetPlatform == TargetPlatform.iOS || 
            defaultTargetPlatform == TargetPlatform.macOS)
          SocialLoginButton(
            icon: Icons.apple,
            label: 'Continue with Apple',
            backgroundColor: Colors.black,
            textColor: Colors.white,
            onPressed: isLoading ? null : onApplePressed,
          ),
      ],
    );
  }
}

class SocialLoginButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;
  final VoidCallback? onPressed;

  const SocialLoginButton({
    super.key,
    required this.icon,
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    this.borderColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: textColor,
          size: 20,
        ),
        label: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          elevation: 0,
          side: borderColor != null 
              ? BorderSide(color: borderColor!, width: 1)
              : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.radiusL),
          ),
        ),
      ),
    );
  }
}