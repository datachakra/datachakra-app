import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/utils/responsive_utils.dart';
import '../../../shared/widgets/gradient_button.dart';
import '../../../shared/widgets/animated_chakra.dart';

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
        vertical: isDesktop ? 120 : (isMobile ? 60 : 80),
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFF8FAFF),
            Color(0xFFF0F4FF),
            Color(0xFFE8F2FF),
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
        const SizedBox(height: 60),
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
        
        const SizedBox(height: 24),
        
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
        
        const SizedBox(height: 24),
        
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
        
        const SizedBox(height: 40),
        
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
    return SizedBox(
      height: 400,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.primaryStart.withOpacity(0.1),
                  AppColors.primaryEnd.withOpacity(0.05),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          
          ...List.generate(AppConstants.chakrasData.length, (index) {
            final chakra = AppConstants.chakrasData[index];
            final angle = (index * 2 * math.pi) / AppConstants.chakrasData.length;
            final radius = 120.0;
            final x = radius * math.cos(angle);
            final y = radius * math.sin(angle);
            
            return Transform.translate(
              offset: Offset(x, y),
              child: AnimatedChakra(
                color: Color(chakra['color']),
                size: 60,
                onTap: () {
                  _showChakraDetails(context, chakra);
                },
              )
                  .animate(delay: Duration(milliseconds: 200 * index))
                  .fadeIn(duration: 800.ms)
                  .scale(
                    begin: const Offset(0.5, 0.5),
                    end: const Offset(1.0, 1.0),
                    duration: 800.ms,
                    curve: Curves.elasticOut,
                  ),
            );
          }),
          
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.primaryGradient,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryStart.withOpacity(0.3),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: const Icon(
              Icons.auto_awesome,
              color: Colors.white,
              size: 40,
            ),
          )
              .animate()
              .fadeIn(duration: 1000.ms, delay: 1000.ms)
              .scale(
                begin: const Offset(0.3, 0.3),
                end: const Offset(1.0, 1.0),
                duration: 1000.ms,
                curve: Curves.elasticOut,
              ),
        ],
      ),
    );
  }

  void _showChakraDetails(BuildContext context, Map<String, dynamic> chakra) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(chakra['name']),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              chakra['subtitle'],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(chakra['description']),
            const SizedBox(height: 16),
            Text('Duration: ${chakra['duration']}'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: (chakra['topics'] as List<String>)
                  .map((topic) => Chip(label: Text(topic)))
                  .toList(),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}