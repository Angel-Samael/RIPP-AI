import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ripplai/theme.dart';
import 'package:ripplai/models/case_study.dart';
import 'package:ripplai/widgets/case_study_card.dart';
import 'package:ripplai/widgets/gradient_container.dart';

class CaseStudiesPage extends StatefulWidget {
  const CaseStudiesPage({super.key});

  @override
  State<CaseStudiesPage> createState() => _CaseStudiesPageState();
}

class _CaseStudiesPageState extends State<CaseStudiesPage> {
  String _selectedFilter = 'All';
  List<CaseStudy> _filteredStudies = CaseStudyData.caseStudies;
  final _filterOptions = ['All', ...CaseStudyData.getAllTags(), ...CaseStudyData.getAllIndustries()];

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
                  'Success Stories',
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
                          '📈',
                          style: const TextStyle(fontSize: 48),
                        ).animate().scale(begin: const Offset(0.5, 0.5), duration: 800.ms, curve: Curves.elasticOut),
                        
                        const SizedBox(height: 16),
                        
                        Text(
                          'Real Results, Real Impact',
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
            
            // Filter Section
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: GradientContainer(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.filter_list, color: RippAIColors.electricCyan),
                          const SizedBox(width: 12),
                          Text(
                            'Filter by:',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: RippAIColors.pureWhite,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 40,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: _filterOptions.length,
                          separatorBuilder: (context, index) => const SizedBox(width: 12),
                          itemBuilder: (context, index) {
                            final option = _filterOptions[index];
                            final isSelected = _selectedFilter == option;
                            
                            return FilterChip(
                              label: Text(
                                option,
                                style: TextStyle(
                                  color: isSelected ? RippAIColors.deepNavy : RippAIColors.pureWhite,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              selected: isSelected,
                              onSelected: (selected) => _applyFilter(option),
                              selectedColor: RippAIColors.electricCyan,
                              backgroundColor: RippAIColors.deepNavy.withValues(alpha: 0.6),
                              side: BorderSide(
                                color: isSelected ? RippAIColors.electricCyan : RippAIColors.electricCyan.withValues(alpha: 0.3),
                              ),
                              showCheckmark: false,
                            ).animate(delay: Duration(milliseconds: 50 * index))
                              .slideX(begin: -0.3, duration: 400.ms)
                              .fadeIn();
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '${_filteredStudies.length} case studies found',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: RippAIColors.matteGold,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ).animate().slideY(begin: 0.3, duration: 600.ms).fadeIn(),
            ),
            
            // Case Studies Grid
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverMasonryGrid.count(
                crossAxisCount: 1,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                itemBuilder: (context, index) {
                  final study = _filteredStudies[index];
                  return CaseStudyCard(
                    caseStudy: study,
                    onTap: () => _showCaseStudyDetails(study),
                  ).animate(delay: Duration(milliseconds: 200 * index))
                    .slideY(begin: 0.3, duration: 600.ms, curve: Curves.easeOutBack)
                    .fadeIn();
                },
                childCount: _filteredStudies.length,
              ),
            ),
            
            const SliverToBoxAdapter(child: SizedBox(height: 40)),
          ],
        ),
      ),
    );
  }

  void _applyFilter(String filter) {
    setState(() {
      _selectedFilter = filter;
      if (filter == 'All') {
        _filteredStudies = CaseStudyData.caseStudies;
      } else {
        _filteredStudies = CaseStudyData.caseStudies.where((study) {
          return study.tags.contains(filter) || study.industry == filter;
        }).toList();
      }
    });
  }

  void _showCaseStudyDetails(CaseStudy study) {
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
                      Text(
                        study.title,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: RippAIColors.electricCyan,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: RippAIColors.matteGold.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: RippAIColors.matteGold.withValues(alpha: 0.5)),
                            ),
                            child: Text(
                              study.industry,
                              style: const TextStyle(
                                color: RippAIColors.matteGold,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${study.projectDuration.inDays} days',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: RippAIColors.pureWhite.withValues(alpha: 0.7),
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Challenge
                      _buildSection('The Challenge', study.challenge),
                      
                      const SizedBox(height: 24),
                      
                      // Solution
                      _buildSection('Our Solution', study.solution),
                      
                      const SizedBox(height: 32),
                      
                      // Results
                      Text(
                        'Results Achieved',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: RippAIColors.matteGold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(20),
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
                        child: Column(
                          children: study.results.entries.map((entry) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    entry.key,
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: RippAIColors.pureWhite,
                                    ),
                                  ),
                                  Text(
                                    entry.value,
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: RippAIColors.matteGold,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Tags
                      Text(
                        'Tags',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: RippAIColors.electricCyan,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: study.tags.map((tag) => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: RippAIColors.electricCyan.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: RippAIColors.electricCyan.withValues(alpha: 0.5)),
                          ),
                          child: Text(
                            tag,
                            style: const TextStyle(
                              color: RippAIColors.electricCyan,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )).toList(),
                      ),
                      
                      const SizedBox(height: 40),
                      
                      // CTA
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                            // Navigate to contact
                          },
                          icon: const Icon(Icons.arrow_forward),
                          label: const Text('Start Your Success Story'),
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

  Widget _buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: RippAIColors.electricCyan,
          ),
        ),
        const SizedBox(height: 12),
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
            content,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: RippAIColors.pureWhite,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}