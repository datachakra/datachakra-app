import 'dart:math' as math;
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
        painter: ChakraHelixPainter(
          activeChakraCount: activeChakraCount,
          isSelected: isSelected,
        ),
      ),
    );
  }
}

class ChakraHelixPainter extends CustomPainter {
  final int activeChakraCount;
  final bool isSelected;

  ChakraHelixPainter({
    required this.activeChakraCount,
    required this.isSelected,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    // Draw DNA helix structure with chakra progression
    _drawHelixStructure(canvas, center, size);

    // Draw chakra nodes on the helix
    _drawChakraNodes(canvas, center, size);
  }

  void _drawHelixStructure(Canvas canvas, Offset center, Size size) {
    final helixHeight = size.height * 0.8;
    final helixWidth = size.width * 0.4;
    
    // Paint for helix strands
    final helixPaint = Paint()
      ..color = isSelected 
          ? const Color(0xFF667EEA).withOpacity(0.6)
          : const Color(0xFF9CA3AF).withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.025
      ..strokeCap = StrokeCap.round;

    // Draw left helix strand
    final leftHelixPath = Path();
    final rightHelixPath = Path();
    
    final numPoints = 50;
    for (int i = 0; i <= numPoints; i++) {
      final t = i / numPoints;
      final y = center.dy - helixHeight / 2 + t * helixHeight;
      final angle = t * 4 * 3.14159; // 2 full turns
      
      final leftX = center.dx + helixWidth * 0.5 * math.cos(angle);
      final rightX = center.dx + helixWidth * 0.5 * math.cos(angle + 3.14159);
      
      if (i == 0) {
        leftHelixPath.moveTo(leftX, y);
        rightHelixPath.moveTo(rightX, y);
      } else {
        leftHelixPath.lineTo(leftX, y);
        rightHelixPath.lineTo(rightX, y);
      }
    }
    
    canvas.drawPath(leftHelixPath, helixPaint);
    canvas.drawPath(rightHelixPath, helixPaint);

    // Draw connecting bridges (base pairs)
    final bridgePaint = Paint()
      ..color = isSelected 
          ? const Color(0xFF667EEA).withOpacity(0.3)
          : const Color(0xFF9CA3AF).withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.015
      ..strokeCap = StrokeCap.round;

    // Draw 7 bridge connections where chakras will be
    for (int i = 0; i < 7; i++) {
      final t = (i + 0.5) / 7;
      final y = center.dy - helixHeight / 2 + t * helixHeight;
      final angle = t * 4 * 3.14159;
      
      final leftX = center.dx + helixWidth * 0.5 * math.cos(angle);
      final rightX = center.dx + helixWidth * 0.5 * math.cos(angle + 3.14159);
      
      canvas.drawLine(Offset(leftX, y), Offset(rightX, y), bridgePaint);
    }
  }

  void _drawChakraNodes(Canvas canvas, Offset center, Size size) {
    final helixHeight = size.height * 0.8;
    final helixWidth = size.width * 0.4;
    
    final chakraColors = [
      Color(AppConstants.chakrasData[0]['color']), // Root
      Color(AppConstants.chakrasData[1]['color']), // Sacral
      Color(AppConstants.chakrasData[2]['color']), // Solar Plexus
      Color(AppConstants.chakrasData[3]['color']), // Heart
      Color(AppConstants.chakrasData[4]['color']), // Throat
      Color(AppConstants.chakrasData[5]['color']), // Third Eye
      Color(AppConstants.chakrasData[6]['color']), // Crown
    ];

    final nodeRadius = size.width * 0.06;
    
    // Draw chakra nodes from bottom to top (Root to Crown)
    for (int i = 0; i < 7; i++) {
      final t = (i + 0.5) / 7;
      final y = center.dy + helixHeight / 2 - t * helixHeight; // Bottom to top
      final angle = t * 4 * 3.14159;
      
      // Position nodes at the center of the helix bridges
      final nodeX = center.dx;
      final nodePosition = Offset(nodeX, y);
      
      if (i < activeChakraCount) {
        // Active chakra - bright glowing node
        final glowPaint = Paint()
          ..color = chakraColors[i].withOpacity(0.4)
          ..style = PaintingStyle.fill;
        
        final chakraPaint = Paint()
          ..color = chakraColors[i]
          ..style = PaintingStyle.fill;

        // Glow effect
        canvas.drawCircle(nodePosition, nodeRadius + 2, glowPaint);
        canvas.drawCircle(nodePosition, nodeRadius, chakraPaint);

        // Inner light
        final innerPaint = Paint()
          ..color = Colors.white.withOpacity(0.9)
          ..style = PaintingStyle.fill;
        canvas.drawCircle(nodePosition, nodeRadius * 0.4, innerPaint);

        // Pulse effect for selected
        if (isSelected) {
          final pulsePaint = Paint()
            ..color = chakraColors[i].withOpacity(0.2)
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2;
          canvas.drawCircle(nodePosition, nodeRadius + 4, pulsePaint);
        }
      } else {
        // Inactive chakra - dim node
        final dimPaint = Paint()
          ..color = Colors.grey[400]!.withOpacity(0.3)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1;
        canvas.drawCircle(nodePosition, nodeRadius * 0.6, dimPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant ChakraHelixPainter oldDelegate) {
    return oldDelegate.activeChakraCount != activeChakraCount ||
           oldDelegate.isSelected != isSelected;
  }
}