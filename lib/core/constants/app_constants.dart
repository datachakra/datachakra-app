class AppConstants {
  // URLs - Now managed by AppConfig for environment-specific values
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
      'name': 'Root Chakra (Muladhara)',
      'sanskrit': 'Muladhara',
      'english': 'Root Chakra',
      'meaning': 'Root of existence, survival & grounding',
      'subtitle': 'Foundational Bedrock',
      'color': 0xFFE74C3C,
      'description': 'Located at the base of spine. Governs survival, grounding, and basic needs - the foundation for all higher development. DataChakra interprets this as having deep understanding and knowledge of: Mathematical foundations (Linear Algebra, Calculus, Statistics) and Computer Science fundamentals. Just as the root chakra anchors spiritual growth, these mathematical principles anchor all AI development.',
      'topics': ['Linear Algebra', 'Calculus', 'Statistics', 'Computer Science'],
    },
    {
      'name': 'Sacral Chakra (Swadhisthana)',
      'sanskrit': 'Swadhisthana',
      'english': 'Sacral Chakra',
      'meaning': 'Seat of creative & emotional energy',
      'subtitle': 'Code Creation',
      'color': 0xFFF39C12,
      'description': 'Located below navel. Governs creativity, sexuality, and emotional balance - the source of creative life force. DataChakra interprets this as having deep understanding and knowledge of: Python programming mastery and Database & SQL skills. Like creative energy flowing through the sacral chakra, code flows through elegant programming to create digital life.',
      'topics': ['Python Programming', 'Database & SQL', 'Development Tools'],
    },
    {
      'name': 'Solar Plexus Chakra (Manipura)',
      'sanskrit': 'Manipura',
      'english': 'Solar Plexus Chakra',
      'meaning': 'Center of personal power & transformation',
      'subtitle': 'Data Power',
      'color': 0xFFF1C40F,
      'description': 'Located at solar plexus. Governs personal power, confidence, and transformation - the fire of willpower and determination. DataChakra interprets this as having deep understanding and knowledge of: Data architecture theory and Distributed systems. As the solar plexus transforms raw energy into focused power, these skills transform raw data into structured, scalable systems.',
      'topics': ['Data Architecture', 'Distributed Systems', 'Streaming Tech'],
    },
    {
      'name': 'Heart Chakra (Anahata)',
      'sanskrit': 'Anahata',
      'english': 'Heart Chakra',
      'meaning': 'Center of love, compassion & connection',
      'subtitle': 'Pipeline Harmony',
      'color': 0xFF27AE60,
      'description': 'Located at heart center. Governs love, compassion, and connection - the bridge between lower and higher consciousness. DataChakra interprets this as having deep understanding and knowledge of: Data engineering practice, Apache Spark, and Kafka. Like the heart connecting body and mind, these technologies create seamless connections between disparate data sources, enabling compassionate AI that serves humanity.',
      'topics': ['Data Engineering', 'Apache Spark', 'Kafka', 'Cloud Platforms'],
    },
    {
      'name': 'Throat Chakra (Vishuddha)',
      'sanskrit': 'Vishuddha',
      'english': 'Throat Chakra',
      'meaning': 'Center of communication & truth',
      'subtitle': 'Model Expression',
      'color': 0xFF3498DB,
      'description': 'Located at throat. Governs communication, truth, and self-expression - the power to speak reality into existence. DataChakra interprets this as having deep understanding and knowledge of: Statistical learning theory and ML mathematics. As the throat chakra gives voice to inner truth, these mathematical principles give voice to hidden patterns in data, expressing the fundamental truths within information.',
      'topics': ['Statistical Learning', 'ML Mathematics', 'Algorithms'],
    },
    {
      'name': 'Third Eye Chakra (Ajna)',
      'sanskrit': 'Ajna',
      'english': 'Third Eye Chakra',
      'meaning': 'Third eye of wisdom & intuition',
      'subtitle': 'Deep Vision',
      'color': 0xFF9B59B6,
      'description': 'Located between eyebrows. Governs intuition, wisdom, and higher perception - the third eye that sees beyond physical reality. DataChakra interprets this as having deep understanding and knowledge of: Deep learning, Computer vision, and NLP. Like the third eye perceiving subtle energies invisible to physical senses, these AI technologies perceive patterns and insights hidden from human consciousness.',
      'topics': ['Classical ML', 'Deep Learning', 'Computer Vision', 'NLP'],
    },
    {
      'name': 'Crown Chakra (Sahasrara)',
      'sanskrit': 'Sahasrara',
      'english': 'Crown Chakra',
      'meaning': 'Thousand-petaled lotus, divine connection',
      'subtitle': 'AI Mastery',
      'color': 0xFF8B4513,
      'description': 'Located at crown of head. Governs spiritual connection and enlightenment - unity with universal consciousness. DataChakra interprets this as having deep understanding and knowledge of: Transformer architectures and Large Language Models. As the crown chakra connects individual consciousness to universal wisdom, these advanced AI systems connect human intelligence to the vast collective knowledge of humanity, achieving technological enlightenment.',
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