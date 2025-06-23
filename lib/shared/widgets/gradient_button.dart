import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final LinearGradient? gradient;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final bool isOutlined;
  final TextStyle? textStyle;
  final bool isLoading;

  const GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.gradient,
    this.padding,
    this.borderRadius,
    this.isOutlined = false,
    this.textStyle,
    this.isLoading = false,
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
    final isDisabled = onPressed == null || isLoading;

    if (isOutlined) {
      return Opacity(
        opacity: isDisabled ? 0.6 : 1.0,
        child: Container(
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
                onTap: isDisabled ? null : onPressed,
                borderRadius: BorderRadius.circular(effectiveBorderRadius - 2),
                child: Container(
                  padding: effectivePadding,
                  child: Center(
                    child: isLoading
                        ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                effectiveGradient.colors.first,
                              ),
                            ),
                          )
                        : ShaderMask(
                            shaderCallback: (bounds) => effectiveGradient.createShader(bounds),
                            child: Text(
                              text,
                              style: textStyle?.copyWith(color: Colors.white) ??
                                  const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Opacity(
      opacity: isDisabled ? 0.6 : 1.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(effectiveBorderRadius),
          gradient: effectiveGradient,
          boxShadow: isDisabled ? [] : [
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
            onTap: isDisabled ? null : onPressed,
            borderRadius: BorderRadius.circular(effectiveBorderRadius),
            child: Container(
              padding: effectivePadding,
              child: Center(
                child: isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : Text(
                        text,
                        style: textStyle ??
                            const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                        textAlign: TextAlign.center,
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}