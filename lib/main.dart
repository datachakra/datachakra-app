import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/theme/app_theme.dart';
import 'core/providers/theme_provider.dart';
import 'core/routing/app_router.dart';
import 'core/config/firebase_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase
  try {
    await Firebase.initializeApp(
      options: FirebaseConfig.currentPlatform,
    );
    debugPrint('✅ Firebase initialized successfully');
    debugPrint('🚀 DataChakra ready with real authentication');
  } catch (e) {
    debugPrint('❌ Firebase initialization failed: $e');
    debugPrint('⚠️  Please check Firebase config');
  }
  
  runApp(const ProviderScope(child: DataChakraApp()));
}

class DataChakraApp extends ConsumerWidget {
  const DataChakraApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider);
    
    return ScreenUtilInit(
      designSize: const Size(1440, 900),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'DataChakra - AI/ML Mastery Platform',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}