# Contributing to DataChakra App

We love your input! We want to make contributing to this project as easy and transparent as possible.

## Development Process

We use GitHub to host code, track issues and feature requests, and accept pull requests.

### Branching Strategy

- **`main`** - Production branch, automatically deploys to GitHub Pages
- **`develop`** - Development branch for ongoing work
- **`feature/*`** - Feature branches (e.g., `feature/hero-animations`)
- **`bugfix/*`** - Bug fix branches (e.g., `bugfix/mobile-responsive`)
- **`hotfix/*`** - Critical fixes for production

### Pull Request Process

1. Fork the repository
2. Create a feature branch from `develop`
3. Make your changes
4. Test thoroughly on different screen sizes
5. Update documentation if needed
6. Submit a pull request to `develop`

## Development Setup

### Prerequisites
- Flutter SDK (3.24.0 or higher)
- Dart SDK (3.0.0 or higher)
- Chrome browser for web testing

### Local Development

```bash
# Clone the repository
git clone https://github.com/datachakra/datachakra-app.git
cd datachakra_app

# Install dependencies
flutter pub get

# Run in development mode
flutter run -d chrome

# Build for production
flutter build web --release
```

### Code Style

- Follow [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- Use meaningful variable and function names
- Add comments for complex logic
- Ensure responsive design works on all breakpoints

### Testing

```bash
# Run analyzer
flutter analyze

# Check formatting
dart format --set-exit-if-changed .

# Run tests (when available)
flutter test
```

## What We're Looking For

### High Priority
- 🐛 Bug fixes
- 📱 Mobile responsiveness improvements
- ⚡ Performance optimizations
- ♿ Accessibility enhancements

### Medium Priority
- ✨ Animation improvements
- 🎨 Design enhancements
- 📝 Content updates
- 🌐 SEO improvements

### Low Priority
- 📚 Documentation improvements
- 🧪 Test coverage
- 🔧 Build process improvements

## Reporting Issues

### Bug Reports
Include:
- Device/browser information
- Steps to reproduce
- Expected vs actual behavior
- Screenshots if applicable

### Feature Requests
Include:
- Clear description of the feature
- Use case/problem it solves
- Mockups or examples if available

## Design Guidelines

### Chakra Theme
- Maintain the 7-chakra color scheme
- Preserve the mystical yet professional aesthetic
- Ensure ancient wisdom + modern tech balance

### Responsive Design
- Mobile-first approach
- Test on multiple screen sizes
- Ensure touch-friendly interactions

### Performance
- Keep animations smooth (60fps)
- Optimize images and assets
- Maintain fast loading times

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

## Questions?

Feel free to open an issue for any questions about contributing!