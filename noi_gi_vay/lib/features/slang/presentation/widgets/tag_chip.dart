import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Chip nhỏ hiển thị tag vibe/tone của slang
/// Ví dụ: hài hước, châm biếm, khen, chê...
class TagChip extends StatelessWidget {
  const TagChip({
    super.key,
    required this.tag,
    this.onTap,
  });

  final String tag;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.accentPurple.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.accentPurple.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Text(
          '#$tag',
          style: AppTextStyles.labelSmall.copyWith(
            color: AppColors.accentPurpleLight,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
