import 'package:flutter/material.dart';
import 'package:ripplai/theme.dart';
import 'package:ripplai/models/service.dart';

class ServiceCard extends StatelessWidget {
  final Service service;
  final VoidCallback onTap;

  const ServiceCard({
    super.key,
    required this.service,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(20),
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
            // Header Row
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: RippAIColors.electricCyan.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    service.icon,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        service.name,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: RippAIColors.electricCyan,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        service.category,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: RippAIColors.matteGold,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: RippAIColors.electricCyan.withValues(alpha: 0.7),
                  size: 16,
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Description
            Text(
              service.description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: RippAIColors.pureWhite.withValues(alpha: 0.9),
                height: 1.4,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            
            const SizedBox(height: 16),
            
            // Features Preview (first 3)
            ...service.features.take(3).map((feature) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                children: [
                  Container(
                    width: 4,
                    height: 4,
                    decoration: const BoxDecoration(
                      color: RippAIColors.electricCyan,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      feature,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: RippAIColors.pureWhite.withValues(alpha: 0.8),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            )),
            
            if (service.features.length > 3) ...[
              const SizedBox(height: 8),
              Text(
                '+${service.features.length - 3} more features',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: RippAIColors.matteGold,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
            
            const SizedBox(height: 16),
            
            // Bottom Row
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: RippAIColors.matteGold.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: RippAIColors.matteGold.withValues(alpha: 0.5),
                    ),
                  ),
                  child: Text(
                    'Learn More',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: RippAIColors.matteGold,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  'Tap to explore',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: RippAIColors.pureWhite.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}