import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/slang_entity.dart';
import '../providers/slang_providers.dart';
import '../../../favorites/presentation/providers/favorites_providers.dart';
import '../widgets/trend_badge.dart';
import '../widgets/tag_chip.dart';

/// DetailScreen — xem đầy đủ một slang entry
/// Nhận [slangId] từ route parameter
class DetailScreen extends ConsumerWidget {
  const DetailScreen({super.key, required this.slangId});

  final String slangId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncSlang = ref.watch(slangDetailProvider(slangId));

    return Scaffold(
      backgroundColor: AppColors.background,
      body: asyncSlang.when(
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.accentPurple),
        ),
        error: (_, __) => _ErrorBody(onBack: () => Navigator.pop(context)),
        data: (slang) {
          if (slang == null) {
            return _ErrorBody(onBack: () => Navigator.pop(context));
          }
          return _DetailBody(slang: slang);
        },
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Body chính
// ---------------------------------------------------------------------------

class _DetailBody extends ConsumerWidget {
  const _DetailBody({required this.slang});

  final SlangEntity slang;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFav = ref.watch(isFavoriteProvider(slang.id));

    return CustomScrollView(
      slivers: [
        // App bar nổi với nút back + favorite + share
        SliverAppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          floating: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            color: AppColors.textPrimary,
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            // Nút share
            IconButton(
              icon: const Icon(Icons.share_outlined),
              color: AppColors.textSecondary,
              onPressed: () => _share(slang),
            ),
            // Nút favorite
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: IconButton(
                key: ValueKey(isFav),
                icon: Icon(
                  isFav ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                ),
                color: isFav ? AppColors.error : AppColors.textSecondary,
                onPressed: () {
                  ref
                      .read(favoritesNotifierProvider.notifier)
                      .toggle(slang.id);
                  HapticFeedback.lightImpact();
                },
              ),
            ),
            const SizedBox(width: 4),
          ],
        ),

        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              // Trend badge
              TrendBadge(trendLevel: slang.trendLevel),
              const SizedBox(height: 16),

              // Phrase — to nổi bật
              Text(slang.phrase, style: AppTextStyles.slangPhrase),
              const SizedBox(height: 20),

              // Divider gradient
              _GradientDivider(),
              const SizedBox(height: 20),

              // Meaning
              _SectionLabel('📖 Nghĩa là gì?'),
              const SizedBox(height: 8),
              Text(slang.meaning, style: AppTextStyles.bodyLarge),
              const SizedBox(height: 24),

              // Origin
              _SectionLabel('📍 Nguồn gốc'),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.surfaceElevated,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Text('🌐', style: TextStyle(fontSize: 18)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        slang.origin,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Examples
              if (slang.examples.isNotEmpty) ...[
                _SectionLabel('💬 Ví dụ sử dụng'),
                const SizedBox(height: 10),
                ...slang.examples.asMap().entries.map(
                      (e) => _ExampleItem(
                        index: e.key + 1,
                        text: e.value,
                      ),
                    ),
                const SizedBox(height: 24),
              ],

              // Tags
              if (slang.tags.isNotEmpty) ...[
                _SectionLabel('🏷️ Tags'),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children:
                      slang.tags.map((t) => TagChip(tag: t)).toList(),
                ),
                const SizedBox(height: 24),
              ],

              // Date
              Text(
                'Thêm vào: ${_formatDate(slang.addedDate)}',
                style: AppTextStyles.bodySmall,
              ),
              const SizedBox(height: 40),

              // Share button
              _ShareButton(slang: slang),
              const SizedBox(height: 60),
            ]),
          ),
        ),
      ],
    );
  }

  void _share(SlangEntity slang) {
    final text = '💬 ${slang.phrase}\n'
        '📖 Nghĩa: ${slang.meaning}\n'
        '📍 Nguồn: ${slang.origin}\n\n'
        'Tra thêm tại app Nói Gì Vậy? 🔍';
    Share.share(text);
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }
}

// ---------------------------------------------------------------------------
// Sub-widgets
// ---------------------------------------------------------------------------

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.labelLarge.copyWith(
        color: AppColors.accentPurpleLight,
        letterSpacing: 0.3,
      ),
    );
  }
}

class _GradientDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.5,
      decoration: BoxDecoration(
        gradient: AppColors.accentGradient,
        borderRadius: BorderRadius.circular(1),
      ),
    );
  }
}

class _ExampleItem extends StatelessWidget {
  const _ExampleItem({required this.index, required this.text});

  final int index;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.cardBorder, width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              gradient: AppColors.accentGradient,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$index',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ShareButton extends StatelessWidget {
  const _ShareButton({required this.slang});

  final SlangEntity slang;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final text = '💬 ${slang.phrase}\n'
            '📖 Nghĩa: ${slang.meaning}\n'
            '📍 Nguồn: ${slang.origin}\n\n'
            'Tra thêm tại app Nói Gì Vậy? 🔍';
        Share.share(text);
      },
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          gradient: AppColors.accentGradient,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              const Icon(Icons.share_rounded, color: Colors.white, size: 20),
              Text(
                'Chia sẻ',
                style: AppTextStyles.labelLarge.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Error body
// ---------------------------------------------------------------------------

class _ErrorBody extends StatelessWidget {
  const _ErrorBody({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('😵', style: TextStyle(fontSize: 56)),
          const SizedBox(height: 16),
          Text(
            'Không tìm thấy slang này',
            style: AppTextStyles.bodyMedium,
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: onBack,
            child: Text(
              '← Quay lại',
              style: AppTextStyles.labelLarge.copyWith(
                color: AppColors.accentPurple,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
