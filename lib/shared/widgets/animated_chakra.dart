import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/app_colors.dart';

class AnimatedChakra extends StatefulWidget {
  final Color color;
  final double size;
  final bool isActive;
  final VoidCallback? onTap;

  const AnimatedChakra({
    super.key,
    required this.color,
    this.size = 80,
    this.isActive = false,
    this.onTap,
  });

  @override
  State<AnimatedChakra> createState() => _AnimatedChakraState();
}

class _AnimatedChakraState extends State<AnimatedChakra>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _glowController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _glowController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _pulseController.repeat();
    _glowController.repeat();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: Listenable.merge([_pulseController, _glowController]),
        builder: (context, child) {
          return Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: widget.color.withOpacity(0.3 + 0.2 * _glowController.value),
                  blurRadius: 20 + 10 * _glowController.value,
                  spreadRadius: 2 + 3 * _glowController.value,
                ),
              ],
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    widget.color.withOpacity(0.8),
                    widget.color.withOpacity(0.4),
                    widget.color.withOpacity(0.1),
                  ],
                ),
              ),
              child: Center(
                child: Container(
                  width: widget.size * 0.6,
                  height: widget.size * 0.6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.color,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(-2, -2),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    )
        .animate(
          onPlay: (controller) => controller.repeat(),
        )
        .scale(
          duration: 2000.ms,
          begin: const Offset(1.0, 1.0),
          end: const Offset(1.05, 1.05),
          curve: Curves.easeInOut,
        )
        .then()
        .scale(
          duration: 2000.ms,
          begin: const Offset(1.05, 1.05),
          end: const Offset(1.0, 1.0),
          curve: Curves.easeInOut,
        );
  }
}