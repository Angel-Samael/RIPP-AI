import 'package:flutter/material.dart';
import 'package:ripplai/theme.dart';

class NeonButton extends StatefulWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onPressed;
  final bool isSecondary;

  const NeonButton({
    super.key,
    required this.text,
    this.icon,
    required this.onPressed,
    this.isSecondary = false,
  });

  @override
  State<NeonButton> createState() => _NeonButtonState();
}

class _NeonButtonState extends State<NeonButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _glowAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _glowAnimation = Tween<double>(
      begin: 0.3,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedBuilder(
        animation: _glowAnimation,
        builder: (context, child) {
          return AnimatedScale(
            scale: _isPressed ? 0.95 : 1.0,
            duration: const Duration(milliseconds: 100),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: widget.isSecondary
                        ? RippAIColors.matteGold.withValues(alpha: _glowAnimation.value * 0.6)
                        : RippAIColors.electricCyan.withValues(alpha: _glowAnimation.value * 0.8),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: ElevatedButton.icon(
                onPressed: widget.onPressed,
                icon: widget.icon != null
                    ? Icon(
                        widget.icon,
                        color: widget.isSecondary ? RippAIColors.deepNavy : RippAIColors.pureWhite,
                      )
                    : null,
                label: Text(
                  widget.text,
                  style: TextStyle(
                    color: widget.isSecondary ? RippAIColors.deepNavy : RippAIColors.pureWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.isSecondary
                      ? RippAIColors.matteGold
                      : RippAIColors.electricCyan,
                  foregroundColor: widget.isSecondary
                      ? RippAIColors.deepNavy
                      : RippAIColors.pureWhite,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: widget.isSecondary
                          ? RippAIColors.matteGold
                          : RippAIColors.electricCyan,
                      width: 2,
                    ),
                  ),
                  elevation: 0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}