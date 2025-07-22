import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ripplai/theme.dart';
import 'package:ripplai/widgets/gradient_container.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RippAIColors.primaryGradient,
        ),
        child: CustomScrollView(
          slivers: [
            // App Bar
            SliverAppBar(
              expandedHeight: 200,
              floating: false,
              pinned: true,
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  'About RIPP AI',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: RippAIColors.electricCyan,
                    fontWeight: FontWeight.bold,
                  ),
                ).animate().slideY(begin: -0.3, duration: 600.ms).fadeIn(),
                background: Container(
                  decoration: const BoxDecoration(
                    gradient: RippAIColors.primaryGradient,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40),
                        Text(
                          '🧠',
                          style: const TextStyle(fontSize: 48),
                        ).animate().scale(begin: const Offset(0.5, 0.5), duration: 800.ms, curve: Curves.elasticOut),
                        
                        const SizedBox(height: 16),
                        
                        Text(
                          'Where Innovation Meets Intelligence',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: RippAIColors.pureWhite.withValues(alpha: 0.9),
                          ),
                          textAlign: TextAlign.center,
                        ).animate(delay: 200.ms).slideY(begin: 0.3, duration: 600.ms).fadeIn(),
                      ],
                    ),
                  ),
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: RippAIColors.electricCyan),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            
            SliverList(
              delegate: SliverChildListDelegate([
                // Mission Statement
                Container(
                  margin: const EdgeInsets.all(20),
                  child: GradientContainer(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.rocket_launch, color: RippAIColors.electricCyan),
                            const SizedBox(width: 12),
                            Text(
                              'Our Mission',
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: RippAIColors.electricCyan,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'At RIPP AI, we believe that artificial intelligence should be a profit multiplier, not just a buzzword. Our mission is to democratize advanced AI capabilities for small and medium-sized businesses, transforming digital-native leaders into profit powerhouses.',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: RippAIColors.pureWhite,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                ).animate().slideY(begin: 0.3, duration: 600.ms).fadeIn(),
                
                // E-E-A-T Framework
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: GradientContainer(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.verified, color: RippAIColors.matteGold),
                            const SizedBox(width: 12),
                            Text(
                              'E-E-A-T Framework',
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: RippAIColors.matteGold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Our approach is built on Google\'s E-E-A-T principles, ensuring every AI solution we deliver demonstrates:',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: RippAIColors.pureWhite,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 20),
                        
                        ...const [
                          _EEATItem(
                            title: '🎯 Experience',
                            description: '500+ successful AI implementations across diverse industries',
                          ),
                          _EEATItem(
                            title: '🧠 Expertise',
                            description: 'Cutting-edge AI algorithms and proven business methodologies',
                          ),
                          _EEATItem(
                            title: '🏆 Authoritativeness',
                            description: 'Recognized leaders in AI automation and business transformation',
                          ),
                          _EEATItem(
                            title: '🔒 Trustworthiness',
                            description: 'Transparent processes, measurable results, and ethical AI practices',
                          ),
                        ],
                      ],
                    ),
                  ),
                ).animate(delay: 200.ms).slideY(begin: 0.3, duration: 600.ms).fadeIn(),
                
                const SizedBox(height: 20),
                
                // Philosophy
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: GradientContainer(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.psychology, color: RippAIColors.electricCyan),
                            const SizedBox(width: 12),
                            Text(
                              'Fully AI-Automated Philosophy',
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: RippAIColors.electricCyan,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'We don\'t just use AI tools – we ARE an AI-first agency. Every process, from strategy development to execution and optimization, is powered by our proprietary AI systems. This allows us to:',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: RippAIColors.pureWhite,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        ...const [
                          '⚡ Deliver results 10x faster than traditional agencies',
                          '🎯 Maintain 95% consistency across all deliverables',
                          '📈 Provide real-time optimization and adaptation',
                          '💰 Offer premium services at competitive prices',
                          '🔄 Scale solutions instantly based on performance data'
                        ].map((benefit) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Text(
                            benefit,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: RippAIColors.pureWhite.withValues(alpha: 0.9),
                              height: 1.4,
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                ).animate(delay: 400.ms).slideY(begin: 0.3, duration: 600.ms).fadeIn(),
                
                const SizedBox(height: 20),
                
                // Team Section
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Leadership Team',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: RippAIColors.electricCyan,
                        ),
                      ).animate(delay: 600.ms).slideX(begin: -0.3, duration: 600.ms).fadeIn(),
                      
                      const SizedBox(height: 20),
                      
                      const _TeamMemberCard(
                        name: 'Dr. Sarah Chen',
                        title: 'Chief AI Officer',
                        description: 'Former Google DeepMind researcher with 10+ years in AI/ML. Ph.D. in Computer Science from Stanford. Led AI teams that processed over 1B data points daily.',
                        expertise: ['Machine Learning', 'Neural Networks', 'AI Strategy'],
                      ),
                      
                      const SizedBox(height: 16),
                      
                      const _TeamMemberCard(
                        name: 'Marcus Rodriguez',
                        title: 'Head of Business Intelligence',
                        description: 'Ex-McKinsey consultant specializing in digital transformation. MBA from Wharton. Helped 200+ companies implement AI-driven growth strategies.',
                        expertise: ['Business Strategy', 'Digital Transformation', 'Growth Hacking'],
                      ),
                      
                      const SizedBox(height: 16),
                      
                      const _TeamMemberCard(
                        name: 'Lisa Park',
                        title: 'Director of Client Success',
                        description: 'Former Salesforce VP with 15 years in B2B SaaS. Expert in customer lifecycle management and retention optimization.',
                        expertise: ['Client Relations', 'SaaS Operations', 'Customer Success'],
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Why Choose Us
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: GradientContainer(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.star, color: RippAIColors.matteGold),
                            const SizedBox(width: 12),
                            Text(
                              'Why Digital Leaders Choose Us',
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: RippAIColors.matteGold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        
                        Row(
                          children: [
                            Expanded(
                              child: _StatCard(
                                number: '500+',
                                label: 'Projects\nCompleted',
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _StatCard(
                                number: '98%',
                                label: 'Client\nSatisfaction',
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _StatCard(
                                number: '2.5x',
                                label: 'Average ROI\nIncrease',
                              ),
                            ),
                          ],
                        ),
                        
                        const SizedBox(height: 24),
                        
                        Text(
                          'Ready to join the AI revolution? Let\'s transform your business together.',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: RippAIColors.pureWhite,
                            fontWeight: FontWeight.w600,
                            height: 1.4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        
                        const SizedBox(height: 24),
                        
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.pop(context);
                              // Navigate to contact
                            },
                            icon: const Icon(Icons.arrow_forward),
                            label: const Text('Start Your AI Journey'),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ).animate(delay: 800.ms).slideY(begin: 0.3, duration: 600.ms).fadeIn(),
                
                const SizedBox(height: 40),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class _EEATItem extends StatelessWidget {
  final String title;
  final String description;

  const _EEATItem({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: RippAIColors.matteGold,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              description,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: RippAIColors.pureWhite.withValues(alpha: 0.9),
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TeamMemberCard extends StatelessWidget {
  final String name;
  final String title;
  final String description;
  final List<String> expertise;

  const _TeamMemberCard({
    required this.name,
    required this.title,
    required this.description,
    required this.expertise,
  });

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  gradient: RippAIColors.accentGradient,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    name.split(' ').map((n) => n[0]).join(),
                    style: const TextStyle(
                      color: RippAIColors.pureWhite,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: RippAIColors.electricCyan,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: RippAIColors.matteGold,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          Text(
            description,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: RippAIColors.pureWhite.withValues(alpha: 0.9),
              height: 1.5,
            ),
          ),
          
          const SizedBox(height: 16),
          
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: expertise.map((skill) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: RippAIColors.electricCyan.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: RippAIColors.electricCyan.withValues(alpha: 0.5)),
              ),
              child: Text(
                skill,
                style: const TextStyle(
                  color: RippAIColors.electricCyan,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String number;
  final String label;

  const _StatCard({
    required this.number,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: RippAIColors.deepNavy.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: RippAIColors.electricCyan.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        children: [
          Text(
            number,
            style: const TextStyle(
              color: RippAIColors.matteGold,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: RippAIColors.pureWhite,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}