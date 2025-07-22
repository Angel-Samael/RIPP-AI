import 'package:flutter/material.dart';
import 'package:ripplai/theme.dart';
import 'package:ripplai/models/case_study.dart';

class CaseStudyCard extends StatelessWidget {
  final CaseStudy caseStudy;
  final VoidCallback onTap;

  const CaseStudyCard({
    super.key,
    required this.caseStudy,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              RippAIColors.deepNavy.withValues(alpha: 0.8),
              RippAIColors.darkIndigo.withValues(alpha: 0.9),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: RippAIColors.electricCyan.withValues(alpha: 0.3),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: RippAIColors.electricCyan.withValues(alpha: 0.1),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      RippAIColors.electricCyan.withValues(alpha: 0.3),
                      RippAIColors.matteGold.withValues(alpha: 0.2),
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    // Background pattern
                    Positioned.fill(
                      child: CustomPaint(
                        painter: _CircuitPatternPainter(),
                      ),
                    ),
                    
                    // Content overlay
                    Positioned(
                      top: 16,
                      left: 16,
                      right: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: RippAIColors.matteGold.withValues(alpha: 0.9),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              caseStudy.industry,
                              style: const TextStyle(
                                color: RippAIColors.deepNavy,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // Results highlight
                    Positioned(
                      bottom: 16,
                      right: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: RippAIColors.electricCyan.withValues(alpha: 0.9),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${caseStudy.projectDuration.inDays} days',
                          style: const TextStyle(
                            color: RippAIColors.deepNavy,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Content Section
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Client
                  Text(
                    caseStudy.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: RippAIColors.electricCyan,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    caseStudy.client,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: RippAIColors.matteGold,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Challenge preview
                  Text(
                    'Challenge',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: RippAIColors.pureWhite.withValues(alpha: 0.9),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    caseStudy.challenge,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: RippAIColors.pureWhite.withValues(alpha: 0.8),
                      height: 1.4,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Key Results (top 3)
                  Text(
                    'Key Results',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: RippAIColors.matteGold,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  
                  ...caseStudy.results.entries.take(3).map((entry) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            entry.key,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: RippAIColors.pureWhite.withValues(alpha: 0.9),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          entry.value,
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: RippAIColors.electricCyan,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )),
                  
                  if (caseStudy.results.length > 3) ...[
                    const SizedBox(height: 8),
                    Text(
                      '+${caseStudy.results.length - 3} more results',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: RippAIColors.matteGold,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                  
                  const SizedBox(height: 20),
                  
                  // Tags
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: caseStudy.tags.take(3).map((tag) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: RippAIColors.electricCyan.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: RippAIColors.electricCyan.withValues(alpha: 0.5),
                        ),
                      ),
                      child: Text(
                        tag,
                        style: const TextStyle(
                          color: RippAIColors.electricCyan,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )).toList(),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Read More Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tap to read full case study',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: RippAIColors.pureWhite.withValues(alpha: 0.6),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: RippAIColors.electricCyan.withValues(alpha: 0.7),
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CircuitPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = RippAIColors.electricCyan.withValues(alpha: 0.1)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    // Draw circuit-like pattern
    final path = Path();
    
    // Horizontal lines
    for (int i = 0; i < 8; i++) {
      final y = (size.height / 8) * i;
      path.moveTo(0, y);
      path.lineTo(size.width, y);
    }
    
    // Vertical lines
    for (int i = 0; i < 6; i++) {
      final x = (size.width / 6) * i;
      path.moveTo(x, 0);
      path.lineTo(x, size.height);
    }
    
    // Circuit nodes
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 4; j++) {
        final x = (size.width / 4) * (j + 0.5);
        final y = (size.height / 4) * (i + 0.5);
        path.addOval(Rect.fromCircle(center: Offset(x, y), radius: 2));
      }
    }
    
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}