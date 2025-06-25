# 🔥 Firebase Setup Guide for DataChakra Authentication

## Step 1: Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Create a project"
3. Project name: `datachakra-app`
4. Enable Google Analytics (recommended)
5. Click "Create project"

## Step 2: Add Web App

1. In Firebase Console, click "Web" icon (</>) 
2. App nickname: `DataChakra Web`
3. **✅ Check "Also set up Firebase Hosting"**
4. Click "Register app"
5. **Copy the Firebase config object** - you'll need this!

## Step 3: Enable Authentication

1. In Firebase Console → Authentication → Sign-in method
2. Enable the following providers:

### Email/Password
- Click "Email/Password" → Enable → Save

### Google
- Click "Google" → Enable 
- Project support email: `your-email@gmail.com`
- Click "Save"

### Facebook (Optional)
- Click "Facebook" → Enable
- App ID: `your-facebook-app-id`
- App Secret: `your-facebook-app-secret`

### Apple (iOS only)
- Click "Apple" → Enable
- Configure when ready for iOS

## Step 4: Configure Firestore

1. Firebase Console → Firestore Database
2. Click "Create database"
3. **Production mode** (recommended)
4. Choose location closest to your users
5. Click "Done"

## Step 5: Update Firebase Configuration

Replace the values in `lib/core/config/firebase_config.dart`:

```dart
class FirebaseConfig {
  // 🔥 Replace these with your actual Firebase config values
  static const String projectId = 'your-project-id';
  static const String appId = 'your-web-app-id';
  static const String messagingSenderId = 'your-sender-id';
  static const String apiKey = 'your-api-key';
  
  // Web configuration
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'your-web-api-key',
    appId: 'your-web-app-id', 
    messagingSenderId: 'your-sender-id',
    projectId: 'your-project-id',
    authDomain: 'your-project-id.firebaseapp.com',
    storageBucket: 'your-project-id.appspot.com',
    measurementId: 'G-your-measurement-id',
  );
}
```

## Step 6: Test Authentication

1. Run the web app: `flutter run -d chrome`
2. Navigate to `/login`
3. Try the following test accounts:

### Email/Password Test
- Any valid email + password (will create new account)

### Google Test  
- Click "Continue with Google"
- Use any Google account

## Step 7: Verify Setup

Check these work:
- ✅ Login page loads without errors
- ✅ Email signup creates new user in Firebase Console → Authentication → Users
- ✅ Google login redirects and authenticates
- ✅ Dashboard shows user name and avatar
- ✅ Logout redirects to home page

## 🔒 Security Rules

Update Firestore security rules for production:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Users can read/write their own data
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
  }
}
```

## 🌐 Web Deployment  

Your app will automatically deploy to:
- **GitHub Pages:** https://datachakra.com
- **Firebase Hosting:** https://your-project-id.web.app

## 🐛 Troubleshooting

**Firebase not initialized:**
- Check API keys in `firebase_config.dart`
- Verify project ID matches Firebase Console

**Google login fails:**
- Check OAuth is enabled in Firebase Console
- Verify domain is authorized in Firebase

**Build errors:**
- Run `flutter clean && flutter pub get`
- Check Firebase dependencies are compatible

## 🎯 Production Checklist

- [ ] Firebase project created and configured
- [ ] Authentication providers enabled  
- [ ] Firebase config updated with real values
- [ ] Google OAuth tested and working
- [ ] Email/password auth tested
- [ ] Firestore rules configured
- [ ] Web deployment working
- [ ] All platforms tested (web, iOS, Android)

---

**Need help?** Check the [Firebase Documentation](https://firebase.google.com/docs/web/setup) or create an issue.