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
    final bodyHeight = size.height * 0.85;
    final bodyWidth = size.width * 0.4;

    // Paint for the human silhouette
    final bodyPaint = Paint()
      ..color = isSelected ? Colors.white : Colors.grey[400]!
      ..style = PaintingStyle.fill;

    final outlinePaint = Paint()
      ..color = isSelected ? Colors.white : Colors.grey[600]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Draw meditating human silhouette
    _drawMeditatingHuman(canvas, center, bodyWidth, bodyHeight, bodyPaint, outlinePaint);

    // Draw chakras based on activeChakraCount
    _drawChakras(canvas, center, bodyHeight);
  }

  void _drawMeditatingHuman(Canvas canvas, Offset center, double bodyWidth, double bodyHeight, Paint bodyPaint, Paint outlinePaint) {
    // Head
    final headRadius = bodyWidth * 0.3;
    final headCenter = Offset(center.dx, center.dy - bodyHeight * 0.35);
    canvas.drawCircle(headCenter, headRadius, bodyPaint);
    canvas.drawCircle(headCenter, headRadius, outlinePaint);

    // Body (torso)
    final bodyRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(center.dx, center.dy),
        width: bodyWidth,
        height: bodyHeight * 0.5,
      ),
      Radius.circular(bodyWidth * 0.2),
    );
    canvas.drawRRect(bodyRect, bodyPaint);
    canvas.drawRRect(bodyRect, outlinePaint);

    // Legs (sitting cross-legged)
    final legPath = Path();
    final legY = center.dy + bodyHeight * 0.2;
    
    // Left leg
    legPath.moveTo(center.dx - bodyWidth * 0.1, legY);
    legPath.quadraticBezierTo(
      center.dx - bodyWidth * 0.6, legY + bodyHeight * 0.1,
      center.dx - bodyWidth * 0.4, legY + bodyHeight * 0.25,
    );
    
    // Right leg
    legPath.moveTo(center.dx + bodyWidth * 0.1, legY);
    legPath.quadraticBezierTo(
      center.dx + bodyWidth * 0.6, legY + bodyHeight * 0.1,
      center.dx + bodyWidth * 0.4, legY + bodyHeight * 0.25,
    );
    
    final legPaint = Paint()
      ..color = isSelected ? Colors.white : Colors.grey[400]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = bodyWidth * 0.15
      ..strokeCap = StrokeCap.round;
    
    canvas.drawPath(legPath, legPaint);

    // Arms in meditation pose
    final armPaint = Paint()
      ..color = isSelected ? Colors.white : Colors.grey[400]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = bodyWidth * 0.12
      ..strokeCap = StrokeCap.round;

    // Left arm
    canvas.drawLine(
      Offset(center.dx - bodyWidth * 0.15, center.dy - bodyHeight * 0.1),
      Offset(center.dx - bodyWidth * 0.4, center.dy + bodyHeight * 0.05),
      armPaint,
    );

    // Right arm
    canvas.drawLine(
      Offset(center.dx + bodyWidth * 0.15, center.dy - bodyHeight * 0.1),
      Offset(center.dx + bodyWidth * 0.4, center.dy + bodyHeight * 0.05),
      armPaint,
    );
  }

  void _drawChakras(Canvas canvas, Offset center, double bodyHeight) {
    // Chakra positions from top to bottom
    final chakraPositions = [
      Offset(center.dx, center.dy - bodyHeight * 0.35), // Crown - Sahasrara
      Offset(center.dx, center.dy - bodyHeight * 0.28), // Third Eye - Ajna
      Offset(center.dx, center.dy - bodyHeight * 0.15), // Throat - Vishuddha
      Offset(center.dx, center.dy - bodyHeight * 0.05), // Heart - Anahata
      Offset(center.dx, center.dy + bodyHeight * 0.08), // Solar Plexus - Manipura
      Offset(center.dx, center.dy + bodyHeight * 0.18), // Sacral - Swadhisthana
      Offset(center.dx, center.dy + bodyHeight * 0.28), // Root - Muladhara
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

    for (int i = 0; i < 7; i++) {
      if (i < activeChakraCount) {
        // Active chakra - glowing effect
        final glowPaint = Paint()
          ..color = chakraColors[i].withOpacity(0.4)
          ..style = PaintingStyle.fill;
        
        final chakraPaint = Paint()
          ..color = chakraColors[i]
          ..style = PaintingStyle.fill;

        // Glow effect
        canvas.drawCircle(chakraPositions[i], 8, glowPaint);
        canvas.drawCircle(chakraPositions[i], 6, chakraPaint);

        // Inner light
        final innerPaint = Paint()
          ..color = Colors.white.withOpacity(0.8)
          ..style = PaintingStyle.fill;
        canvas.drawCircle(chakraPositions[i], 2, innerPaint);
      } else {
        // Inactive chakra - dim
        final dimPaint = Paint()
          ..color = Colors.grey[400]!.withOpacity(0.3)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1;
        canvas.drawCircle(chakraPositions[i], 4, dimPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant MeditatingHumanPainter oldDelegate) {
    return oldDelegate.activeChakraCount != activeChakraCount ||
           oldDelegate.isSelected != isSelected;
  }
}