enum Environment {
  development,
  staging,
  production,
}

class AppConfig {
  static Environment _environment = Environment.development;
  
  static Environment get environment => _environment;
  
  static void setEnvironment(Environment env) {
    _environment = env;
  }
  
  // API Configuration
  static String get apiBaseUrl {
    switch (_environment) {
      case Environment.development:
        return 'http://localhost:8080/api';
      case Environment.staging:
        return 'https://staging-api.datachakra.com/api';
      case Environment.production:
        return 'https://api.datachakra.com/api';
    }
  }
  
  // Web URLs
  static String get webBaseUrl {
    switch (_environment) {
      case Environment.development:
        return 'http://localhost:3000';
      case Environment.staging:
        return 'https://staging.datachakra.com';
      case Environment.production:
        return 'https://datachakra.com';
    }
  }
  
  // App URLs
  static String get appUrl => '$webBaseUrl/app';
  static String get signupUrl => '$webBaseUrl/signup';
  static String get loginUrl => '$webBaseUrl/login';
  
  // Feature Flags
  static bool get enableAnalytics {
    switch (_environment) {
      case Environment.development:
        return false;
      case Environment.staging:
        return true;
      case Environment.production:
        return true;
    }
  }
  
  static bool get enableCrashReporting {
    switch (_environment) {
      case Environment.development:
        return false;
      case Environment.staging:
        return true;
      case Environment.production:
        return true;
    }
  }
  
  static bool get debugMode {
    switch (_environment) {
      case Environment.development:
        return true;
      case Environment.staging:
        return false;
      case Environment.production:
        return false;
    }
  }
  
  // Database Configuration
  static String get databaseUrl {
    switch (_environment) {
      case Environment.development:
        return 'sqlite://local.db';
      case Environment.staging:
        return 'postgresql://staging-db.datachakra.com:5432/datachakra_staging';
      case Environment.production:
        return 'postgresql://db.datachakra.com:5432/datachakra_prod';
    }
  }
  
  // Firebase Configuration
  static String get firebaseProjectId {
    switch (_environment) {
      case Environment.development:
        return 'datachakra-dev';
      case Environment.staging:
        return 'datachakra-staging';
      case Environment.production:
        return 'datachakra-prod';
    }
  }
  
  // App Store Configuration
  static String get appStoreId => '1234567890'; // Will be assigned after app store submission
  static String get playStoreId => 'com.datachakra.app';
  
  // Analytics Configuration
  static String get mixpanelToken {
    switch (_environment) {
      case Environment.development:
        return 'dev_mixpanel_token';
      case Environment.staging:
        return 'staging_mixpanel_token';
      case Environment.production:
        return 'prod_mixpanel_token';
    }
  }
}