import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/slang_entity.dart';

/// Badge hiển thị mức độ trend của slang
/// Màu + emoji khác nhau theo TrendLevel
class TrendBadge extends StatelessWidget {
  const TrendBadge({
    super.key,
    required this.trendLevel,
    this.compact = false,
  });

  final TrendLevel trendLevel;

  /// [compact] = true: chỉ hiện emoji, không có label
  final bool compact;

  Color get _bgColor {
    switch (trendLevel) {
      case TrendLevel.hot:
        return AppColors.trendHot.withValues(alpha: 0.15);
      case TrendLevel.rising:
        return AppColors.trendRising.withValues(alpha: 0.15);
      case TrendLevel.classic:
        return AppColors.trendClassic.withValues(alpha: 0.15);
    }
  }

  Color get _borderColor {
    switch (trendLevel) {
      case TrendLevel.hot:
        return AppColors.trendHot.withValues(alpha: 0.4);
      case TrendLevel.rising:
        return AppColors.trendRising.withValues(alpha: 0.4);
      case TrendLevel.classic:
        return AppColors.trendClassic.withValues(alpha: 0.4);
    }
  }

  Color get _textColor {
    switch (trendLevel) {
      case TrendLevel.hot:
        return AppColors.trendHot;
      case TrendLevel.rising:
        return AppColors.trendRising;
      case TrendLevel.classic:
        return AppColors.trendClassic;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 6 : 10,
        vertical: compact ? 3 : 5,
      ),
      decoration: BoxDecoration(
        color: _bgColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _borderColor, width: 1),
      ),
      child: compact
          ? Text(
              trendLevel.emoji,
              style: const TextStyle(fontSize: 14),
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 4,
              children: [
                Text(
                  trendLevel.emoji,
                  style: const TextStyle(fontSize: 12),
                ),
                Text(
                  trendLevel.label,
                  style: AppTextStyles.labelSmall.copyWith(
                    color: _textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
    );
  }
}
