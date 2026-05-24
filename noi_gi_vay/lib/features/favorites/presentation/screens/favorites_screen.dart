import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/router/route_constants.dart';
import '../../../slang/presentation/providers/slang_providers.dart';
import '../../../favorites/presentation/providers/favorites_providers.dart';
import '../../../slang/presentation/widgets/trend_badge.dart';

/// FavoritesScreen — danh sách slang đã lưu
class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncFavIds = ref.watch(favoritesNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          color: AppColors.textPrimary,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('❤️ Yêu thích', style: AppTextStyles.headlineMedium),
        actions: [
          // Nút clear all nếu có favorites
          asyncFavIds.maybeWhen(
            data: (ids) => ids.isNotEmpty
                ? TextButton(
                    onPressed: () => _confirmClear(context, ref),
                    child: Text(
                      'Xóa hết',
                      style: AppTextStyles.labelMedium.copyWith(
                        color: AppColors.error.withValues(alpha: 0.8),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            orElse: () => const SizedBox.shrink(),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: asyncFavIds.when(
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.accentPurple),
        ),
        error: (_, __) => Center(
          child: Text('Lỗi tải danh sách', style: AppTextStyles.bodyMedium),
        ),
        data: (ids) {
          if (ids.isEmpty) return _EmptyFavorites();
          return _FavoritesList(favIds: ids.toList());
        },
      ),
    );
  }

  void _confirmClear(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surfaceElevated,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('Xóa tất cả?', style: AppTextStyles.headlineMedium),
        content: Text(
          'Toàn bộ slang yêu thích sẽ bị xóa. Không thể hoàn tác.',
          style: AppTextStyles.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(
              'Hủy',
              style: AppTextStyles.labelLarge.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              ref.read(favoritesNotifierProvider.notifier).clear();
              Navigator.pop(ctx);
            },
            child: Text(
              'Xóa hết',
              style: AppTextStyles.labelLarge.copyWith(
                color: AppColors.error,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Empty State
// ---------------------------------------------------------------------------

class _EmptyFavorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('💔', style: TextStyle(fontSize: 64)),
          const SizedBox(height: 16),
          Text('Chưa có slang yêu thích', style: AppTextStyles.bodyMedium),
          const SizedBox(height: 8),
          Text(
            'Nhấn ❤️ ở bất kỳ slang nào để lưu lại!',
            style: AppTextStyles.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Danh sách favorites — load từng slang theo ID
// ---------------------------------------------------------------------------

class _FavoritesList extends ConsumerWidget {
  const _FavoritesList({required this.favIds});

  final List<String> favIds;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8, bottom: 100),
      itemCount: favIds.length,
      itemBuilder: (ctx, i) {
        final id = favIds[i];
        return _FavoriteItem(slangId: id);
      },
    );
  }
}

class _FavoriteItem extends ConsumerWidget {
  const _FavoriteItem({required this.slangId});

  final String slangId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncSlang = ref.watch(slangDetailProvider(slangId));

    return asyncSlang.when(
      loading: () => _SkeletonItem(),
      error: (_, __) => const SizedBox.shrink(),
      data: (slang) {
        if (slang == null) return const SizedBox.shrink();

        return Dismissible(
          key: Key(slangId),
          direction: DismissDirection.endToStart,
          background: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 24),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.error.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(Icons.delete_outline_rounded,
                color: AppColors.error, size: 28),
          ),
          onDismissed: (_) {
            ref.read(favoritesNotifierProvider.notifier).toggle(slangId);
          },
          child: GestureDetector(
            onTap: () => context.push(RouteConstants.detailPath(slangId)),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.cardBorder, width: 1),
              ),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                title: Text(
                  slang.phrase,
                  style: AppTextStyles.headlineMedium.copyWith(fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    slang.meaning,
                    style: AppTextStyles.bodySmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                trailing: TrendBadge(
                  trendLevel: slang.trendLevel,
                  compact: true,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SkeletonItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
