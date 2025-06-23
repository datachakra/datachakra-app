import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../widgets/hero_section.dart';
import '../widgets/curriculum_section.dart';
import '../widgets/features_section.dart';
import '../widgets/testimonials_section.dart';
import '../widgets/pricing_section.dart';
import '../widgets/faq_section.dart';
import '../widgets/footer_section.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/providers/theme_provider.dart';
import '../../../core/widgets/logo_widget.dart';
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _showBackToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset > 1000 && !_showBackToTop) {
      setState(() {
        _showBackToTop = true;
      });
    } else if (_scrollController.offset <= 1000 && _showBackToTop) {
      setState(() {
        _showBackToTop = false;
      });
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Navigation Bar
                _buildNavigationBar(context),
                
                // Hero Section
                const HeroSection(),
                
                // Curriculum Section
                const CurriculumSection(),
                
                // Features Section
                const FeaturesSection(),
                
                // Testimonials Section
                const TestimonialsSection(),
                
                // Pricing Section
                const PricingSection(),
                
                // FAQ Section
                const FAQSection(),
                
                // Footer Section
                const FooterSection(),
              ],
            ),
          ),
          
          // Back to top button
          if (_showBackToTop)
            Positioned(
              right: 20,
              bottom: 20,
              child: FloatingActionButton(
                onPressed: _scrollToTop,
                backgroundColor: AppColors.primaryStart,
                child: const Icon(
                  Icons.keyboard_arrow_up,
                  color: Colors.white,
                ),
              )
                  .animate()
                  .fadeIn(duration: 300.ms)
                  .scale(begin: const Offset(0.8, 0.8), end: const Offset(1.0, 1.0)),
            ),
        ],
      ),
    );
  }

  Widget _buildNavigationBar(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Logo
          GestureDetector(
            onTap: _scrollToTop,
            child: const HeaderLogo(),
          ),
          
          const Spacer(),
          
          // Navigation links (desktop only)
          if (MediaQuery.of(context).size.width > 768) ...[
            _buildNavLink(context, 'Features', () => _scrollToSection(2)),
            const SizedBox(width: 32),
            _buildNavLink(context, 'Curriculum', () => _scrollToSection(1)),
            const SizedBox(width: 32),
            _buildNavLink(context, 'Pricing', () => _scrollToSection(4)),
            const SizedBox(width: 32),
            _buildNavLink(context, 'FAQ', () => _scrollToSection(5)),
            const SizedBox(width: 32),
          ],
          
          // Dark Mode Toggle
          _buildDarkModeToggle(context),
          const SizedBox(width: 16),
          
          // CTA Buttons
          Row(
            children: [
              if (MediaQuery.of(context).size.width > 480) ...[
                TextButton(
                  onPressed: () => _launchURL(AppConstants.loginUrl),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      color: AppColors.primaryStart,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
              ],
              ElevatedButton(
                onPressed: () => _launchURL(AppConstants.signupUrl),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryStart,
                  foregroundColor: Colors.white,
                  padding: MediaQuery.of(context).size.width > 480
                      ? const EdgeInsets.symmetric(horizontal: 24, vertical: 12)
                      : const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppConstants.radiusRound),
                  ),
                ),
                child: Text(
                  MediaQuery.of(context).size.width > 480 ? 'Get Started' : 'Start',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 800.ms)
        .slideY(begin: -1, end: 0, duration: 800.ms);
  }

  Widget _buildNavLink(BuildContext context, String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: AppColors.textSecondary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildDarkModeToggle(BuildContext context) {
    final isDarkMode = ref.watch(themeProvider);
    
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: IconButton(
        onPressed: () {
          ref.read(themeProvider.notifier).toggleTheme();
        },
        icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Icon(
            isDarkMode ? Icons.light_mode : Icons.dark_mode,
            key: ValueKey(isDarkMode),
            color: isDarkMode ? Colors.amber : AppColors.textSecondary,
            size: 20,
          ),
        ),
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        tooltip: isDarkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode',
      ),
    );
  }

  void _scrollToSection(int sectionIndex) {
    // Approximate scroll positions for each section
    final positions = [
      0.0, // Hero
      800.0, // Curriculum
      1600.0, // Features
      2400.0, // Testimonials
      3200.0, // Pricing
      4000.0, // FAQ
    ];

    if (sectionIndex < positions.length) {
      _scrollController.animateTo(
        positions[sectionIndex],
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  void _launchURL(String url) async {
    // For now, navigate to app routes
    if (url.contains('login')) {
      context.go('/login');
    } else if (url.contains('signup')) {
      context.go('/signup');
    } else {
      // In a real app, you'd use url_launcher for external URLs
      debugPrint('Navigate to: $url');
    }
  }
}