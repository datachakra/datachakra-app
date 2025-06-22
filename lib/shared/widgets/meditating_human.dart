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

    // Draw clean outline meditation figure
    _drawOutlineMeditator(canvas, center, size);

    // Draw small chakra dots
    _drawChakraDots(canvas, center, size);
  }

  void _drawOutlineMeditator(Canvas canvas, Offset center, Size size) {
    final strokeWidth = size.width * 0.04;
    
    // Paint for clean outlines
    final outlinePaint = Paint()
      ..color = isSelected 
          ? const Color(0xFF4A5568) 
          : const Color(0xFF9CA3AF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    // Head - clean circle
    final headRadius = size.width * 0.15;
    final headCenter = Offset(center.dx, center.dy - size.height * 0.25);
    canvas.drawCircle(headCenter, headRadius, outlinePaint);

    // Torso - simple vertical line with slight curve
    final torsoTop = Offset(center.dx, headCenter.dy + headRadius);
    final torsoBottom = Offset(center.dx, center.dy + size.height * 0.05);
    canvas.drawLine(torsoTop, torsoBottom, outlinePaint);

    // Arms in meditation pose - clean curved lines
    final shoulderY = center.dy - size.height * 0.1;
    final armLength = size.width * 0.25;
    
    // Left arm
    final leftShoulder = Offset(center.dx - size.width * 0.08, shoulderY);
    final leftElbow = Offset(center.dx - armLength, shoulderY + size.height * 0.08);
    final leftHand = Offset(center.dx - size.width * 0.1, center.dy);
    
    final leftArmPath = Path();
    leftArmPath.moveTo(leftShoulder.dx, leftShoulder.dy);
    leftArmPath.quadraticBezierTo(leftElbow.dx, leftElbow.dy, leftHand.dx, leftHand.dy);
    canvas.drawPath(leftArmPath, outlinePaint);

    // Right arm
    final rightShoulder = Offset(center.dx + size.width * 0.08, shoulderY);
    final rightElbow = Offset(center.dx + armLength, shoulderY + size.height * 0.08);
    final rightHand = Offset(center.dx + size.width * 0.1, center.dy);
    
    final rightArmPath = Path();
    rightArmPath.moveTo(rightShoulder.dx, rightShoulder.dy);
    rightArmPath.quadraticBezierTo(rightElbow.dx, rightElbow.dy, rightHand.dx, rightHand.dy);
    canvas.drawPath(rightArmPath, outlinePaint);

    // Legs in cross-legged position - clean curved lines
    final hipY = center.dy + size.height * 0.05;
    final legLength = size.width * 0.28;
    
    // Left leg
    final leftHip = Offset(center.dx - size.width * 0.05, hipY);
    final leftKnee = Offset(center.dx - legLength, hipY + size.height * 0.1);
    final leftFoot = Offset(center.dx + size.width * 0.15, hipY + size.height * 0.2);
    
    final leftLegPath = Path();
    leftLegPath.moveTo(leftHip.dx, leftHip.dy);
    leftLegPath.quadraticBezierTo(leftKnee.dx, leftKnee.dy, leftFoot.dx, leftFoot.dy);
    canvas.drawPath(leftLegPath, outlinePaint);

    // Right leg
    final rightHip = Offset(center.dx + size.width * 0.05, hipY);
    final rightKnee = Offset(center.dx + legLength, hipY + size.height * 0.1);
    final rightFoot = Offset(center.dx - size.width * 0.15, hipY + size.height * 0.2);
    
    final rightLegPath = Path();
    rightLegPath.moveTo(rightHip.dx, rightHip.dy);
    rightLegPath.quadraticBezierTo(rightKnee.dx, rightKnee.dy, rightFoot.dx, rightFoot.dy);
    canvas.drawPath(rightLegPath, outlinePaint);
  }

  void _drawChakraDots(Canvas canvas, Offset center, Size size) {
    // Small chakra positions along the body centerline
    final chakraPositions = [
      Offset(center.dx, center.dy - size.height * 0.23), // Crown - top of head
      Offset(center.dx, center.dy - size.height * 0.18), // Third Eye - forehead
      Offset(center.dx, center.dy - size.height * 0.12), // Throat
      Offset(center.dx, center.dy - size.height * 0.05), // Heart
      Offset(center.dx, center.dy + size.height * 0.02), // Solar Plexus
      Offset(center.dx, center.dy + size.height * 0.08), // Sacral
      Offset(center.dx, center.dy + size.height * 0.14), // Root
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

    // Small dots
    final dotRadius = size.width * 0.035; // Small dots
    
    for (int i = 0; i < 7; i++) {
      if (i < activeChakraCount) {
        // Active chakra - small bright dot
        final chakraPaint = Paint()
          ..color = chakraColors[i]
          ..style = PaintingStyle.fill;

        canvas.drawCircle(chakraPositions[i], dotRadius, chakraPaint);

        // Tiny inner light
        final innerPaint = Paint()
          ..color = Colors.white.withOpacity(0.8)
          ..style = PaintingStyle.fill;
        canvas.drawCircle(chakraPositions[i], dotRadius * 0.4, innerPaint);
      } else {
        // Inactive chakra - very subtle outline
        final dimPaint = Paint()
          ..color = Colors.grey[400]!.withOpacity(0.3)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 0.5;
        canvas.drawCircle(chakraPositions[i], dotRadius * 0.7, dimPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant MeditatingHumanPainter oldDelegate) {
    return oldDelegate.activeChakraCount != activeChakraCount ||
           oldDelegate.isSelected != isSelected;
  }
}