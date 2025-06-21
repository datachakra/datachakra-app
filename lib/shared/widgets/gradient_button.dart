import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final LinearGradient? gradient;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final bool isOutlined;
  final TextStyle? textStyle;

  const GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.gradient,
    this.padding,
    this.borderRadius,
    this.isOutlined = false,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveGradient = gradient ?? AppColors.primaryGradient;
    final effectivePadding = padding ??
        const EdgeInsets.symmetric(
          horizontal: AppConstants.spacingXl,
          vertical: AppConstants.spacingM,
        );
    final effectiveBorderRadius = borderRadius ?? AppConstants.radiusRound;

    if (isOutlined) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(effectiveBorderRadius),
          gradient: effectiveGradient,
        ),
        child: Container(
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(effectiveBorderRadius - 2),
            color: Colors.white,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onPressed,
              borderRadius: BorderRadius.circular(effectiveBorderRadius - 2),
              child: Container(
                padding: effectivePadding,
                child: ShaderMask(
                  shaderCallback: (bounds) => effectiveGradient.createShader(bounds),
                  child: Text(
                    text,
                    style: textStyle?.copyWith(color: Colors.white) ??
                        const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(effectiveBorderRadius),
        gradient: effectiveGradient,
        boxShadow: [
          BoxShadow(
            color: effectiveGradient.colors.first.withOpacity(0.3),
            offset: const Offset(0, 8),
            blurRadius: 24,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(effectiveBorderRadius),
          child: Container(
            padding: effectivePadding,
            child: Text(
              text,
              style: textStyle ??
                  const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}