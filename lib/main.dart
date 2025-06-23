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
  
  // Initialize Firebase (commented out for now due to version compatibility)
  // try {
  //   await Firebase.initializeApp(
  //     options: FirebaseConfig.currentPlatform,
  //   );
  //   print('Firebase initialized successfully');
  // } catch (e) {
  //   print('Firebase initialization failed: $e');
  //   // Continue without Firebase for now - will show error in auth
  // }
  
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