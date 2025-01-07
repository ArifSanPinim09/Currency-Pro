// lib/app/presentation/screens/onboarding/widgets/onboarding_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPage extends StatelessWidget {
  final String illustration;
  final String title;
  final String description;
  final bool showSkip;
  final bool showDemo;
  final bool showPremium;
  final bool showCTA;

  const OnboardingPage({
    super.key,
    required this.illustration,
    required this.title,
    required this.description,
    this.showSkip = false,
    this.showDemo = false,
    this.showPremium = false,
    this.showCTA = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Illustration
          SvgPicture.asset(
            illustration,
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          const SizedBox(height: 40),

          // Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          // Description
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),

          // Conditional Widgets
          // if (showDemo) const QuickConvertDemo(),
          // if (showPremium) const PremiumFeatures(),
          if (showCTA) _buildCTAButtons(context),
        ],
      ),
    );
  }

  Widget _buildCTAButtons(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 48,
              vertical: 16,
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text('Create Account'),
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () {},
          child: const Text('Already have an account? Login'),
        ),
      ],
    );
  }
}
