import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/utils/responsive_utils.dart';
import '../../../core/widgets/logo_widget.dart';
import '../../../shared/widgets/gradient_button.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveUtils.isDesktop(context);
    final isMobile = ResponsiveUtils.isMobile(context);

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1A1A2E),
            Color(0xFF16213E),
          ],
        ),
      ),
      child: Column(
        children: [
          _buildMainFooter(context, isDesktop, isMobile),
          _buildBottomBar(context, isDesktop),
        ],
      ),
    );
  }

  Widget _buildMainFooter(BuildContext context, bool isDesktop, bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isMobile ? 20 : 40),
        vertical: isDesktop ? 80 : (isMobile ? 40 : 60),
      ),
      child: Column(
        children: [
          _buildNewsletterSection(context, isDesktop),
          SizedBox(height: isDesktop ? 80 : 60),
          if (isDesktop)
            _buildDesktopLinks(context)
          else
            _buildMobileLinks(context),
        ],
      ),
    );
  }

  Widget _buildNewsletterSection(BuildContext context, bool isDesktop) {
    return Container(
      padding: EdgeInsets.all(isDesktop ? 40 : 24),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(AppConstants.radiusL),
      ),
      child: Column(
        children: [
          Text(
            'Ready to Start Your AI/ML Journey?',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: Colors.white,
              fontSize: isDesktop ? 32 : 24,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Join thousands of learners transforming their careers with DataChakra',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white.withOpacity(0.9),
            ),
          ),
          const SizedBox(height: 32),
          if (isDesktop)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppConstants.radiusRound),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                GradientButton(
                  text: 'Get Started Free',
                  onPressed: () => _launchURL(AppConstants.signupUrl),
                  gradient: AppColors.secondaryGradient,
                ),
              ],
            )
          else
            Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppConstants.radiusRound),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: GradientButton(
                    text: 'Get Started Free',
                    onPressed: () => _launchURL(AppConstants.signupUrl),
                    gradient: AppColors.secondaryGradient,
                  ),
                ),
              ],
            ),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 800.ms)
        .slideY(begin: 0.3, end: 0, duration: 800.ms);
  }

  Widget _buildDesktopLinks(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: _buildBrandSection(context)),
        const SizedBox(width: 60),
        Expanded(child: _buildLinkColumn(context, 'Product', [
          {'title': 'Features', 'url': '#features'},
          {'title': 'Curriculum', 'url': '#curriculum'},
          {'title': 'Pricing', 'url': '#pricing'},
          {'title': 'Mobile App', 'url': AppConstants.appUrl},
        ])),
        Expanded(child: _buildLinkColumn(context, 'Company', [
          {'title': 'About Us', 'url': '#about'},
          {'title': 'Careers', 'url': '#careers'},
          {'title': 'Blog', 'url': '#blog'},
          {'title': 'Press', 'url': '#press'},
        ])),
        Expanded(child: _buildLinkColumn(context, 'Support', [
          {'title': 'Help Center', 'url': '#help'},
          {'title': 'Community', 'url': '#community'},
          {'title': 'Contact Us', 'url': '#contact'},
          {'title': 'Status', 'url': '#status'},
        ])),
        Expanded(child: _buildLinkColumn(context, 'Legal', [
          {'title': 'Privacy Policy', 'url': '#privacy'},
          {'title': 'Terms of Service', 'url': '#terms'},
          {'title': 'Cookie Policy', 'url': '#cookies'},
          {'title': 'GDPR', 'url': '#gdpr'},
        ])),
      ],
    );
  }

  Widget _buildMobileLinks(BuildContext context) {
    return Column(
      children: [
        _buildBrandSection(context),
        const SizedBox(height: 40),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildLinkColumn(context, 'Product', [
              {'title': 'Features', 'url': '#features'},
              {'title': 'Curriculum', 'url': '#curriculum'},
              {'title': 'Pricing', 'url': '#pricing'},
              {'title': 'Mobile App', 'url': AppConstants.appUrl},
            ])),
            Expanded(child: _buildLinkColumn(context, 'Support', [
              {'title': 'Help Center', 'url': '#help'},
              {'title': 'Community', 'url': '#community'},
              {'title': 'Contact Us', 'url': '#contact'},
              {'title': 'Privacy Policy', 'url': '#privacy'},
            ])),
          ],
        ),
      ],
    );
  }

  Widget _buildBrandSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Logo/Brand
        const FooterLogo(),
        const SizedBox(height: 16),
        Text(
          'Transform your career with the most comprehensive AI/ML learning platform. Master the journey from foundations to enlightenment.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.white.withOpacity(0.7),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 24),
        // Social Media Links
        Row(
          children: [
            _buildSocialIcon(Icons.facebook, '#facebook'),
            _buildSocialIcon(Icons.ac_unit, '#twitter'), // Using placeholder for Twitter
            _buildSocialIcon(Icons.work, '#linkedin'), // Using placeholder for LinkedIn
            _buildSocialIcon(Icons.video_library, '#youtube'), // Using placeholder for YouTube
            _buildSocialIcon(Icons.chat, '#discord'), // Using placeholder for Discord
          ],
        ),
      ],
    );
  }

  Widget _buildLinkColumn(BuildContext context, String title, List<Map<String, String>> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        ...links.map((link) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: InkWell(
                onTap: () => _launchURL(link['url']!),
                child: Text(
                  link['title']!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ),
            )),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: InkWell(
        onTap: () => _launchURL(url),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppConstants.radiusM),
          ),
          child: Icon(
            icon,
            color: Colors.white.withOpacity(0.7),
            size: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context, bool isDesktop) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 20,
        vertical: 24,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.white.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '© 2024 DataChakra. All rights reserved.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white.withOpacity(0.7),
            ),
          ),
          if (isDesktop)
            Row(
              children: [
                Text(
                  'Made with ',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
                const Icon(
                  Icons.favorite,
                  color: AppColors.rootChakra,
                  size: 16,
                ),
                Text(
                  ' for AI/ML learners',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (url.startsWith('#')) {
      // Handle internal navigation
      return;
    }
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}