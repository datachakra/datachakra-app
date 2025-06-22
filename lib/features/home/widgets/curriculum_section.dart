import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/utils/responsive_utils.dart';
import '../../../shared/widgets/meditating_human.dart';

class CurriculumSection extends StatefulWidget {
  const CurriculumSection({super.key});

  @override
  State<CurriculumSection> createState() => _CurriculumSectionState();
}

class _CurriculumSectionState extends State<CurriculumSection> {
  int selectedChakraIndex = 0;

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
          if (isDesktop)
            _buildDesktopLayout(context)
          else
            _buildMobileLayout(context),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, bool isDesktop) {
    return Column(
      children: [
        Text(
          'The 7 Chakras Curriculum',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontSize: isDesktop ? 48 : 32,
          ),
        )
            .animate()
            .fadeIn(duration: 800.ms)
            .slideY(begin: 0.3, end: 0, duration: 800.ms),
        const SizedBox(height: 16),
        Text(
          'A structured journey from mathematical foundations to AI mastery',
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

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline/Path visualization
        Expanded(
          flex: 2,
          child: _buildChakraTimeline(context),
        ),
        const SizedBox(width: 60),
        // Selected chakra details
        Expanded(
          flex: 3,
          child: _buildChakraDetails(context),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildChakraDetails(context),
        const SizedBox(height: 40),
        _buildChakraTimeline(context),
      ],
    );
  }

  Widget _buildChakraTimeline(BuildContext context) {
    final isDesktop = ResponsiveUtils.isDesktop(context);
    final isMobile = ResponsiveUtils.isMobile(context);
    
    return SizedBox(
      height: isDesktop ? 600 : 400,
      child: Stack(
        children: [
          // Connecting line
          Positioned(
            left: isDesktop ? 30 : 20,
            top: 40,
            bottom: 40,
            child: Container(
              width: 2,
              decoration: const BoxDecoration(
                gradient: AppColors.chakraGradient,
              ),
            ),
          ),
          
          // Chakra items
          Column(
            children: List.generate(
              AppConstants.chakrasData.length,
              (index) => Expanded(
                child: _buildTimelineItem(context, index, isDesktop, isMobile),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(BuildContext context, int index, bool isDesktop, bool isMobile) {
    final chakra = AppConstants.chakrasData[index];
    final isSelected = selectedChakraIndex == index;
    final color = Color(chakra['color']);

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedChakraIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 80 : (isMobile ? 40 : 60),
          vertical: 8,
        ),
        child: Row(
          children: [
            // Meditating human with progressive chakras
            Container(
              width: isSelected ? 60 : 40,
              height: isSelected ? 60 : 40,
              decoration: isSelected
                  ? BoxDecoration(
                      shape: BoxShape.circle,
                      color: color.withOpacity(0.1),
                      boxShadow: [
                        BoxShadow(
                          color: color.withOpacity(0.3),
                          blurRadius: 15,
                          spreadRadius: 3,
                        ),
                      ],
                    )
                  : null,
              child: MeditatingHuman(
                activeChakraCount: index + 1,
                isSelected: isSelected,
                size: isSelected ? 45 : 30,
              ),
            ),
            
            const SizedBox(width: 16),
            
            // Chakra info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    chakra['name'],
                    style: GoogleFonts.cinzel(
                      textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: isSelected ? color : AppColors.textPrimary,
                        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                        fontSize: isMobile ? (isSelected ? 14 : 12) : (isSelected ? 16 : 14),
                      ),
                    ),
                  ),
                  Text(
                    chakra['subtitle'],
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: isSelected 
                          ? AppColors.textPrimary 
                          : AppColors.textSecondary,
                      fontSize: isMobile ? 11 : 12,
                    ),
                  ),
                  // Duration removed to prevent mobile overlap
                ],
              ),
            ),
          ],
        ),
      ),
    )
        .animate(delay: Duration(milliseconds: 100 * index))
        .fadeIn(duration: 600.ms)
        .slideX(begin: -0.3, end: 0, duration: 600.ms);
  }

  Widget _buildChakraDetails(BuildContext context) {
    final chakra = AppConstants.chakrasData[selectedChakraIndex];
    final color = Color(chakra['color']);
    final isDesktop = ResponsiveUtils.isDesktop(context);

    return Container(
      padding: EdgeInsets.all(isDesktop ? 40 : 24),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(AppConstants.radiusL),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: 5,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                width: isDesktop ? 80 : 60,
                height: isDesktop ? 80 : 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.withOpacity(0.1),
                  boxShadow: [
                    BoxShadow(
                      color: color.withOpacity(0.3),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: MeditatingHuman(
                  activeChakraCount: selectedChakraIndex + 1,
                  isSelected: true,
                  size: isDesktop ? 60 : 45,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chakra['name'],
                      style: GoogleFonts.cinzel(
                        textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: color,
                          fontSize: isDesktop ? 24 : 20,
                        ),
                      ),
                    ),
                    Text(
                      chakra['subtitle'],
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    // Duration badge removed for cleaner design
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // Description
          Text(
            chakra['description'],
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          
          const SizedBox(height: 24),
          
          // Topics
          Text(
            'Key Topics:',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: (chakra['topics'] as List<String>)
                .map((topic) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            color.withOpacity(0.1),
                            color.withOpacity(0.05),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(AppConstants.radiusRound),
                        border: Border.all(
                          color: color.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        topic,
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: color,
                        ),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 400.ms)
        .slideY(begin: 0.2, end: 0, duration: 400.ms);
  }
}