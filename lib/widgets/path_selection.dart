import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ripplai/theme.dart';
import 'package:ripplai/widgets/neon_button.dart';
import 'package:ripplai/screens/services_page.dart';

class PathSelection extends StatelessWidget {
  const PathSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            'Find Your Path',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: RippAIColors.electricCyan,
            ),
            textAlign: TextAlign.center,
          ).animate().slideY(begin: -0.3, duration: 600.ms).fadeIn(),
          
          const SizedBox(height: 16),
          
          Text(
            'Choose your AI transformation journey',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: RippAIColors.pureWhite.withValues(alpha: 0.8),
            ),
            textAlign: TextAlign.center,
          ).animate(delay: 200.ms).slideY(begin: -0.2, duration: 600.ms).fadeIn(),
          
          const SizedBox(height: 40),
          
          Row(
            children: [
              // AI Curious Path
              Expanded(
                child: _PathCard(
                  title: 'Start Your\nAI Journey',
                  subtitle: 'For the AI-Curious',
                  icon: Icons.explore,
                  color: RippAIColors.electricCyan,
                  description: 'Discover foundational AI benefits and build your knowledge base',
                  features: const [
                    '📚 AI Fundamentals',
                    '💡 Use Case Examples',
                    '🎯 Quick Wins',
                  ],
                  onPressed: () {
                    // Navigate to AI basics page
                  },
                ).animate(delay: 400.ms)
                  .slideX(begin: -0.5, duration: 800.ms, curve: Curves.easeOutBack)
                  .fadeIn(),
              ),
              
              const SizedBox(width: 16),
              
              // AI Ready Path
              Expanded(
                child: _PathCard(
                  title: 'Scale with\nExpert AI',
                  subtitle: 'For the AI-Ready',
                  icon: Icons.rocket_launch,
                  color: RippAIColors.matteGold,
                  description: 'Advanced AI solutions for immediate business transformation',
                  features: const [
                    '⚡ Advanced Automation',
                    '📈 Profit Optimization',
                    '🚀 Full Implementation',
                  ],
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const ServicesPage()));
                  },
                ).animate(delay: 600.ms)
                  .slideX(begin: 0.5, duration: 800.ms, curve: Curves.easeOutBack)
                  .fadeIn(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PathCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final String description;
  final List<String> features;
  final VoidCallback onPressed;

  const _PathCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.description,
    required this.features,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            RippAIColors.deepNavy.withValues(alpha: 0.8),
            RippAIColors.darkIndigo.withValues(alpha: 0.9),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.5), width: 1),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.3),
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon and subtitle
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: color, size: 20),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    subtitle,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: color,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Title
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: RippAIColors.pureWhite,
                height: 1.2,
              ),
            ),
            
            const SizedBox(height: 12),
            
            // Description
            Text(
              description,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: RippAIColors.pureWhite.withValues(alpha: 0.8),
                height: 1.4,
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Features
            ...features.map((feature) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                feature,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: RippAIColors.pureWhite.withValues(alpha: 0.9),
                ),
              ),
            )),
            
            const SizedBox(height: 20),
            
            // CTA Button
            SizedBox(
              width: double.infinity,
              child: NeonButton(
                text: 'Get Started',
                icon: Icons.arrow_forward,
                onPressed: onPressed,
                isSecondary: color == RippAIColors.matteGold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}