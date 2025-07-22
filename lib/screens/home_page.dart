import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ripplai/theme.dart';
import 'package:ripplai/widgets/gradient_container.dart';
import 'package:ripplai/widgets/hero_section.dart';
import 'package:ripplai/widgets/path_selection.dart';
import 'package:ripplai/widgets/social_proof.dart';
import 'package:ripplai/widgets/floating_chat_button.dart';
import 'package:ripplai/screens/services_page.dart';
import 'package:ripplai/screens/case_studies_page.dart';
import 'package:ripplai/screens/about_page.dart';
import 'package:ripplai/screens/contact_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: RippAIColors.primaryGradient,
            ),
          ),
          
          // Main content
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 100,
                floating: true,
                pinned: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    'RIPP AI',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: RippAIColors.electricCyan,
                      fontWeight: FontWeight.bold,
                    ),
                  ).animate().slideY(begin: -0.2, duration: 600.ms).fadeIn(),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.menu, color: RippAIColors.electricCyan),
                    onPressed: () => _showNavigationMenu(context),
                  ),
                ],
              ),
              
              SliverList(
                delegate: SliverChildListDelegate([
                  // Hero Section
                  const HeroSection(),
                  
                  const SizedBox(height: 40),
                  
                  // Path Selection
                  const PathSelection(),
                  
                  const SizedBox(height: 40),
                  
                  // Social Proof Section
                  const SocialProof(),
                  
                  const SizedBox(height: 40),
                  
                  // Value Proposition
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: GradientContainer(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            Text(
                              '🚀 We don\'t just use AI.',
                              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: RippAIColors.pureWhite,
                              ),
                              textAlign: TextAlign.center,
                            ).animate().slideY(begin: 0.3, duration: 800.ms).fadeIn(),
                            
                            const SizedBox(height: 16),
                            
                            Text(
                              'We build your profit with it.',
                              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                color: RippAIColors.matteGold,
                              ),
                              textAlign: TextAlign.center,
                            ).animate(delay: 200.ms).slideY(begin: 0.3, duration: 800.ms).fadeIn(),
                            
                            const SizedBox(height: 24),
                            
                            Text(
                              'Our fully AI-automated agency delivers specialized services that transform digital natives into profit leaders.',
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: RippAIColors.pureWhite,
                              ),
                              textAlign: TextAlign.center,
                            ).animate(delay: 400.ms).slideY(begin: 0.3, duration: 800.ms).fadeIn(),
                          ],
                        ),
                      ),
                    ),
                  ).animate(delay: 600.ms).scale(begin: const Offset(0.8, 0.8)),
                  
                  const SizedBox(height: 60),
                ]),
              ),
            ],
          ),
          
          // Floating chat button
          const Positioned(
            bottom: 20,
            right: 20,
            child: FloatingChatButton(),
          ),
        ],
      ),
    );
  }

  void _showNavigationMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          gradient: RippAIColors.primaryGradient,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: RippAIColors.electricCyan,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            
            _buildMenuItem(context, Icons.business_center, 'Services', () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const ServicesPage()));
            }),
            _buildMenuItem(context, Icons.analytics, 'Case Studies', () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const CaseStudiesPage()));
            }),
            _buildMenuItem(context, Icons.info_outline, 'About Us', () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutPage()));
            }),
            _buildMenuItem(context, Icons.library_books, 'Resources', () {}),
            _buildMenuItem(context, Icons.contact_mail, 'Contact', () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const ContactPage()));
            }),
            
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: RippAIColors.electricCyan),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: RippAIColors.pureWhite,
        ),
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
    ).animate().slideX(begin: -0.3, duration: 300.ms).fadeIn();
  }
}