import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/router/route_constants.dart';
import '../../domain/entities/slang_entity.dart';
import 'trend_badge.dart';
import 'tag_chip.dart';

/// Card hiển thị một slang entry trong danh sách
/// Dùng ở HomeScreen (trending, mới thêm) và SearchScreen
class SlangCard extends ConsumerWidget {
  const SlangCard({
    super.key,
    required this.slang,
    this.showTags = true,
  });

  final SlangEntity slang;

  /// Hiện tags hay không — ẩn trong list nhỏ để tiết kiệm space
  final bool showTags;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => context.push(RouteConstants.detailPath(slang.id)),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.cardBorder, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => context.push(RouteConstants.detailPath(slang.id)),
            borderRadius: BorderRadius.circular(16),
            splashColor: AppColors.accentPurple.withValues(alpha: 0.08),
            highlightColor: AppColors.accentPurple.withValues(alpha: 0.04),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header: phrase + trend badge
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          slang.phrase,
                          style: AppTextStyles.headlineMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      TrendBadge(trendLevel: slang.trendLevel),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Meaning — rút gọn 2 dòng
                  Text(
                    slang.meaning,
                    style: AppTextStyles.bodyMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  // Origin
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 13,
                        color: AppColors.textMuted,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          slang.origin,
                          style: AppTextStyles.bodySmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),


                  // Tags
                  if (showTags && slang.tags.isNotEmpty) ...[
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 6,
                      runSpacing: 4,
                      children: slang.tags
                          .take(3)
                          .map((tag) => TagChip(tag: tag))
                          .toList(),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Card ngang nhỏ hơn cho horizontal scroll list (trending)
class SlangCardCompact extends ConsumerWidget {
  const SlangCardCompact({
    super.key,
    required this.slang,
  });

  final SlangEntity slang;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => context.push(RouteConstants.detailPath(slang.id)),
      child: Container(
        width: 220,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.cardBorder, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => context.push(RouteConstants.detailPath(slang.id)),
            borderRadius: BorderRadius.circular(16),
            splashColor: AppColors.accentPurple.withValues(alpha: 0.08),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TrendBadge(trendLevel: slang.trendLevel, compact: false),
                  const SizedBox(height: 10),
                  Text(
                    slang.phrase,
                    style: AppTextStyles.headlineMedium.copyWith(fontSize: 16),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    slang.meaning,
                    style: AppTextStyles.bodySmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
