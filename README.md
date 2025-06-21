# DataChakra Landing Page 🌟

[![Deploy to GitHub Pages](https://github.com/datachakra/datachakra-landing/actions/workflows/deploy.yml/badge.svg)](https://github.com/datachakra/datachakra-landing/actions/workflows/deploy.yml)
[![Flutter Web](https://img.shields.io/badge/Flutter-Web-blue.svg)](https://flutter.dev/web)
[![Live Demo](https://img.shields.io/badge/Live-Demo-success.svg)](https://datachakra.github.io/datachakra-landing)

A stunning, responsive Flutter web landing page for DataChakra - the complete AI/ML mastery platform.

🌐 **Live Demo**: [https://datachakra.github.io/datachakra-landing](https://datachakra.github.io/datachakra-landing)

## 🎯 Overview

DataChakra's landing page combines ancient chakra wisdom with modern AI/ML education, featuring:

- **Responsive Design**: Perfect on mobile, tablet, and desktop
- **Animated Chakra Visualization**: Interactive 7-chakra learning path
- **Modern Animations**: Smooth transitions and micro-interactions
- **Conversion Optimized**: Clear CTAs and value propositions
- **SEO Ready**: Meta tags, structured data, and performance optimized

## 🌈 Key Features

### Sections
- **Hero Section**: Animated chakra visualization with compelling headline
- **Curriculum Section**: Interactive 7-chakra learning path
- **Features Showcase**: Platform capabilities and benefits
- **Social Proof**: Testimonials and success stories
- **Pricing Section**: Three-tier pricing with toggle
- **FAQ Section**: Common questions with expandable answers
- **Footer**: Newsletter signup, links, and social media

### Technical Features
- Responsive design (mobile-first)
- Smooth scroll animations
- Gradient buttons and cards
- Interactive chakra elements
- Performance optimized
- SEO meta tags
- PWA ready

## 🚀 Quick Start

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Web browser for testing

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd datachakra_landing_page
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the development server**
   ```bash
   flutter run -d chrome
   ```

4. **Build for production**
   ```bash
   flutter build web --release
   ```

## 📱 Responsive Breakpoints

- **Mobile**: < 768px
- **Tablet**: 768px - 1199px  
- **Desktop**: 1200px+

## 🎨 Design System

### Colors (Chakra-Inspired)
- **Root Chakra**: #e74c3c (Red)
- **Sacral Chakra**: #f39c12 (Orange)
- **Solar Plexus**: #f1c40f (Yellow)
- **Heart Chakra**: #27ae60 (Green)
- **Throat Chakra**: #3498db (Blue)
- **Third Eye**: #9b59b6 (Purple)
- **Crown Chakra**: #8b4513 (Brown)

### Brand Gradients
- **Primary**: #667eea → #764ba2
- **Secondary**: #f093fb → #f5576c

### Typography
- **Headings**: Poppins (600-700 weight)
- **Body**: Inter (400-500 weight)

## 📂 Project Structure

```
lib/
├── core/
│   ├── constants/
│   │   ├── app_colors.dart      # Color palette
│   │   └── app_constants.dart   # App constants
│   └── theme/
│       └── app_theme.dart       # Theme configuration
├── features/
│   └── home/
│       ├── home_page.dart       # Main page
│       └── widgets/             # Section widgets
│           ├── hero_section.dart
│           ├── curriculum_section.dart
│           ├── features_section.dart
│           ├── testimonials_section.dart
│           ├── pricing_section.dart
│           ├── faq_section.dart
│           └── footer_section.dart
├── shared/
│   └── widgets/
│       ├── gradient_button.dart # Reusable button
│       └── animated_chakra.dart # Chakra animation
└── main.dart                    # App entry point
```

## 🌟 Key Components

### Animated Chakra
Interactive circular elements representing each learning stage:
- Pulsing animation
- Glow effects
- Click interactions
- Color-coded by chakra

### Gradient Button
Reusable button component with:
- Gradient backgrounds
- Outlined variants
- Hover effects
- Responsive sizing

### Responsive Sections
All sections adapt to screen size:
- Desktop: Multi-column layouts
- Tablet: Adjusted spacing
- Mobile: Single-column, thumb-friendly

## 📊 Performance

### Optimizations
- Lazy loading animations
- Efficient widget rebuilds
- Image optimization ready
- Code splitting ready
- Web-specific optimizations

### Metrics Targets
- First Contentful Paint: < 1.5s
- Largest Contentful Paint: < 2.5s
- Cumulative Layout Shift: < 0.1

## 🔍 SEO Features

### Meta Tags
- Title and description optimization
- Open Graph tags for social sharing
- Twitter Card support
- Canonical URLs

### Structured Data
- Schema.org markup
- Educational organization data
- Course offering information

## 🚀 Deployment

### Automatic GitHub Pages Deployment
This repository is configured for automatic deployment to GitHub Pages:

1. **Push to main branch** triggers automatic deployment
2. **GitHub Actions** builds the Flutter web app
3. **Deploys to GitHub Pages** at: https://datachakra.github.io/datachakra-landing
4. **Custom domain** supported via CNAME (datachakra.com)

### Manual Deployment
```bash
# Build for production
flutter build web --release --base-href "/datachakra-landing/"

# The built files will be in build/web/
```

### Other Hosting Options
- **Firebase Hosting**: `firebase deploy --only hosting`
- **Netlify**: Upload `build/web` folder
- **Vercel**: Connect GitHub repository
- **Custom Server**: Serve `build/web` directory

### Performance Features
- ✅ Tree-shaken icons (99.4% size reduction)
- ✅ Optimized web rendering
- ✅ Lazy loading animations
- ✅ Responsive images ready
- ✅ SEO optimized

## 🎯 Conversion Optimization

### CTAs
- Primary: "Start Your Journey" → app.datachakra.com/signup
- Secondary: "View Curriculum" → scroll to section
- Multiple entry points throughout page

### Social Proof
- User testimonials with transformations
- Success statistics
- Industry recognition
- Community size indicators

## 📱 Mobile App Integration

The same codebase can be used for:
- iOS App Store presence
- Android Play Store presence
- Deep linking to web signup
- Consistent branding across platforms

## 🔧 Customization

### Adding New Sections
1. Create widget in `features/home/widgets/`
2. Add to `home_page.dart`
3. Update navigation if needed

### Modifying Colors
Edit `lib/core/constants/app_colors.dart`

### Updating Content
Edit `lib/core/constants/app_constants.dart`

## 📈 Analytics Integration

Ready for:
- Google Analytics
- Facebook Pixel
- Custom event tracking
- Conversion tracking
- A/B testing tools

## 🤝 Contributing

1. Fork the repository
2. Create feature branch
3. Make changes
4. Test thoroughly
5. Submit pull request

## 📄 License

This project is licensed under the MIT License.

## 🆘 Support

For issues and questions:
- Check the FAQ section
- Create GitHub issue
- Contact support team

---

**Built with ❤️ for AI/ML learners worldwide**