import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/utils/responsive_utils.dart';
class FAQSection extends StatefulWidget {
  const FAQSection({super.key});

  @override
  State<FAQSection> createState() => _FAQSectionState();
}

class _FAQSectionState extends State<FAQSection> {
  int? expandedIndex;

  static const List<Map<String, String>> faqs = [
    {
      'question': 'Do I need prior programming or math experience?',
      'answer': 'No! DataChakra starts from the very beginning with the Root Chakra (foundations). We cover mathematics, programming, and computer science from scratch. Our progressive approach ensures you build solid foundations before advancing.',
    },
    {
      'question': 'How much time do I need to commit each week?',
      'answer': 'We recommend 10-15 hours per week for optimal progress. However, our self-paced approach allows you to learn faster or slower based on your schedule. The mobile app makes it easy to learn during commutes or breaks.',
    },
    {
      'question': 'What makes DataChakra different from other AI/ML courses?',
      'answer': 'Our unique 7-chakra approach provides a structured, holistic journey from foundations to mastery. Unlike fragmented courses, we ensure proper prerequisites and provide hands-on projects, community support, and personalized mentorship.',
    },
    {
      'question': 'Will I receive certificates upon completion?',
      'answer': 'Yes! Pro and Team tier members receive certificates for each chakra completed, plus a master certificate upon completing all 7 chakras. These are recognized by our industry partners and showcase your comprehensive AI/ML expertise.',
    },
    {
      'question': 'Is there a mobile app for learning on the go?',
      'answer': 'Absolutely! Our mobile app syncs with the web platform, allowing you to watch videos, take quizzes, and track progress anywhere. The code playground is optimized for both mobile and desktop use.',
    },
    {
      'question': 'What support do I get if I\'m stuck?',
      'answer': 'Pro members get access to study groups, discussion forums, and monthly Q&A sessions. Team members receive additional 1-on-1 mentorship sessions with industry experts and priority support.',
    },
    {
      'question': 'Can I switch between pricing plans?',
      'answer': 'Yes! You can upgrade or downgrade your plan at any time. When upgrading, you get immediate access to new features. When downgrading, you retain access until your current billing period ends.',
    },
    {
      'question': 'What happens after I complete all 7 chakras?',
      'answer': 'Graduates join our exclusive Alumni Network with access to advanced masterclasses, industry connections, job placement assistance, and the opportunity to become mentors for new learners.',
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
          _buildFAQList(context, isDesktop),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, bool isDesktop) {
    return Column(
      children: [
        Text(
          'Frequently Asked Questions',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontSize: isDesktop ? 48 : 32,
          ),
        )
            .animate()
            .fadeIn(duration: 800.ms)
            .slideY(begin: 0.3, end: 0, duration: 800.ms),
        const SizedBox(height: 16),
        Text(
          'Everything you need to know about starting your AI/ML journey',
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

  Widget _buildFAQList(BuildContext context, bool isDesktop) {
    return Container(
      constraints: BoxConstraints(maxWidth: isDesktop ? 800 : double.infinity),
      child: Column(
        children: List.generate(
          faqs.length,
          (index) => _buildFAQItem(context, index, isDesktop),
        ),
      ),
    );
  }

  Widget _buildFAQItem(BuildContext context, int index, bool isDesktop) {
    final faq = faqs[index];
    final isExpanded = expandedIndex == index;
    final chakraColor = Color(AppConstants.chakrasData[index % 7]['color']);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.radiusL),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppConstants.radiusL),
        child: Column(
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  setState(() {
                    expandedIndex = isExpanded ? null : index;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(isDesktop ? 24 : 20),
                  child: Row(
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: chakraColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          faq['question']!,
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontSize: isDesktop ? 18 : 16,
                          ),
                        ),
                      ),
                      AnimatedRotation(
                        turns: isExpanded ? 0.5 : 0,
                        duration: AppConstants.animationMedium,
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: chakraColor,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AnimatedContainer(
              duration: AppConstants.animationMedium,
              height: isExpanded ? null : 0,
              child: AnimatedOpacity(
                opacity: isExpanded ? 1.0 : 0.0,
                duration: AppConstants.animationMedium,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(
                    isDesktop ? 46 : 36,
                    0,
                    isDesktop ? 24 : 20,
                    isDesktop ? 24 : 20,
                  ),
                  decoration: BoxDecoration(
                    color: chakraColor.withOpacity(0.02),
                    border: Border(
                      top: BorderSide(
                        color: chakraColor.withOpacity(0.1),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Text(
                    faq['answer']!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.6,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    )
        .animate(delay: Duration(milliseconds: 100 * index))
        .fadeIn(duration: 600.ms)
        .slideY(begin: 0.3, end: 0, duration: 600.ms);
  }
}