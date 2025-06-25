import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    // Add web client ID for Google Sign-In
    clientId: kIsWeb ? '928028959885-a1b53f4c952ba6eb3d2ec4.apps.googleusercontent.com' : null,
  );
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Current user getter
  static User? get currentUser => _auth.currentUser;
  
  // Auth state stream
  static Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Email/Password Authentication
  static Future<UserCredential?> signUpWithEmailPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      // Update display name
      await credential.user?.updateDisplayName(name);
      
      // Create user document in Firestore
      await _createUserDocument(credential.user!, {
        'name': name,
        'email': email,
        'provider': 'email',
        'createdAt': FieldValue.serverTimestamp(),
      });
      
      return credential;
    } catch (e) {
      throw _handleAuthException(e);
    }
  }

  static Future<UserCredential?> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw _handleAuthException(e);
    }
  }

  // Google Sign-In
  static Future<UserCredential?> signInWithGoogle() async {
    try {
      // For web, we need to configure the proper Google Client ID
      // This is a temporary implementation
      if (kIsWeb) {
        throw Exception('Google Sign-In requires additional setup for web. Please use email/password authentication for now, or contact support for Google Sign-In setup.');
      }
      
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      
      // Create/update user document
      if (userCredential.user != null) {
        await _createUserDocument(userCredential.user!, {
          'name': userCredential.user!.displayName ?? 'Google User',
          'email': userCredential.user!.email ?? '',
          'provider': 'google',
          'photoUrl': userCredential.user!.photoURL,
          'createdAt': FieldValue.serverTimestamp(),
        });
      }
      
      return userCredential;
    } catch (e) {
      throw _handleAuthException(e);
    }
  }

  // Facebook Sign-In (Placeholder for future implementation)
  static Future<UserCredential?> signInWithFacebook() async {
    throw 'Facebook authentication not yet implemented. Use Google or email/password.';
  }

  // Apple Sign-In (Placeholder for future implementation)  
  static Future<UserCredential?> signInWithApple() async {
    throw 'Apple authentication not yet implemented. Use Google or email/password.';
  }

  // Password Reset
  static Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw _handleAuthException(e);
    }
  }

  // Sign Out
  static Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
    } catch (e) {
      throw _handleAuthException(e);
    }
  }

  // Create user document in Firestore
  static Future<void> _createUserDocument(User user, Map<String, dynamic> data) async {
    final userDoc = _firestore.collection('users').doc(user.uid);
    final docSnapshot = await userDoc.get();
    
    if (!docSnapshot.exists) {
      await userDoc.set(data);
    } else {
      // Update existing document with new login timestamp
      await userDoc.update({
        'lastLoginAt': FieldValue.serverTimestamp(),
      });
    }
  }

  // Get user data from Firestore
  static Future<Map<String, dynamic>?> getUserData(String uid) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      return doc.data();
    } catch (e) {
      return null;
    }
  }

  // Update user profile
  static Future<void> updateUserProfile({
    String? displayName,
    String? photoURL,
    Map<String, dynamic>? additionalData,
  }) async {
    try {
      final user = _auth.currentUser;
      if (user == null) throw Exception('No user logged in');

      // Update Firebase Auth profile
      if (displayName != null) {
        await user.updateDisplayName(displayName);
      }
      if (photoURL != null) {
        await user.updatePhotoURL(photoURL);
      }

      // Update Firestore document
      final updateData = <String, dynamic>{};
      if (displayName != null) updateData['name'] = displayName;
      if (photoURL != null) updateData['photoUrl'] = photoURL;
      if (additionalData != null) updateData.addAll(additionalData);
      
      if (updateData.isNotEmpty) {
        updateData['updatedAt'] = FieldValue.serverTimestamp();
        await _firestore.collection('users').doc(user.uid).update(updateData);
      }
    } catch (e) {
      throw _handleAuthException(e);
    }
  }

  // Handle authentication exceptions
  static String _handleAuthException(dynamic e) {
    // Log the full error for debugging
    print('🔍 Auth Error: $e');
    print('🔍 Error Type: ${e.runtimeType}');
    
    if (e is FirebaseAuthException) {
      print('🔍 Firebase Auth Error Code: ${e.code}');
      print('🔍 Firebase Auth Error Message: ${e.message}');
      
      switch (e.code) {
        case 'user-not-found':
          return 'No user found with this email address.';
        case 'wrong-password':
          return 'Incorrect password.';
        case 'email-already-in-use':
          return 'An account already exists with this email address.';
        case 'weak-password':
          return 'Password is too weak.';
        case 'invalid-email':
          return 'Please enter a valid email address.';
        case 'user-disabled':
          return 'This account has been disabled.';
        case 'too-many-requests':
          return 'Too many attempts. Please try again later.';
        case 'popup-blocked':
          return 'Google sign-in popup was blocked. Please allow popups and try again.';
        case 'popup-closed-by-user':
          return 'Google sign-in was cancelled. Please try again.';
        case 'network-request-failed':
          return 'Network error. Please check your connection and try again.';
        default:
          return e.message ?? 'An error occurred during authentication.';
      }
    }
    
    // For non-Firebase errors, provide more details
    return 'Error: ${e.toString()}';
  }
}