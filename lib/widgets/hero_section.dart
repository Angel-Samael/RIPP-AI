import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ripplai/theme.dart';
import 'package:ripplai/widgets/neon_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SizedBox(height: 40),
          
          // Main headline with glitch effect
          Text(
            'Where ideas ripple',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: RippAIColors.pureWhite,
            ),
            textAlign: TextAlign.center,
          ).animate()
            .slideY(begin: -0.5, duration: 800.ms, curve: Curves.easeOutBack)
            .fadeIn()
            .shimmer(delay: 1200.ms, duration: 1000.ms, color: RippAIColors.electricCyan),
          
          const SizedBox(height: 8),
          
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'through ',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: RippAIColors.pureWhite,
                  ),
                ),
                TextSpan(
                  text: 'AI',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: RippAIColors.electricCyan,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ' into ',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: RippAIColors.pureWhite,
                  ),
                ),
                TextSpan(
                  text: 'PROFIT!',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: RippAIColors.matteGold,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ).animate(delay: 400.ms)
            .slideY(begin: -0.3, duration: 800.ms, curve: Curves.easeOutBack)
            .fadeIn(),
          
          const SizedBox(height: 32),
          
          // Subtitle
          Text(
            'The only fully AI-automated agency\\nfor digital-native SMB leaders',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: RippAIColors.pureWhite.withValues(alpha: 0.9),
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ).animate(delay: 800.ms)
            .slideY(begin: 0.3, duration: 800.ms)
            .fadeIn(),
          
          const SizedBox(height: 40),
          
          // CTA Button
          NeonButton(
            text: 'Start Your AI Journey',
            icon: Icons.rocket_launch,
            onPressed: () {
              // Navigate to services or onboarding
            },
          ).animate(delay: 1200.ms)
            .scale(begin: const Offset(0.8, 0.8), duration: 600.ms, curve: Curves.elasticOut)
            .fadeIn(),
          
          const SizedBox(height: 24),
          
          // Secondary CTA
          OutlinedButton.icon(
            onPressed: () {
              // Navigate to about or demo
            },
            icon: const Icon(Icons.play_circle_outline),
            label: const Text('Watch Demo'),
          ).animate(delay: 1400.ms)
            .slideY(begin: 0.3, duration: 600.ms)
            .fadeIn(),
          
          const SizedBox(height: 40),
          
          // Floating AI elements
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildFloatingElement('🤖', 'AI Automation'),
              _buildFloatingElement('📈', 'Profit Growth'),
              _buildFloatingElement('⚡', 'Lightning Fast'),
            ],
          ).animate(delay: 1600.ms)
            .slideY(begin: 0.5, duration: 800.ms)
            .fadeIn(),
        ],
      ),
    );
  }

  Widget _buildFloatingElement(String emoji, String label) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: RippAIColors.deepNavy.withValues(alpha: 0.8),
            shape: BoxShape.circle,
            border: Border.all(color: RippAIColors.electricCyan, width: 1),
          ),
          child: Center(
            child: Text(
              emoji,
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ).animate(delay: 2000.ms)
          .scale(begin: const Offset(0.5, 0.5), duration: 800.ms, curve: Curves.elasticOut)
          .then()
          .shake(hz: 0.5, curve: Curves.easeInOut),
        
        const SizedBox(height: 8),
        
        Text(
          label,
          style: const TextStyle(
            color: RippAIColors.pureWhite,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}