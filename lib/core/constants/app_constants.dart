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
  
  // Chakras Data - Authentic Sanskrit Names with Hindu Philosophy
  static const List<Map<String, dynamic>> chakrasData = [
    {
      'name': 'Muladhara',
      'meaning': 'Root of existence, survival & grounding',
      'subtitle': 'Foundational Bedrock',
      'color': 0xFFE74C3C,
      'description': 'Located at the base of spine. Governs survival, grounding, and basic needs. In AI/ML: Mathematical foundations (Linear Algebra, Calculus, Statistics) and Computer Science fundamentals - your stable foundation.',
      'topics': ['Linear Algebra', 'Calculus', 'Statistics', 'Computer Science'],
    },
    {
      'name': 'Swadhisthana',
      'meaning': 'Seat of creative & emotional energy',
      'subtitle': 'Code Creation',
      'color': 0xFFF39C12,
      'description': 'Located below navel. Governs creativity, sexuality, and emotional balance. In AI/ML: Python programming mastery, Database & SQL skills - your creative coding power.',
      'topics': ['Python Programming', 'Database & SQL', 'Development Tools'],
    },
    {
      'name': 'Manipura',
      'meaning': 'Center of personal power & transformation',
      'subtitle': 'Data Power',
      'color': 0xFFF1C40F,
      'description': 'Located at solar plexus. Governs personal power, confidence, and transformation. In AI/ML: Data architecture theory, Distributed systems - your inner fire and determination.',
      'topics': ['Data Architecture', 'Distributed Systems', 'Streaming Tech'],
    },
    {
      'name': 'Anahata',
      'meaning': 'Center of love, compassion & connection',
      'subtitle': 'Pipeline Harmony',
      'color': 0xFF27AE60,
      'description': 'Located at heart center. Governs love, compassion, and connection. In AI/ML: Data engineering practice, Apache Spark, Kafka - harmonious data flow.',
      'topics': ['Data Engineering', 'Apache Spark', 'Kafka', 'Cloud Platforms'],
    },
    {
      'name': 'Vishuddha',
      'meaning': 'Center of communication & truth',
      'subtitle': 'Model Expression',
      'color': 0xFF3498DB,
      'description': 'Located at throat. Governs communication, truth, and self-expression. In AI/ML: Statistical learning theory, ML mathematics - expressing data truth.',
      'topics': ['Statistical Learning', 'ML Mathematics', 'Algorithms'],
    },
    {
      'name': 'Ajna',
      'meaning': 'Third eye of wisdom & intuition',
      'subtitle': 'Deep Vision',
      'color': 0xFF9B59B6,
      'description': 'Located between eyebrows. Governs intuition, wisdom, and higher perception. In AI/ML: Deep learning, Computer vision, NLP - seeing beyond the obvious.',
      'topics': ['Classical ML', 'Deep Learning', 'Computer Vision', 'NLP'],
    },
    {
      'name': 'Sahasrara',
      'meaning': 'Thousand-petaled lotus, divine connection',
      'subtitle': 'AI Mastery',
      'color': 0xFF8B4513,
      'description': 'Located at crown of head. Governs spiritual connection and enlightenment. In AI/ML: Transformer architectures, Large Language Models - achieving AI mastery.',
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