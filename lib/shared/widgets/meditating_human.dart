import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';

class MeditatingHuman extends StatelessWidget {
  final int activeChakraCount;
  final bool isSelected;
  final double size;

  const MeditatingHuman({
    super.key,
    required this.activeChakraCount,
    this.isSelected = false,
    this.size = 60,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: MeditatingHumanPainter(
          activeChakraCount: activeChakraCount,
          isSelected: isSelected,
        ),
      ),
    );
  }
}

class MeditatingHumanPainter extends CustomPainter {
  final int activeChakraCount;
  final bool isSelected;

  MeditatingHumanPainter({
    required this.activeChakraCount,
    required this.isSelected,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    // Draw triangle-shaped meditating human in Padmasana
    _drawTriangleMeditator(canvas, center, size);

    // Draw small chakra dots
    _drawChakraDots(canvas, center, size);
  }

  void _drawTriangleMeditator(Canvas canvas, Offset center, Size size) {
    final baseWidth = size.width * 0.7;
    final height = size.height * 0.85;
    
    // Create triangle path for the meditating figure
    final figurePath = Path();
    
    // Head (small circle at top)
    final headRadius = size.width * 0.12;
    final headCenter = Offset(center.dx, center.dy - height * 0.35);
    
    // Triangle body starting from below head
    final triangleTop = Offset(center.dx, center.dy - height * 0.2);
    final triangleLeft = Offset(center.dx - baseWidth * 0.35, center.dy + height * 0.25);
    final triangleRight = Offset(center.dx + baseWidth * 0.35, center.dy + height * 0.25);
    
    // Create smooth triangle path
    figurePath.moveTo(triangleTop.dx, triangleTop.dy);
    figurePath.quadraticBezierTo(
      center.dx - baseWidth * 0.2, center.dy - height * 0.05,
      triangleLeft.dx, triangleLeft.dy,
    );
    figurePath.quadraticBezierTo(
      center.dx, center.dy + height * 0.35,
      triangleRight.dx, triangleRight.dy,
    );
    figurePath.quadraticBezierTo(
      center.dx + baseWidth * 0.2, center.dy - height * 0.05,
      triangleTop.dx, triangleTop.dy,
    );
    figurePath.close();

    // Paint for the figure
    final figurePaint = Paint()
      ..color = isSelected ? const Color(0xFF4A5568) : const Color(0xFF718096)
      ..style = PaintingStyle.fill;

    final outlinePaint = Paint()
      ..color = isSelected ? const Color(0xFF2D3748) : const Color(0xFF4A5568)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    // Draw head
    canvas.drawCircle(headCenter, headRadius, figurePaint);
    canvas.drawCircle(headCenter, headRadius, outlinePaint);

    // Draw triangle body
    canvas.drawPath(figurePath, figurePaint);
    canvas.drawPath(figurePath, outlinePaint);

    // Add small hands in prayer position
    final handsCenter = Offset(center.dx, center.dy - height * 0.08);
    final handsPaint = Paint()
      ..color = isSelected ? const Color(0xFF4A5568) : const Color(0xFF718096)
      ..style = PaintingStyle.fill;
    
    // Small oval for hands
    canvas.drawOval(
      Rect.fromCenter(
        center: handsCenter,
        width: size.width * 0.15,
        height: size.width * 0.08,
      ),
      handsPaint,
    );
  }

  void _drawChakraDots(Canvas canvas, Offset center, Size size) {
    final height = size.height * 0.85;
    
    // Much smaller chakra positions along the body centerline
    final chakraPositions = [
      Offset(center.dx, center.dy - height * 0.32), // Crown - top of head
      Offset(center.dx, center.dy - height * 0.25), // Third Eye - forehead
      Offset(center.dx, center.dy - height * 0.15), // Throat
      Offset(center.dx, center.dy - height * 0.05), // Heart
      Offset(center.dx, center.dy + height * 0.05), // Solar Plexus
      Offset(center.dx, center.dy + height * 0.15), // Sacral
      Offset(center.dx, center.dy + height * 0.22), // Root
    ];

    final chakraColors = [
      Color(AppConstants.chakrasData[6]['color']), // Crown
      Color(AppConstants.chakrasData[5]['color']), // Third Eye
      Color(AppConstants.chakrasData[4]['color']), // Throat
      Color(AppConstants.chakrasData[3]['color']), // Heart
      Color(AppConstants.chakrasData[2]['color']), // Solar Plexus
      Color(AppConstants.chakrasData[1]['color']), // Sacral
      Color(AppConstants.chakrasData[0]['color']), // Root
    ];

    // Much smaller dots
    final dotRadius = size.width * 0.04; // Very small dots
    
    for (int i = 0; i < 7; i++) {
      if (i < activeChakraCount) {
        // Active chakra - small glowing dot
        final glowPaint = Paint()
          ..color = chakraColors[i].withOpacity(0.6)
          ..style = PaintingStyle.fill;
        
        final chakraPaint = Paint()
          ..color = chakraColors[i]
          ..style = PaintingStyle.fill;

        // Small glow
        canvas.drawCircle(chakraPositions[i], dotRadius + 1, glowPaint);
        canvas.drawCircle(chakraPositions[i], dotRadius, chakraPaint);

        // Tiny inner light
        final innerPaint = Paint()
          ..color = Colors.white.withOpacity(0.9)
          ..style = PaintingStyle.fill;
        canvas.drawCircle(chakraPositions[i], dotRadius * 0.4, innerPaint);
      } else {
        // Inactive chakra - very dim small dot
        final dimPaint = Paint()
          ..color = Colors.grey[400]!.withOpacity(0.2)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 0.5;
        canvas.drawCircle(chakraPositions[i], dotRadius * 0.6, dimPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant MeditatingHumanPainter oldDelegate) {
    return oldDelegate.activeChakraCount != activeChakraCount ||
           oldDelegate.isSelected != isSelected;
  }
}