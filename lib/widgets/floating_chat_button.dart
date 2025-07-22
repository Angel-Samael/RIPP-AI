import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ripplai/theme.dart';

class FloatingChatButton extends StatefulWidget {
  const FloatingChatButton({super.key});

  @override
  State<FloatingChatButton> createState() => _FloatingChatButtonState();
}

class _FloatingChatButtonState extends State<FloatingChatButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));
    _pulseController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Expanded chat interface
        if (_isExpanded)
          Container(
            width: 300,
            height: 400,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              gradient: RippAIColors.primaryGradient,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: RippAIColors.electricCyan.withValues(alpha: 0.5),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: RippAIColors.electricCyan.withValues(alpha: 0.3),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              children: [
                // Chat header
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    gradient: LinearGradient(
                      colors: [
                        RippAIColors.electricCyan,
                        Color(0xFF40C4FF),
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: const BoxDecoration(
                          color: RippAIColors.pureWhite,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.smart_toy,
                          color: RippAIColors.deepNavy,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'RIPP AI Assistant',
                              style: TextStyle(
                                color: RippAIColors.pureWhite,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Online • Ready to help',
                              style: TextStyle(
                                color: RippAIColors.pureWhite.withValues(alpha: 0.8),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () => setState(() => _isExpanded = false),
                        icon: const Icon(Icons.close, color: RippAIColors.pureWhite),
                        iconSize: 20,
                      ),
                    ],
                  ),
                ),
                
                // Chat content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        _buildChatMessage(
                          'Hello! 👋 I\'m your AI assistant. How can I help you scale your business with AI today?',
                          isBot: true,
                        ),
                        const SizedBox(height: 12),
                        _buildQuickActions(),
                      ],
                    ),
                  ),
                ),
                
                // Chat input
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Ask me anything...',
                            hintStyle: TextStyle(
                              color: RippAIColors.pureWhite.withValues(alpha: 0.6),
                            ),
                            filled: true,
                            fillColor: RippAIColors.deepNavy.withValues(alpha: 0.8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                          style: const TextStyle(color: RippAIColors.pureWhite),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: RippAIColors.electricCyan,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.send,
                          color: RippAIColors.deepNavy,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ).animate()
            .scale(begin: const Offset(0.8, 0.8), duration: 300.ms, curve: Curves.easeOut)
            .fadeIn(),
        
        // Chat button
        AnimatedBuilder(
          animation: _pulseAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _pulseAnimation.value,
              child: GestureDetector(
                onTap: () => setState(() => _isExpanded = !_isExpanded),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: RippAIColors.accentGradient,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: RippAIColors.electricCyan.withValues(alpha: 0.4),
                        blurRadius: 15,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.chat_bubble_outline,
                    color: RippAIColors.pureWhite,
                    size: 28,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildChatMessage(String message, {required bool isBot}) {
    return Align(
      alignment: isBot ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 240),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isBot 
              ? RippAIColors.deepNavy.withValues(alpha: 0.8)
              : RippAIColors.electricCyan.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isBot ? RippAIColors.pureWhite : RippAIColors.deepNavy,
            fontSize: 14,
            height: 1.4,
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    return Column(
      children: [
        const Text(
          'Quick actions:',
          style: TextStyle(
            color: RippAIColors.electricCyan,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _buildActionChip('📈 Grow Revenue'),
            _buildActionChip('🤖 AI Automation'),
            _buildActionChip('💬 Get Quote'),
            _buildActionChip('📞 Book Call'),
          ],
        ),
      ],
    );
  }

  Widget _buildActionChip(String label) {
    return InkWell(
      onTap: () {
        // Handle quick action
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: RippAIColors.electricCyan.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: RippAIColors.electricCyan.withValues(alpha: 0.5),
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: RippAIColors.electricCyan,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}