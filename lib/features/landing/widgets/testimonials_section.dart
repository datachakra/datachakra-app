import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/utils/responsive_utils.dart';
class TestimonialsSection extends StatefulWidget {
  const TestimonialsSection({super.key});

  @override
  State<TestimonialsSection> createState() => _TestimonialsSectionState();
}

class _TestimonialsSectionState extends State<TestimonialsSection> {
  int currentIndex = 0;

  static const List<Map<String, dynamic>> testimonials = [
    {
      'name': 'Sarah Chen',
      'role': 'ML Engineer at Google',
      'avatar': 'S',
      'rating': 5,
      'testimonial': 'DataChakra transformed my career! The 7-chakra approach made complex AI concepts intuitive. Went from zero to ML Engineer in 8 months.',
      'transformation': 'Marketing Coordinator → ML Engineer',
      'salaryIncrease': '+150%',
      'color': AppColors.heartChakra,
    },
    {
      'name': 'Marcus Rodriguez',
      'role': 'Data Scientist at Microsoft',
      'avatar': 'M',
      'rating': 5,
      'testimonial': 'The structured curriculum and hands-on projects gave me confidence to tackle real-world problems. The community support was incredible.',
      'transformation': 'Junior Developer → Senior Data Scientist',
      'salaryIncrease': '+85%',
      'color': AppColors.throatChakra,
    },
    {
      'name': 'Priya Patel',
      'role': 'AI Research Scientist',
      'avatar': 'P',
      'rating': 5,
      'testimonial': 'Best investment I made for my career. The progressive learning path and mentorship program accelerated my growth exponentially.',
      'transformation': 'PhD Student → AI Research Scientist',
      'salaryIncrease': '+120%',
      'color': AppColors.thirdEyeChakra,
    },
    {
      'name': 'James Wilson',
      'role': 'Head of AI at Startup',
      'avatar': 'J',
      'rating': 5,
      'testimonial': 'DataChakra gave me the foundation to build and lead AI teams. The comprehensive curriculum covers everything from math to deployment.',
      'transformation': 'Software Engineer → Head of AI',
      'salaryIncrease': '+200%',
      'color': AppColors.sacralChakra,
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
      child: Column(
        children: [
          _buildSectionHeader(context, isDesktop),
          SizedBox(height: isDesktop ? 80 : 60),
          _buildTestimonialCarousel(context, isDesktop),
          const SizedBox(height: 40),
          _buildStats(context, isDesktop, isMobile),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, bool isDesktop) {
    return Column(
      children: [
        Text(
          'Success Stories',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontSize: isDesktop ? 48 : 32,
          ),
        )
            .animate()
            .fadeIn(duration: 800.ms)
            .slideY(begin: 0.3, end: 0, duration: 800.ms),
        const SizedBox(height: 16),
        Text(
          'Real transformations from our DataChakra community',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.7),
          ),
        )
            .animate()
            .fadeIn(duration: 800.ms, delay: 200.ms)
            .slideY(begin: 0.3, end: 0, duration: 800.ms),
      ],
    );
  }

  Widget _buildTestimonialCarousel(BuildContext context, bool isDesktop) {
    return SizedBox(
      height: isDesktop ? 400 : 350,
      child: PageView.builder(
        itemCount: testimonials.length,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: _buildTestimonialCard(context, index, isDesktop),
        ),
      ),
    );
  }

  Widget _buildTestimonialCard(BuildContext context, int index, bool isDesktop) {
    final testimonial = testimonials[index];
    final color = testimonial['color'] as Color;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.all(isDesktop ? 40 : 24),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(AppConstants.radiusL),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 30,
            spreadRadius: 0,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header with avatar and info
          Row(
            children: [
              Container(
                width: isDesktop ? 60 : 50,
                height: isDesktop ? 60 : 50,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    testimonial['avatar'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isDesktop ? 24 : 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12), // Reduced from 16 to 12
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      testimonial['name'],
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: isDesktop ? 18 : 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      testimonial['role'],
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              // Rating stars - make flexible
              if (isDesktop) 
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                  5,
                  (starIndex) => Icon(
                    Icons.star,
                    color: starIndex < testimonial['rating']
                        ? AppColors.solarPlexusChakra
                        : Colors.grey[300],
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
          
          SizedBox(height: isDesktop ? 20 : 16), // Reduced spacing
          
          // Testimonial text
          Flexible(
            child: Text(
              testimonial['testimonial'],
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: isDesktop ? 16 : 14, // Reduced font size
                height: 1.5, // Reduced line height
                fontStyle: FontStyle.italic,
              ),
              maxLines: isDesktop ? 4 : 3, // Limit lines
              overflow: TextOverflow.ellipsis,
            ),
          ),
          
          SizedBox(height: isDesktop ? 16 : 12), // Fixed spacing instead of Spacer
          
          // Transformation stats
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppConstants.radiusM),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Career Path:',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      Text(
                        testimonial['transformation'],
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: color,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 1,
                  height: 30,
                  color: color.withOpacity(0.3),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Salary Increase:',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    Text(
                      testimonial['salaryIncrease'],
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: AppColors.success,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 600.ms)
        .slideY(begin: 0.3, end: 0, duration: 600.ms);
  }

  Widget _buildStats(BuildContext context, bool isDesktop, bool isMobile) {
    final stats = [
      {'label': 'Success Rate', 'value': '94%', 'color': AppColors.success},
      {'label': 'Avg Salary Increase', 'value': '+120%', 'color': AppColors.sacralChakra},
      {'label': 'Career Transitions', 'value': '2,500+', 'color': AppColors.throatChakra},
      {'label': 'Industry Placements', 'value': '15+', 'color': AppColors.thirdEyeChakra},
    ];

    return Container(
      padding: EdgeInsets.all(isDesktop ? 40 : 24),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(AppConstants.radiusL),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isMobile ? 2 : 4,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: isMobile ? 1.2 : 1.5,
        ),
        itemCount: stats.length,
        itemBuilder: (context, index) {
          final stat = stats[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                stat['value'] as String,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: isDesktop ? 32 : 24,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                stat['label'] as String,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ],
          );
        },
      ),
    )
        .animate()
        .fadeIn(duration: 800.ms, delay: 400.ms)
        .slideY(begin: 0.3, end: 0, duration: 800.ms);
  }
}