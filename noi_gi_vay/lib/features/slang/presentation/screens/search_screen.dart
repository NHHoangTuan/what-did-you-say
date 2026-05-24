import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../providers/slang_providers.dart';
import '../widgets/slang_card.dart';

part 'search_screen.g.dart';

// ---------------------------------------------------------------------------
// Search Query Notifier — quản lý text search
// ---------------------------------------------------------------------------

@riverpod
class SearchQuery extends _$SearchQuery {
  @override
  String build() => '';

  void update(String query) => state = query;
  void clear() => state = '';
}

// ---------------------------------------------------------------------------
// SearchScreen
// ---------------------------------------------------------------------------

/// SearchScreen — real-time search với debounce nhẹ
class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();

    // Auto-focus khi mở màn hình
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onChanged(String val) {
    ref.read(searchQueryProvider.notifier).update(val);
  }

  void _onClear() {
    _controller.clear();
    ref.read(searchQueryProvider.notifier).clear();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final query = ref.watch(searchQueryProvider);

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
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            onChanged: _onChanged,
            style: AppTextStyles.bodyLarge,
            cursorColor: AppColors.accentPurple,
            decoration: InputDecoration(
              hintText: 'Tìm slang, meme, cụm từ...',
              hintStyle: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.textMuted,
              ),
              border: InputBorder.none,
              suffixIcon: query.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.close_rounded),
                      color: AppColors.textMuted,
                      onPressed: _onClear,
                    )
                  : null,
            ),
          ),
        ),
      ),
      body: query.isEmpty
          ? _EmptyQueryHint()
          : _SearchResults(query: query),
    );
  }
}

// ---------------------------------------------------------------------------
// Khi chưa nhập gì: gợi ý
// ---------------------------------------------------------------------------

class _EmptyQueryHint extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_rounded, size: 64, color: AppColors.textMuted),
          const SizedBox(height: 16),
          Text(
            'Gõ để tìm kiếm',
            style: AppTextStyles.bodyMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Thử: "mời đoàn", "slay", "vibe"...',
            style: AppTextStyles.bodySmall,
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Kết quả tìm kiếm
// ---------------------------------------------------------------------------

class _SearchResults extends ConsumerWidget {
  const _SearchResults({required this.query});

  final String query;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncResults = ref.watch(slangSearchProvider(query));

    return asyncResults.when(
      loading: () => const Center(
        child: CircularProgressIndicator(color: AppColors.accentPurple),
      ),
      error: (err, _) => Center(
        child: Text(
          'Lỗi tìm kiếm: $err',
          style: AppTextStyles.bodyMedium,
        ),
      ),
      data: (results) {
        if (results.isEmpty) {
          return _NoResults(query: query);
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
              child: Text(
                '${results.length} kết quả cho "$query"',
                style: AppTextStyles.bodySmall,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: results.length,
                itemBuilder: (ctx, i) => SlangCard(slang: results[i]),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _NoResults extends StatelessWidget {
  const _NoResults({required this.query});

  final String query;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('🤷', style: TextStyle(fontSize: 56)),
          const SizedBox(height: 16),
          Text(
            'Không tìm thấy "$query"',
            style: AppTextStyles.bodyMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Thử từ khác hoặc viết tắt khác nhé!',
            style: AppTextStyles.bodySmall,
          ),
        ],
      ),
    );
  }
}
