import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_colors.dart';
import '../constants/app_constants.dart';

class LogoWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final bool showText;
  final Color? textColor;
  final double? textSize;

  const LogoWidget({
    super.key,
    this.width,
    this.height,
    this.showText = true,
    this.textColor,
    this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildLogo(),
        if (showText) ...[
          const SizedBox(width: 12),
          _buildText(context),
        ],
      ],
    );
  }

  Widget _buildLogo() {
    return SizedBox(
      width: width ?? 40,
      height: height ?? 40,
      child: _LogoImage(
        width: width ?? 40,
        height: height ?? 40,
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    return Text(
      'DataChakra',
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
        fontWeight: FontWeight.bold,
        color: textColor ?? AppColors.textPrimary,
        fontSize: textSize,
      ),
    );
  }
}

class _LogoImage extends StatelessWidget {
  final double width;
  final double height;

  const _LogoImage({
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    // Updated to use correct asset path
    return Image.asset(
      'assets/images/logo.png',
      width: width,
      height: height,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        // If the image fails to load, show fallback
        return _buildFallbackLogo();
      },
    );
  }

  Widget _buildFallbackLogo() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(AppConstants.radiusM),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryStart.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const Icon(
        Icons.auto_awesome,
        color: Colors.white,
        size: 24,
      ),
    );
  }

  Future<bool> _checkAssetExists(String assetPath, BuildContext context) async {
    try {
      await DefaultAssetBundle.of(context).load(assetPath);
      return true;
    } catch (e) {
      return false;
    }
  }
}

// Specific logo variants for different use cases
class HeaderLogo extends StatelessWidget {
  const HeaderLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const LogoWidget(
      width: 40,
      height: 40,
      showText: true,
    );
  }
}

class HeroLogo extends StatelessWidget {
  const HeroLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 768;
    
    return LogoWidget(
      width: isLargeScreen ? 120 : 80,
      height: isLargeScreen ? 120 : 80,
      showText: false,
    );
  }
}

class FooterLogo extends StatelessWidget {
  const FooterLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const LogoWidget(
      width: 32,
      height: 32,
      showText: true,
      textColor: Colors.white,
      textSize: 18,
    );
  }
}

class LargeHeroLogo extends StatelessWidget {
  const LargeHeroLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 768;
    final isMobile = MediaQuery.of(context).size.width < 480;
    
    return LogoWidget(
      width: isDesktop ? 800 : (isMobile ? 400 : 600),
      height: isDesktop ? 800 : (isMobile ? 400 : 600),
      showText: false,
    );
  }
}