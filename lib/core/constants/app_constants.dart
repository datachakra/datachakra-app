class AppConstants {
  // URLs
  static const String appUrl = 'https://app.datachakra.com';
  static const String signupUrl = '$appUrl/signup';
  static const String loginUrl = '$appUrl/login';
  
  // Breakpoints
  static const double mobileBreakpoint = 768;
  static const double tabletBreakpoint = 1024;
  static const double desktopBreakpoint = 1200;
  
  // Spacing
  static const double spacingXs = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 16.0;
  static const double spacingL = 24.0;
  static const double spacingXl = 32.0;
  static const double spacingXxl = 48.0;
  
  // Border Radius
  static const double radiusS = 4.0;
  static const double radiusM = 8.0;
  static const double radiusL = 12.0;
  static const double radiusXl = 16.0;
  static const double radiusRound = 50.0;
  
  // Animation Durations
  static const Duration animationFast = Duration(milliseconds: 200);
  static const Duration animationMedium = Duration(milliseconds: 400);
  static const Duration animationSlow = Duration(milliseconds: 600);
  
  // Hero Section
  static const String heroTitle = 'Master AI/ML from Foundations to Enlightenment';
  static const String heroSubtitle = 'The complete 7-chakra learning path that transforms you from beginner to AI expert';
  static const String heroSocialProof = 'Join 10,000+ learners';
  
  // Chakras Data
  static const List<Map<String, dynamic>> chakrasData = [
    {
      'name': 'Root Chakra',
      'subtitle': 'Foundational Bedrock',
      'color': 0xFFE74C3C,
      'description': 'Mathematical foundations (Linear Algebra, Calculus, Statistics) and Computer Science fundamentals',
      'duration': '2-3 months',
      'topics': ['Linear Algebra', 'Calculus', 'Statistics', 'Computer Science'],
    },
    {
      'name': 'Sacral Chakra',
      'subtitle': 'Code Creation',
      'color': 0xFFF39C12,
      'description': 'Python programming mastery, Database & SQL skills, and Development tools',
      'duration': '2-3 months',
      'topics': ['Python Programming', 'Database & SQL', 'Development Tools'],
    },
    {
      'name': 'Solar Plexus',
      'subtitle': 'Data Power',
      'color': 0xFFF1C40F,
      'description': 'Data architecture theory, Distributed systems, and Streaming technologies',
      'duration': '1-2 months',
      'topics': ['Data Architecture', 'Distributed Systems', 'Streaming Tech'],
    },
    {
      'name': 'Heart Chakra',
      'subtitle': 'Pipeline Harmony',
      'color': 0xFF27AE60,
      'description': 'Data engineering practice, Apache Spark, Kafka, and Cloud platforms',
      'duration': '3-4 months',
      'topics': ['Data Engineering', 'Apache Spark', 'Kafka', 'Cloud Platforms'],
    },
    {
      'name': 'Throat Chakra',
      'subtitle': 'Model Expression',
      'color': 0xFF3498DB,
      'description': 'Statistical learning theory, ML mathematics, and Algorithm foundations',
      'duration': '2-3 months',
      'topics': ['Statistical Learning', 'ML Mathematics', 'Algorithms'],
    },
    {
      'name': 'Third Eye',
      'subtitle': 'Deep Vision',
      'color': 0xFF9B59B6,
      'description': 'Classical ML implementation, Deep learning & neural networks, Computer vision, NLP',
      'duration': '4-5 months',
      'topics': ['Classical ML', 'Deep Learning', 'Computer Vision', 'NLP'],
    },
    {
      'name': 'Crown Chakra',
      'subtitle': 'AI Mastery',
      'color': 0xFF8B4513,
      'description': 'Transformer architectures, Large Language Models, and AI agents & systems',
      'duration': '6+ months',
      'topics': ['Transformers', 'Large Language Models', 'AI Agents'],
    },
  ];
  
  // Pricing Tiers
  static const Map<String, dynamic> pricingData = {
    'free': {
      'name': 'Free Tier',
      'price': '\$0',
      'duration': 'forever',
      'features': [
        'Access to Root Chakra (foundations)',
        'Basic community features',
        'Limited assessments',
        'Basic progress tracking',
      ],
    },
    'pro': {
      'name': 'Pro Tier',
      'price': '\$29',
      'duration': 'per month',
      'features': [
        'All 7 chakras unlocked',
        'Advanced code playground',
        '1-on-1 mentorship sessions',
        'Priority community support',
        'Certificate of completion',
        'Project portfolios',
      ],
      'popular': true,
    },
    'team': {
      'name': 'Team Tier',
      'price': '\$99',
      'duration': 'per month',
      'features': [
        'Everything in Pro',
        'Team dashboard and analytics',
        'Custom learning paths',
        'Dedicated support',
        'Corporate certificates',
        'Bulk user management',
      ],
    },
  };
}