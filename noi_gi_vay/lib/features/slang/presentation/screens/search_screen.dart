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

/// SearchScreen — real-time search với recent searches
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

  /// Khi user submit (nhấn enter / done) → lưu vào recent
  void _onSubmitted(String val) {
    final q = val.trim();
    if (q.isNotEmpty) {
      ref.read(recentSearchesProvider.notifier).add(q);
    }
  }

  /// Chọn query từ recent list → đổ vào text field + search
  void _selectRecent(String query) {
    _controller.text = query;
    _controller.selection = TextSelection.fromPosition(
      TextPosition(offset: query.length),
    );
    ref.read(searchQueryProvider.notifier).update(query);
    ref.read(recentSearchesProvider.notifier).add(query);
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
            onSubmitted: _onSubmitted,
            style: AppTextStyles.bodyLarge,
            cursorColor: AppColors.accentPurple,
            textInputAction: TextInputAction.search,
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
          ? _RecentSearchesPanel(onSelect: _selectRecent)
          : _SearchResults(query: query, onSubmitted: _onSubmitted),
    );
  }
}

// ---------------------------------------------------------------------------
// Recent Searches Panel (hiện khi chưa nhập)
// ---------------------------------------------------------------------------

class _RecentSearchesPanel extends ConsumerWidget {
  const _RecentSearchesPanel({required this.onSelect});

  final void Function(String) onSelect;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recents = ref.watch(recentSearchesProvider);

    if (recents.isEmpty) {
      return _EmptyQueryHint();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 16, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '🕐 Tìm gần đây',
                style: AppTextStyles.labelLarge.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              TextButton(
                onPressed: () =>
                    ref.read(recentSearchesProvider.notifier).clear(),
                child: Text(
                  'Xóa hết',
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.textMuted,
                  ),
                ),
              ),
            ],
          ),
        ),

        // List
        Expanded(
          child: ListView.builder(
            itemCount: recents.length,
            itemBuilder: (ctx, i) {
              final q = recents[i];
              return ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                leading: Icon(
                  Icons.history_rounded,
                  size: 18,
                  color: AppColors.textMuted,
                ),
                title: Text(q, style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textPrimary,
                )),
                trailing: IconButton(
                  icon: Icon(Icons.close_rounded,
                      size: 16, color: AppColors.textMuted),
                  onPressed: () =>
                      ref.read(recentSearchesProvider.notifier).remove(q),
                ),
                onTap: () => onSelect(q),
              );
            },
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Hint khi không có recent searches
// ---------------------------------------------------------------------------

class _EmptyQueryHint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
  const _SearchResults({required this.query, required this.onSubmitted});

  final String query;
  final void Function(String) onSubmitted;

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
