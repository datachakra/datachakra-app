import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/utils/responsive_utils.dart';
class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  static const List<Map<String, dynamic>> features = [
    {
      'icon': Icons.devices,
      'title': 'Cross-Platform Learning',
      'description': 'Learn seamlessly across mobile, tablet, and desktop with real-time progress sync.',
      'color': AppColors.heartChakra,
      'details': [
        'Mobile app for learning on-the-go',
        'Web platform for intensive coding',
        'Real-time progress synchronization',
        'Offline content access',
      ],
    },
    {
      'icon': Icons.code,
      'title': 'Interactive Learning',
      'description': 'Hands-on coding with real-time execution, interactive assessments, and portfolio projects.',
      'color': AppColors.throatChakra,
      'details': [
        'Code playground with live execution',
        'Interactive quizzes and assessments',
        'Real-world project portfolios',
        'Instant feedback system',
      ],
    },
    {
      'icon': Icons.people,
      'title': 'Community & Support',
      'description': 'Join a thriving community with study groups, expert mentorship, and peer learning.',
      'color': AppColors.sacralChakra,
      'details': [
        'Study groups and peer learning',
        'Expert mentorship sessions',
        'Discussion forums',
        'Code review system',
      ],
    },
    {
      'icon': Icons.trending_up,
      'title': 'Personalized Journey',
      'description': 'AI-powered recommendations with adaptive learning paths and achievement tracking.',
      'color': AppColors.thirdEyeChakra,
      'details': [
        'Adaptive learning algorithms',
        'AI-powered recommendations',
        'Progress analytics dashboard',
        'Achievement and badge system',
      ],
    },
  ];

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
        color: AppColors.backgroundLight,
      ),
      child: Column(
        children: [
          _buildSectionHeader(context, isDesktop),
          SizedBox(height: isDesktop ? 80 : 60),
          _buildFeaturesGrid(context, isDesktop, isMobile),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, bool isDesktop) {
    return Column(
      children: [
        Text(
          'Why Choose DataChakra?',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontSize: isDesktop ? 48 : 32,
          ),
        )
            .animate()
            .fadeIn(duration: 800.ms)
            .slideY(begin: 0.3, end: 0, duration: 800.ms),
        const SizedBox(height: 16),
        Text(
          'Experience the most comprehensive and engaging AI/ML learning platform',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.textSecondary,
          ),
        )
            .animate()
            .fadeIn(duration: 800.ms, delay: 200.ms)
            .slideY(begin: 0.3, end: 0, duration: 800.ms),
      ],
    );
  }

  Widget _buildFeaturesGrid(BuildContext context, bool isDesktop, bool isMobile) {
    if (isDesktop) {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 40,
          mainAxisSpacing: 40,
          childAspectRatio: 1.2,
        ),
        itemCount: features.length,
        itemBuilder: (context, index) => _buildFeatureCard(context, index, isDesktop),
      );
    } else {
      return Column(
        children: List.generate(
          features.length,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: _buildFeatureCard(context, index, isDesktop),
          ),
        ),
      );
    }
  }

  Widget _buildFeatureCard(BuildContext context, int index, bool isDesktop) {
    final feature = features[index];
    final color = feature['color'] as Color;

    return Container(
      padding: EdgeInsets.all(isDesktop ? 32 : 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.radiusL),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            spreadRadius: 0,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon
          Container(
            width: isDesktop ? 64 : 56,
            height: isDesktop ? 64 : 56,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  color,
                  color.withOpacity(0.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(AppConstants.radiusM),
            ),
            child: Icon(
              feature['icon'],
              color: Colors.white,
              size: isDesktop ? 32 : 28,
            ),
          ),
          
          SizedBox(height: isDesktop ? 24 : 20),
          
          // Title
          Text(
            feature['title'],
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontSize: isDesktop ? 24 : 20,
            ),
          ),
          
          SizedBox(height: isDesktop ? 12 : 8),
          
          // Description
          Text(
            feature['description'],
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
          
          SizedBox(height: isDesktop ? 20 : 16),
          
          // Details
          ...List.generate(
            (feature['details'] as List<String>).length,
            (detailIndex) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      feature['details'][detailIndex],
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    )
        .animate(delay: Duration(milliseconds: 200 * index))
        .fadeIn(duration: 600.ms)
        .slideY(begin: 0.3, end: 0, duration: 600.ms)
        .then()
        .shimmer(duration: 1000.ms, color: color.withOpacity(0.1));
  }
}