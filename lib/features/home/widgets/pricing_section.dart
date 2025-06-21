import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:url_launcher/url_launcher.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/utils/responsive_utils.dart';import '../../../shared/widgets/gradient_button.dart';

class PricingSection extends StatefulWidget {
  const PricingSection({super.key});

  @override
  State<PricingSection> createState() => _PricingSectionState();
}

class _PricingSectionState extends State<PricingSection> {
  bool isYearly = false;

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
          const SizedBox(height: 40),
          _buildPricingToggle(context),
          SizedBox(height: isDesktop ? 80 : 60),
          _buildPricingCards(context, isDesktop, isMobile),
          const SizedBox(height: 60),
          _buildGuarantee(context, isDesktop),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, bool isDesktop) {
    return Column(
      children: [
        Text(
          'Choose Your Learning Path',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontSize: isDesktop ? 48 : 32,
          ),
        )
            .animate()
            .fadeIn(duration: 800.ms)
            .slideY(begin: 0.3, end: 0, duration: 800.ms),
        const SizedBox(height: 16),
        Text(
          'Start free, upgrade when you\'re ready to accelerate your AI/ML journey',
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

  Widget _buildPricingToggle(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.radiusRound),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildToggleButton('Monthly', !isYearly),
          _buildToggleButton('Yearly (Save 20%)', isYearly),
        ],
      ),
    );
  }

  Widget _buildToggleButton(String text, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isYearly = text.contains('Yearly');
        });
      },
      child: AnimatedContainer(
        duration: AppConstants.animationMedium,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryStart : Colors.transparent,
          borderRadius: BorderRadius.circular(AppConstants.radiusRound),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: isSelected ? Colors.white : AppColors.textSecondary,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildPricingCards(BuildContext context, bool isDesktop, bool isMobile) {
    final pricingTiers = [
      _buildPricingTier(
        'Free Tier',
        '\$0',
        'forever',
        AppConstants.pricingData['free']!['features'] as List<String>,
        false,
        AppColors.textSecondary,
      ),
      _buildPricingTier(
        'Pro Tier',
        isYearly ? '\$23' : '\$29',
        isYearly ? 'per month (billed yearly)' : 'per month',
        AppConstants.pricingData['pro']!['features'] as List<String>,
        true,
        AppColors.primaryStart,
      ),
      _buildPricingTier(
        'Team Tier',
        isYearly ? '\$79' : '\$99',
        isYearly ? 'per month (billed yearly)' : 'per month',
        AppConstants.pricingData['team']!['features'] as List<String>,
        false,
        AppColors.thirdEyeChakra,
      ),
    ];

    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: pricingTiers
            .map((tier) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: tier,
                  ),
                ))
            .toList(),
      );
    } else {
      return Column(
        children: pricingTiers
            .map((tier) => Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: tier,
                ))
            .toList(),
      );
    }
  }

  Widget _buildPricingTier(
    String name,
    String price,
    String duration,
    List<String> features,
    bool isPopular,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.radiusL),
        border: isPopular
            ? Border.all(color: color, width: 2)
            : Border.all(color: Colors.grey[200]!, width: 1),
        boxShadow: [
          BoxShadow(
            color: isPopular
                ? color.withOpacity(0.2)
                : Colors.black.withOpacity(0.05),
            blurRadius: isPopular ? 30 : 20,
            spreadRadius: isPopular ? 5 : 0,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Popular badge
          if (isPopular)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(AppConstants.radiusRound),
              ),
              child: Text(
                'MOST POPULAR',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          
          if (isPopular) const SizedBox(height: 16),
          
          // Plan name
          Text(
            name,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          const SizedBox(height: 8),
          
          // Price
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  duration,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // Features
          ...features.map((feature) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: AppColors.success,
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        feature,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              )),
          
          const SizedBox(height: 32),
          
          // CTA Button
          SizedBox(
            width: double.infinity,
            child: isPopular
                ? GradientButton(
                    text: name == 'Free Tier' ? 'Get Started Free' : 'Start Pro Trial',
                    onPressed: () => _launchURL(AppConstants.signupUrl),
                    gradient: AppColors.primaryGradient,
                  )
                : GradientButton(
                    text: name == 'Free Tier' ? 'Get Started Free' : 'Choose Plan',
                    onPressed: () => _launchURL(AppConstants.signupUrl),
                    isOutlined: true,
                    gradient: LinearGradient(colors: [color, color]),
                  ),
          ),
        ],
      ),
    )
        .animate(delay: Duration(milliseconds: 200 * (isPopular ? 1 : 0)))
        .fadeIn(duration: 600.ms)
        .slideY(begin: 0.3, end: 0, duration: 600.ms)
        .then()
        .shimmer(
          duration: 2000.ms,
          color: isPopular ? color.withOpacity(0.1) : Colors.transparent,
        );
  }

  Widget _buildGuarantee(BuildContext context, bool isDesktop) {
    return Container(
      padding: EdgeInsets.all(isDesktop ? 40 : 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.success.withOpacity(0.1),
            AppColors.success.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(AppConstants.radiusL),
      ),
      child: Row(
        children: [
          Container(
            width: isDesktop ? 80 : 60,
            height: isDesktop ? 80 : 60,
            decoration: BoxDecoration(
              color: AppColors.success,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.security,
              color: Colors.white,
              size: isDesktop ? 40 : 30,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '30-Day Money-Back Guarantee',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize: isDesktop ? 24 : 20,
                    color: AppColors.success,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Not satisfied? Get a full refund within 30 days, no questions asked. We\'re confident in the transformative power of DataChakra.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 800.ms, delay: 600.ms)
        .slideY(begin: 0.3, end: 0, duration: 800.ms);
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}