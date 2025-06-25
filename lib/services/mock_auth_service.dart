import 'dart:async';

// Mock User class to simulate Firebase User
class MockUser {
  final String uid;
  final String? email;
  final String? displayName;
  final String? photoURL;

  MockUser({
    required this.uid,
    this.email,
    this.displayName,
    this.photoURL,
  });
}

// Mock UserCredential class
class MockUserCredential {
  final MockUser? user;

  MockUserCredential({this.user});
}

class MockAuthService {
  static MockUser? _currentUser;
  static final StreamController<MockUser?> _authStateController = 
      StreamController<MockUser?>.broadcast();

  // Current user getter
  static MockUser? get currentUser => _currentUser;
  
  // Auth state stream
  static Stream<MockUser?> get authStateChanges => _authStateController.stream;

  // Email/Password Authentication
  static Future<MockUserCredential?> signUpWithEmailPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Mock user creation
    final user = MockUser(
      uid: 'mock_${DateTime.now().millisecondsSinceEpoch}',
      email: email,
      displayName: name,
    );
    
    _currentUser = user;
    _authStateController.add(user);
    
    return MockUserCredential(user: user);
  }

  static Future<MockUserCredential?> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Mock validation
    if (email == 'test@example.com' && password == 'password123') {
      final user = MockUser(
        uid: 'mock_test_user',
        email: email,
        displayName: 'Test User',
      );
      
      _currentUser = user;
      _authStateController.add(user);
      
      return MockUserCredential(user: user);
    } else {
      throw 'Invalid email or password';
    }
  }

  // Social Sign-In (Mock implementations)
  static Future<MockUserCredential?> signInWithGoogle() async {
    await Future.delayed(const Duration(seconds: 1));
    
    final user = MockUser(
      uid: 'google_mock_user',
      email: 'user@gmail.com',
      displayName: 'Google User',
      photoURL: 'https://via.placeholder.com/150',
    );
    
    _currentUser = user;
    _authStateController.add(user);
    
    return MockUserCredential(user: user);
  }

  static Future<MockUserCredential?> signInWithFacebook() async {
    await Future.delayed(const Duration(seconds: 1));
    
    final user = MockUser(
      uid: 'facebook_mock_user',
      email: 'user@facebook.com',
      displayName: 'Facebook User',
      photoURL: 'https://via.placeholder.com/150',
    );
    
    _currentUser = user;
    _authStateController.add(user);
    
    return MockUserCredential(user: user);
  }

  static Future<MockUserCredential?> signInWithApple() async {
    await Future.delayed(const Duration(seconds: 1));
    
    final user = MockUser(
      uid: 'apple_mock_user',
      email: 'user@privaterelay.appleid.com',
      displayName: 'Apple User',
    );
    
    _currentUser = user;
    _authStateController.add(user);
    
    return MockUserCredential(user: user);
  }

  // Password Reset
  static Future<void> sendPasswordResetEmail(String email) async {
    await Future.delayed(const Duration(seconds: 1));
    // Mock success - in real app would send email
  }

  // Sign Out
  static Future<void> signOut() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _currentUser = null;
    _authStateController.add(null);
  }

  // Mock user data
  static Future<Map<String, dynamic>?> getUserData(String uid) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return {
      'name': _currentUser?.displayName ?? 'Mock User',
      'email': _currentUser?.email ?? 'user@example.com',
      'provider': 'mock',
      'createdAt': DateTime.now().toIso8601String(),
    };
  }

  // Mock profile update
  static Future<void> updateUserProfile({
    String? displayName,
    String? photoURL,
    Map<String, dynamic>? additionalData,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));
    // Mock success
  }

  // Handle exceptions
  static String handleAuthException(dynamic e) {
    return e.toString();
  }
}