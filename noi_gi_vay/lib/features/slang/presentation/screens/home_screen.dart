import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/router/route_constants.dart';
import '../../domain/entities/slang_entity.dart';
import '../providers/slang_providers.dart';
import '../widgets/slang_card.dart';
import '../widgets/trend_badge.dart';
import '../widgets/tag_chip.dart';

/// HomeScreen — màn hình chính
/// Layout: search bar → slang hôm nay → đang hot → mới thêm
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // App bar với gradient
          _buildAppBar(context),

          // Search bar gợi mời
          SliverToBoxAdapter(child: _SearchBar()),

          // Slang hôm nay
          SliverToBoxAdapter(child: _SlangOfDaySection()),

          // Đang hot — horizontal scroll
          SliverToBoxAdapter(child: _TrendingSection()),

          // Mới thêm — vertical list
          _buildSectionHeader('🆕 Mới thêm'),
          _RecentlyAddedList(),

          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
      bottomNavigationBar: _BottomNav(currentIndex: 0),
    );
  }

  SliverAppBar _buildAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.background,
      expandedHeight: 80,
      floating: true,
      snap: true,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        title: Row(
          children: [
            ShaderMask(
              shaderCallback: (bounds) =>
                  AppColors.accentGradient.createShader(bounds),
              child: Text(
                'Nói Gì Vậy? 🔍',
                style: AppTextStyles.headlineLarge.copyWith(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildSectionHeader(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
        child: Text(title, style: AppTextStyles.headlineMedium),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Search Bar
// ---------------------------------------------------------------------------

class _SearchBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
      child: GestureDetector(
        onTap: () => context.push(RouteConstants.search),
        child: Container(
          height: 52,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.cardBorder, width: 1),
          ),
          child: Row(
            children: [
              const SizedBox(width: 14),
              Icon(
                Icons.search_rounded,
                color: AppColors.textMuted,
                size: 22,
              ),
              const SizedBox(width: 10),
              Text(
                'Tìm slang, meme, cụm từ...',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Slang of the Day
// ---------------------------------------------------------------------------

class _SlangOfDaySection extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncSlang = ref.watch(slangOfDayProvider);

    return asyncSlang.when(
      loading: () => _SlangOfDaySkeleton(),
      error: (_, __) => const SizedBox.shrink(),
      data: (slang) {
        return GestureDetector(
          onTap: () => context.push(RouteConstants.detailPath(slang.id)),
          child: Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [
                  AppColors.accentPurple.withValues(alpha: 0.25),
                  AppColors.accentCyan.withValues(alpha: 0.15),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border.all(
                color: AppColors.accentPurple.withValues(alpha: 0.35),
                width: 1.5,
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => context.push(RouteConstants.detailPath(slang.id)),
                borderRadius: BorderRadius.circular(20),
                splashColor: AppColors.accentPurple.withValues(alpha: 0.1),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Label
                      Row(
                        children: [
                          Text('✨', style: const TextStyle(fontSize: 16)),
                          const SizedBox(width: 6),
                          Text(
                            'Slang hôm nay',
                            style: AppTextStyles.labelMedium.copyWith(
                              color: AppColors.accentPurpleLight,
                              letterSpacing: 0.8,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          TrendBadge(trendLevel: slang.trendLevel),
                        ],
                      ),
                      const SizedBox(height: 14),

                      // Phrase
                      Text(slang.phrase, style: AppTextStyles.slangPhrase),
                      const SizedBox(height: 8),

                      // Meaning
                      Text(
                        slang.meaning,
                        style: AppTextStyles.bodyMedium,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),

                      // Tags
                      if (slang.tags.isNotEmpty) ...[
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 6,
                          runSpacing: 4,
                          children: slang.tags
                              .take(4)
                              .map((t) => TagChip(tag: t))
                              .toList(),
                        ),
                      ],

                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Xem chi tiết →',
                            style: AppTextStyles.labelSmall.copyWith(
                              color: AppColors.accentCyanLight,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SlangOfDaySkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Trending Section
// ---------------------------------------------------------------------------

class _TrendingSection extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTrending = ref.watch(trendingSlangsProvider);

    return asyncTrending.when(
      loading: () => const SizedBox(height: 160),
      error: (_, __) => const SizedBox.shrink(),
      data: (list) {
        if (list.isEmpty) return const SizedBox.shrink();

        // Lọc chỉ lấy hot + rising
        final trending = list
            .where((s) =>
                s.trendLevel == TrendLevel.hot ||
                s.trendLevel == TrendLevel.rising)
            .take(10)
            .toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
              child: Text('🔥 Đang hot', style: AppTextStyles.headlineMedium),
            ),
            SizedBox(
              height: 155,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 16),
                itemCount: trending.length,
                itemBuilder: (ctx, i) =>
                    SlangCardCompact(slang: trending[i]),
              ),
            ),
          ],
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Recently Added List
// ---------------------------------------------------------------------------

class _RecentlyAddedList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Dùng search với query rỗng = lấy tất cả, sort theo date ở data source
    final asyncAll = ref.watch(slangSearchProvider(''));

    return asyncAll.when(
      loading: () => const SliverToBoxAdapter(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(32),
            child: CircularProgressIndicator(
              color: AppColors.accentPurple,
            ),
          ),
        ),
      ),
      error: (_, __) => const SliverToBoxAdapter(child: SizedBox.shrink()),
      data: (list) {
        // Sort by date desc và lấy 10 mới nhất
        final sorted = [...list]
          ..sort((a, b) => b.addedDate.compareTo(a.addedDate));
        final recent = sorted.take(10).toList();

        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (ctx, i) => SlangCard(slang: recent[i]),
            childCount: recent.length,
          ),
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Bottom Navigation Bar
// ---------------------------------------------------------------------------

class _BottomNav extends StatelessWidget {
  const _BottomNav({required this.currentIndex});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border(
          top: BorderSide(color: AppColors.divider, width: 1),
        ),
      ),
      child: SafeArea(
        child: SizedBox(
          height: 60,
          child: Row(
            children: [
              _NavItem(
                icon: Icons.home_rounded,
                label: 'Trang chủ',
                isActive: currentIndex == 0,
                onTap: () {
                  if (currentIndex != 0) context.go(RouteConstants.home);
                },
              ),
              _NavItem(
                icon: Icons.search_rounded,
                label: 'Tìm kiếm',
                isActive: currentIndex == 1,
                onTap: () => context.push(RouteConstants.search),
              ),
              _NavItem(
                icon: Icons.favorite_rounded,
                label: 'Yêu thích',
                isActive: currentIndex == 2,
                onTap: () => context.push(RouteConstants.favorites),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = isActive ? AppColors.accentPurple : AppColors.textMuted;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: AppTextStyles.labelSmall.copyWith(
                color: color,
                fontWeight:
                    isActive ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
