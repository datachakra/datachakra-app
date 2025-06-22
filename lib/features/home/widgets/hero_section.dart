import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/utils/responsive_utils.dart';
import '../../../core/widgets/logo_widget.dart';
import '../../../shared/widgets/gradient_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveUtils.isDesktop(context);
    final isMobile = ResponsiveUtils.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isMobile ? 20 : 40),
        vertical: isDesktop ? 40 : (isMobile ? 20 : 30),
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: Theme.of(context).brightness == Brightness.dark
              ? [
                  const Color(0xFF1A1A1A),
                  const Color(0xFF2A2A2A),
                  const Color(0xFF1F1F1F),
                ]
              : [
                  const Color(0xFFF8FAFF),
                  const Color(0xFFF0F4FF),
                  const Color(0xFFE8F2FF),
                ],
        ),
      ),
      child: isDesktop
          ? _buildDesktopLayout(context)
          : _buildMobileLayout(context),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: _buildContent(context, isDesktop: true),
        ),
        const SizedBox(width: 80),
        Expanded(
          flex: 2,
          child: _buildChakraVisualization(context),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildContent(context, isDesktop: false),
        const SizedBox(height: 32),
        _buildChakraVisualization(context),
      ],
    );
  }

  Widget _buildContent(BuildContext context, {required bool isDesktop}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSocialProof(context).animate().fadeIn(duration: 600.ms).slideY(
              begin: 0.3,
              end: 0,
              duration: 600.ms,
              curve: Curves.easeOut,
            ),
        
        const SizedBox(height: 16),
        
        Text(
          AppConstants.heroTitle,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
            fontSize: isDesktop ? 56 : 40,
            height: 1.1,
          ),
        )
            .animate()
            .fadeIn(duration: 800.ms, delay: 200.ms)
            .slideY(
              begin: 0.3,
              end: 0,
              duration: 800.ms,
              curve: Curves.easeOut,
            ),
        
        const SizedBox(height: 16),
        
        Text(
          AppConstants.heroSubtitle,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: isDesktop ? 20 : 18,
            color: AppColors.textSecondary,
            height: 1.6,
          ),
        )
            .animate()
            .fadeIn(duration: 800.ms, delay: 400.ms)
            .slideY(
              begin: 0.3,
              end: 0,
              duration: 800.ms,
              curve: Curves.easeOut,
            ),
        
        const SizedBox(height: 24),
        
        _buildCTAButtons(context, isDesktop: isDesktop)
            .animate()
            .fadeIn(duration: 800.ms, delay: 600.ms)
            .slideY(
              begin: 0.3,
              end: 0,
              duration: 800.ms,
              curve: Curves.easeOut,
            ),
      ],
    );
  }

  Widget _buildSocialProof(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(AppConstants.radiusRound),
        border: Border.all(
          color: AppColors.primaryStart.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 80,
            height: 32,
            child: Stack(
              children: List.generate(4, (index) {
                return Positioned(
                  left: index * 16.0,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppConstants.chakrasData[index % 7]['color'] != null
                          ? Color(AppConstants.chakrasData[index % 7]['color'])
                          : AppColors.primaryStart,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Center(
                      child: Text(
                        String.fromCharCode(65 + index),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            AppConstants.heroSocialProof,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCTAButtons(BuildContext context, {required bool isDesktop}) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        GradientButton(
          text: 'Start Your Journey',
          onPressed: () => _launchURL(AppConstants.signupUrl),
          gradient: AppColors.primaryGradient,
        ),
        GradientButton(
          text: 'View Curriculum',
          onPressed: () {
            Scrollable.ensureVisible(
              context,
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOut,
            );
          },
          isOutlined: true,
        ),
      ],
    );
  }

  Widget _buildChakraVisualization(BuildContext context) {
    final isDesktop = ResponsiveUtils.isDesktop(context);
    final isMobile = ResponsiveUtils.isMobile(context);
    
    return SizedBox(
      height: isDesktop ? 600 : (isMobile ? 400 : 500),
      child: Padding(
        padding: EdgeInsets.only(left: isDesktop ? 10 : 0, right: isDesktop ? 140 : 0),
        child: Center(
          child: isDesktop 
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 400,
                  height: 400,
                  child: Center(
                    child: const LargeHeroLogo()
                        .animate()
                        .fadeIn(duration: 1200.ms, delay: 600.ms)
                        .scale(
                          begin: const Offset(0.5, 0.5),
                          end: const Offset(1.0, 1.0),
                          duration: 1200.ms,
                          curve: Curves.easeOutBack,
                        ),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'DataChakra',
                      style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 48,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).textTheme.displayMedium?.color,
                        height: 1.2,
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 800.ms, delay: 800.ms)
                        .slideX(begin: 0.3, end: 0),
                    const SizedBox(height: 8),
                    Text(
                      'Ancient Wisdom\nModern Technology',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.8),
                        height: 1.4,
                        letterSpacing: 0.5,
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 800.ms, delay: 1000.ms)
                        .slideX(begin: 0.3, end: 0),
                  ],
                ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: isMobile ? 250 : 300,
                  height: isMobile ? 250 : 300,
                  child: Center(
                    child: const LargeHeroLogo()
                        .animate()
                        .fadeIn(duration: 1200.ms, delay: 600.ms)
                        .scale(
                          begin: const Offset(0.5, 0.5),
                          end: const Offset(1.0, 1.0),
                          duration: 1200.ms,
                          curve: Curves.easeOutBack,
                        ),
                  ),
                ),
                const SizedBox(height: 24),
                Column(
                  children: [
                    Text(
                      'DataChakra',
                      style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: isMobile ? 32 : 40,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).textTheme.displayMedium?.color,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Ancient Wisdom Modern Technology',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: isMobile ? 14 : 16,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.8),
                        height: 1.4,
                        letterSpacing: 0.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
        ),
      ),
    );
  }


  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}