import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ripplai/theme.dart';
import 'package:ripplai/models/service.dart';
import 'package:ripplai/widgets/gradient_container.dart';
import 'package:ripplai/widgets/service_card.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> with TickerProviderStateMixin {
  late TabController _tabController;
  final categories = ServiceData.getCategories();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
                  'Our Services',
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
                          '🚀',
                          style: const TextStyle(fontSize: 48),
                        ).animate().scale(begin: const Offset(0.5, 0.5), duration: 800.ms, curve: Curves.elasticOut),
                        
                        const SizedBox(height: 16),
                        
                        Text(
                          'Specialized AI Solutions',
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
            
            // Tab Bar
            SliverPersistentHeader(
              pinned: true,
              delegate: _TabBarDelegate(
                TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  indicatorColor: RippAIColors.electricCyan,
                  indicatorWeight: 3,
                  labelColor: RippAIColors.electricCyan,
                  unselectedLabelColor: RippAIColors.pureWhite.withValues(alpha: 0.7),
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                  tabs: categories.map((category) => Tab(
                    text: category,
                  )).toList(),
                ),
              ),
            ),
            
            // Tab View Content
            SliverFillRemaining(
              child: TabBarView(
                controller: _tabController,
                children: categories.map((category) => 
                  _buildCategoryServices(category)
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryServices(String category) {
    final services = ServiceData.getServicesByCategory(category);
    
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category description
          GradientContainer(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _getCategoryDescription(category),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: RippAIColors.pureWhite,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: RippAIColors.electricCyan.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: RippAIColors.electricCyan.withValues(alpha: 0.5)),
                      ),
                      child: Text(
                        '${services.length} Services Available',
                        style: const TextStyle(
                          color: RippAIColors.electricCyan,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ).animate().slideY(begin: 0.3, duration: 600.ms).fadeIn(),
          
          const SizedBox(height: 24),
          
          // Services List
          Expanded(
            child: ListView.separated(
              itemCount: services.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final service = services[index];
                return ServiceCard(
                  service: service,
                  onTap: () => _showServiceDetails(service),
                ).animate(delay: Duration(milliseconds: 200 * index))
                  .slideX(begin: -0.3, duration: 600.ms, curve: Curves.easeOutBack)
                  .fadeIn();
              },
            ),
          ),
        ],
      ),
    );
  }

  String _getCategoryDescription(String category) {
    switch (category) {
      case 'AI Content Profit':
        return 'Transform your content strategy with AI-powered creation, optimization, and distribution systems that drive engagement and profit.';
      case 'AI Marketing Services':
        return 'Data-driven marketing solutions that optimize campaigns, reduce costs, and maximize ROI through intelligent automation.';
      case 'Lead Generation':
        return 'Automated lead generation systems that identify, engage, and convert prospects with minimal manual intervention.';
      case 'Procurement':
        return 'Optimize procurement processes and reduce costs through AI-powered supplier analysis and contract optimization.';
      case 'Sales':
        return 'End-to-end sales automation that accelerates velocity, improves forecasting, and increases conversion rates.';
      default:
        return 'Specialized AI solutions designed to transform your business operations and drive sustainable growth.';
    }
  }

  void _showServiceDetails(Service service) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (context, scrollController) => Container(
          decoration: const BoxDecoration(
            gradient: RippAIColors.primaryGradient,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              // Handle
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: RippAIColors.electricCyan,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: RippAIColors.electricCyan.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              service.icon,
                              style: const TextStyle(fontSize: 24),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  service.name,
                                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    color: RippAIColors.electricCyan,
                                  ),
                                ),
                                Text(
                                  service.category,
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: RippAIColors.pureWhite.withValues(alpha: 0.7),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 24),
                      
                      // Description
                      Text(
                        service.description,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: RippAIColors.pureWhite,
                          height: 1.5,
                        ),
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Features
                      Text(
                        'Key Features',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: RippAIColors.matteGold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ...service.features.map((feature) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                feature,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: RippAIColors.pureWhite.withValues(alpha: 0.9),
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                      
                      const SizedBox(height: 32),
                      
                      // Process
                      Text(
                        'Our Process',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: RippAIColors.matteGold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: RippAIColors.deepNavy.withValues(alpha: 0.6),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: RippAIColors.electricCyan.withValues(alpha: 0.3),
                          ),
                        ),
                        child: Text(
                          service.process,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: RippAIColors.pureWhite,
                            height: 1.4,
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Expected Outcome
                      Text(
                        'Expected Outcome',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: RippAIColors.matteGold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              RippAIColors.matteGold.withValues(alpha: 0.2),
                              RippAIColors.electricCyan.withValues(alpha: 0.1),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: RippAIColors.matteGold.withValues(alpha: 0.5),
                          ),
                        ),
                        child: Text(
                          service.expectedOutcome,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: RippAIColors.pureWhite,
                            fontWeight: FontWeight.w600,
                            height: 1.4,
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 40),
                      
                      // CTA Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                            // Navigate to contact or booking
                          },
                          icon: const Icon(Icons.arrow_forward),
                          label: const Text('Get Started with This Service'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _TabBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RippAIColors.primaryGradient,
      ),
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_TabBarDelegate oldDelegate) {
    return false;
  }
}