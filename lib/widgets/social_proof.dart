import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ripplai/theme.dart';

class SocialProof extends StatelessWidget {
  const SocialProof({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            'Trusted by Digital Leaders',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: RippAIColors.pureWhite,
            ),
            textAlign: TextAlign.center,
          ).animate().slideY(begin: -0.3, duration: 600.ms).fadeIn(),
          
          const SizedBox(height: 32),
          
          // Stats Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatItem('500+', 'Projects\nCompleted'),
              _buildStatItem('98%', 'Client\nSatisfaction'),
              _buildStatItem('2.5x', 'Average ROI\nIncrease'),
            ],
          ).animate(delay: 200.ms).slideY(begin: 0.3, duration: 600.ms).fadeIn(),
          
          const SizedBox(height: 40),
          
          // Testimonials Grid
          StaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
              _buildTestimonialCard(
                'RIPP AI transformed our content strategy. We saw 300% increase in engagement within 2 months!',
                'Sarah Chen',
                'CMO, TechFlow',
                '⭐⭐⭐⭐⭐',
                crossAxisCellCount: 2,
              ).animate(delay: 400.ms).slideY(begin: 0.3, duration: 600.ms).fadeIn(),
              
              _buildTestimonialCard(
                'The AI automation saved us 40 hours per week. Now we focus on strategy, not repetitive tasks.',
                'Marcus Rodriguez',
                'Founder, GrowthLab',
                '⭐⭐⭐⭐⭐',
                crossAxisCellCount: 1,
              ).animate(delay: 600.ms).slideY(begin: 0.3, duration: 600.ms).fadeIn(),
              
              _buildTestimonialCard(
                'Their lead generation AI increased our conversion rate by 150%. Incredible results!',
                'Lisa Park',
                'CEO, InnovateCorp',
                '⭐⭐⭐⭐⭐',
                crossAxisCellCount: 1,
              ).animate(delay: 800.ms).slideY(begin: 0.3, duration: 600.ms).fadeIn(),
            ],
          ),
          
          const SizedBox(height: 32),
          
          // Client Logos
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: RippAIColors.pureWhite.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: RippAIColors.electricCyan.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: Column(
              children: [
                Text(
                  'Featured Partners',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: RippAIColors.electricCyan,
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 20,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: [
                    _buildClientLogo('TechFlow'),
                    _buildClientLogo('GrowthLab'),
                    _buildClientLogo('InnovateCorp'),
                    _buildClientLogo('FutureScale'),
                    _buildClientLogo('AI Dynamics'),
                    _buildClientLogo('NextGen Solutions'),
                  ],
                ),
              ],
            ),
          ).animate(delay: 1000.ms).scale(begin: const Offset(0.9, 0.9)).fadeIn(),
        ],
      ),
    );
  }

  Widget _buildStatItem(String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
            color: RippAIColors.matteGold,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: RippAIColors.pureWhite,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  StaggeredGridTile _buildTestimonialCard(
    String testimonial,
    String name,
    String title,
    String rating,
    {required int crossAxisCellCount}
  ) {
    return StaggeredGridTile.count(
      crossAxisCellCount: crossAxisCellCount,
      mainAxisCellCount: crossAxisCellCount == 2 ? 2 : 3,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              RippAIColors.deepNavy.withValues(alpha: 0.6),
              RippAIColors.darkIndigo.withValues(alpha: 0.8),
            ],
          ),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: RippAIColors.electricCyan.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              rating,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              '\"$testimonial\"',
              style: const TextStyle(
                color: RippAIColors.pureWhite,
                fontSize: 14,
                height: 1.4,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: RippAIColors.electricCyan,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: RippAIColors.pureWhite.withValues(alpha: 0.7),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClientLogo(String companyName) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: RippAIColors.pureWhite.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: RippAIColors.electricCyan.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Text(
        companyName,
        style: const TextStyle(
          color: RippAIColors.pureWhite,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}