import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../services/auth_service.dart';

// Auth state provider
final authStateProvider = StreamProvider<User?>((ref) {
  return AuthService.authStateChanges;
});

// Current user provider
final currentUserProvider = Provider<User?>((ref) {
  return ref.watch(authStateProvider).valueOrNull;
});

// User data provider
final userDataProvider = FutureProvider.family<Map<String, dynamic>?, String>((ref, uid) async {
  return await AuthService.getUserData(uid);
});

// Authentication loading state
final authLoadingProvider = StateProvider<bool>((ref) => false);

// Authentication error state
final authErrorProvider = StateProvider<String?>((ref) => null);

// Authentication controller
final authControllerProvider = Provider((ref) => AuthController(ref));

class AuthController {
  final Ref _ref;
  
  AuthController(this._ref);

  // Email/Password Sign Up
  Future<bool> signUpWithEmailPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      _ref.read(authLoadingProvider.notifier).state = true;
      _ref.read(authErrorProvider.notifier).state = null;
      
      final result = await AuthService.signUpWithEmailPassword(
        email: email,
        password: password,
        name: name,
      );
      
      return result != null;
    } catch (e) {
      _ref.read(authErrorProvider.notifier).state = e.toString();
      return false;
    } finally {
      _ref.read(authLoadingProvider.notifier).state = false;
    }
  }

  // Email/Password Sign In
  Future<bool> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      _ref.read(authLoadingProvider.notifier).state = true;
      _ref.read(authErrorProvider.notifier).state = null;
      
      final result = await AuthService.signInWithEmailPassword(
        email: email,
        password: password,
      );
      
      return result != null;
    } catch (e) {
      _ref.read(authErrorProvider.notifier).state = e.toString();
      return false;
    } finally {
      _ref.read(authLoadingProvider.notifier).state = false;
    }
  }

  // Google Sign In
  Future<bool> signInWithGoogle() async {
    try {
      _ref.read(authLoadingProvider.notifier).state = true;
      _ref.read(authErrorProvider.notifier).state = null;
      
      final result = await AuthService.signInWithGoogle();
      return result != null;
    } catch (e) {
      _ref.read(authErrorProvider.notifier).state = e.toString();
      return false;
    } finally {
      _ref.read(authLoadingProvider.notifier).state = false;
    }
  }

  // Facebook Sign In
  Future<bool> signInWithFacebook() async {
    try {
      _ref.read(authLoadingProvider.notifier).state = true;
      _ref.read(authErrorProvider.notifier).state = null;
      
      final result = await AuthService.signInWithFacebook();
      return result != null;
    } catch (e) {
      _ref.read(authErrorProvider.notifier).state = e.toString();
      return false;
    } finally {
      _ref.read(authLoadingProvider.notifier).state = false;
    }
  }

  // Apple Sign In
  Future<bool> signInWithApple() async {
    try {
      _ref.read(authLoadingProvider.notifier).state = true;
      _ref.read(authErrorProvider.notifier).state = null;
      
      final result = await AuthService.signInWithApple();
      return result != null;
    } catch (e) {
      _ref.read(authErrorProvider.notifier).state = e.toString();
      return false;
    } finally {
      _ref.read(authLoadingProvider.notifier).state = false;
    }
  }

  // Password Reset
  Future<bool> sendPasswordResetEmail(String email) async {
    try {
      _ref.read(authLoadingProvider.notifier).state = true;
      _ref.read(authErrorProvider.notifier).state = null;
      
      await AuthService.sendPasswordResetEmail(email);
      return true;
    } catch (e) {
      _ref.read(authErrorProvider.notifier).state = e.toString();
      return false;
    } finally {
      _ref.read(authLoadingProvider.notifier).state = false;
    }
  }

  // Sign Out
  Future<void> signOut() async {
    try {
      _ref.read(authLoadingProvider.notifier).state = true;
      _ref.read(authErrorProvider.notifier).state = null;
      
      await AuthService.signOut();
    } catch (e) {
      _ref.read(authErrorProvider.notifier).state = e.toString();
    } finally {
      _ref.read(authLoadingProvider.notifier).state = false;
    }
  }

  // Update Profile
  Future<bool> updateProfile({
    String? displayName,
    String? photoURL,
    Map<String, dynamic>? additionalData,
  }) async {
    try {
      _ref.read(authLoadingProvider.notifier).state = true;
      _ref.read(authErrorProvider.notifier).state = null;
      
      await AuthService.updateUserProfile(
        displayName: displayName,
        photoURL: photoURL,
        additionalData: additionalData,
      );
      
      return true;
    } catch (e) {
      _ref.read(authErrorProvider.notifier).state = e.toString();
      return false;
    } finally {
      _ref.read(authLoadingProvider.notifier).state = false;
    }
  }

  // Clear error
  void clearError() {
    _ref.read(authErrorProvider.notifier).state = null;
  }
}