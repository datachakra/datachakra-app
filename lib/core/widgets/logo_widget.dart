import 'package:flutter/material.dart';
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
    return showText 
      ? Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildLogo(),
            const SizedBox(width: 8),
            Flexible(child: _buildText(context)),
          ],
        )
      : _buildLogo();
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'DataChakra',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: textColor ?? Theme.of(context).textTheme.headlineSmall?.color,
            fontSize: textSize,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        Text(
          'Ancient Wisdom Modern Technology',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: (textColor ?? Theme.of(context).textTheme.bodySmall?.color)?.withOpacity(0.7),
            fontSize: (textSize ?? 12) * 0.6,
            fontWeight: FontWeight.w500,
          ),
          overflow: TextOverflow.visible,
          softWrap: false,
        ),
      ],
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

}

// Specific logo variants for different use cases
class HeaderLogo extends StatelessWidget {
  const HeaderLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const LogoWidget(
      width: 50,
      height: 50,
      showText: true, // Show DataChakra text beside logo - v2.2
      textSize: 20,
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
      textSize: 16,
    );
  }
}

class LargeHeroLogo extends StatelessWidget {
  const LargeHeroLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 768;
    final isMobile = screenWidth < 480;
    
    // Make logo responsive to screen size
    final logoSize = isDesktop 
        ? (screenWidth * 0.4).clamp(300.0, 600.0)
        : isMobile 
            ? (screenWidth * 0.7).clamp(200.0, 350.0)
            : (screenWidth * 0.5).clamp(250.0, 450.0);
    
    return LogoWidget(
      width: logoSize,
      height: logoSize,
      showText: false,
    );
  }
}