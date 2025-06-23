import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../../../core/providers/auth_provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/widgets/logo_widget.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final authController = ref.watch(authControllerProvider);

    // Redirect if not authenticated
    if (user == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go('/login');
      });
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top Navigation Bar
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
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
                    const HeaderLogo(),
                    const Spacer(),
                    PopupMenuButton<String>(
                      child: CircleAvatar(
                        backgroundImage: user.photoURL != null
                            ? NetworkImage(user.photoURL!)
                            : null,
                        child: user.photoURL == null
                            ? Text(
                                user.displayName?.substring(0, 1).toUpperCase() ?? 'U',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              )
                            : null,
                      ),
                      onSelected: (value) async {
                        if (value == 'logout') {
                          await authController.signOut();
                          if (context.mounted) {
                            context.go('/');
                          }
                        }
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'profile',
                          child: Row(
                            children: [
                              const Icon(Icons.person),
                              const SizedBox(width: 8),
                              Text('Profile'),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 'settings',
                          child: Row(
                            children: [
                              const Icon(Icons.settings),
                              const SizedBox(width: 8),
                              Text('Settings'),
                            ],
                          ),
                        ),
                        const PopupMenuDivider(),
                        PopupMenuItem(
                          value: 'logout',
                          child: Row(
                            children: [
                              const Icon(Icons.logout, color: Colors.red),
                              const SizedBox(width: 8),
                              Text('Sign Out', style: TextStyle(color: Colors.red)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Welcome Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: AppColors.primaryGradient,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back, ${user.displayName ?? 'Learner'}!',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 600.ms)
                        .slideX(begin: -0.3, end: 0),
                    
                    const SizedBox(height: 8),
                    
                    Text(
                      'Continue your AI/ML mastery journey',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white.withOpacity(0.9),
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 600.ms, delay: 200.ms)
                        .slideX(begin: -0.3, end: 0),
                  ],
                ),
              ),

              // 7 Chakras Learning Path
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Learning Path',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 600.ms, delay: 300.ms),
                    
                    const SizedBox(height: 16),
                    
                    Text(
                      'Master AI/ML through the 7-chakra learning system',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 600.ms, delay: 400.ms),
                    
                    const SizedBox(height: 24),
                    
                    // Chakras Grid
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MediaQuery.of(context).size.width > 768 ? 3 : 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1.1,
                      ),
                      itemCount: AppConstants.chakrasData.length,
                      itemBuilder: (context, index) {
                        final chakra = AppConstants.chakrasData[index];
                        final isUnlocked = index == 0; // For now, only first chakra is unlocked
                        
                        return ChakraCard(
                          chakra: chakra,
                          isUnlocked: isUnlocked,
                          index: index,
                        )
                            .animate()
                            .fadeIn(duration: 600.ms, delay: (500 + index * 100).ms)
                            .slideY(begin: 0.3, end: 0);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChakraCard extends StatelessWidget {
  final Map<String, dynamic> chakra;
  final bool isUnlocked;
  final int index;

  const ChakraCard({
    super.key,
    required this.chakra,
    required this.isUnlocked,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isUnlocked ? 4 : 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusL),
      ),
      child: InkWell(
        onTap: isUnlocked ? () {
          // Navigate to chakra details
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Opening ${chakra['name']}...'),
              duration: const Duration(seconds: 2),
            ),
          );
        } : null,
        borderRadius: BorderRadius.circular(AppConstants.radiusL),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConstants.radiusL),
            gradient: isUnlocked 
                ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(chakra['color']).withOpacity(0.1),
                      Color(chakra['color']).withOpacity(0.05),
                    ],
                  )
                : null,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: isUnlocked 
                          ? Color(chakra['color'])
                          : Colors.grey.shade400,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  if (!isUnlocked)
                    Icon(
                      Icons.lock,
                      size: 16,
                      color: Colors.grey.shade400,
                    ),
                ],
              ),
              
              const SizedBox(height: 12),
              
              Text(
                chakra['name'],
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isUnlocked ? null : Colors.grey.shade600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              
              const SizedBox(height: 4),
              
              Text(
                chakra['subtitle'],
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: isUnlocked 
                      ? AppColors.textSecondary
                      : Colors.grey.shade500,
                ),
              ),
              
              const Spacer(),
              
              if (isUnlocked)
                LinearProgressIndicator(
                  value: index == 0 ? 0.0 : 0.0, // No progress yet
                  backgroundColor: Colors.grey.shade200,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(chakra['color']),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}