import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/hive_constants.dart';
import '../models/slang_model.dart';

/// Đọc và cache slang data từ assets/data/slang_data.json
class SlangAssetDataSource {
  List<SlangModel>? _cache;

  /// Lấy tất cả slangs — load một lần rồi cache
  Future<List<SlangModel>> getAllSlangs() async {
    if (_cache != null) return _cache!;

    final jsonString = await rootBundle.loadString(AppConstants.assetSlangData);
    final jsonList = json.decode(jsonString) as List<dynamic>;

    _cache = jsonList
        .map((e) => SlangModel.fromJson(e as Map<String, dynamic>))
        .toList();

    return _cache!;
  }

  /// Tìm kiếm slang theo từ khóa (case-insensitive, tìm trong phrase + meaning + tags)
  Future<List<SlangModel>> searchSlangs(String query) async {
    if (query.trim().isEmpty) return [];

    final all = await getAllSlangs();
    final q = _normalize(query);

    final results = all.where((s) {
      return _normalize(s.phrase).contains(q) ||
          _normalize(s.meaning).contains(q) ||
          s.tags.any((tag) => _normalize(tag).contains(q));
    }).toList();

    // Sort: phrase match đứng trên, meaning match đứng sau
    results.sort((a, b) {
      final aPhrase = _normalize(a.phrase).contains(q);
      final bPhrase = _normalize(b.phrase).contains(q);
      if (aPhrase && !bPhrase) return -1;
      if (!aPhrase && bPhrase) return 1;
      return 0;
    });

    return results;
  }

  /// Lấy slang theo id
  Future<SlangModel?> getSlangById(String id) async {
    final all = await getAllSlangs();
    try {
      return all.firstWhere((s) => s.id == id);
    } catch (_) {
      return null;
    }
  }

  /// Lấy trending — hot trước, rồi rising, rồi classic
  Future<List<SlangModel>> getTrendingSlangs({int limit = 20}) async {
    final all = await getAllSlangs();

    final sorted = [...all]..sort((a, b) {
        return _trendOrder(a.trendLevel).compareTo(_trendOrder(b.trendLevel));
      });

    return sorted.take(limit).toList();
  }

  /// Lấy slang of the day — cache trong Hive, reset khi sang ngày mới
  Future<SlangModel> getSlangOfDay() async {
    final all = await getAllSlangs();
    final box = Hive.box<String>(HiveConstants.slangOfDayBox);

    final today = _todayKey();
    final cachedDate = box.get(HiveConstants.slangOfDayDateKey);
    final cachedId = box.get(HiveConstants.slangOfDayKey);

    // Nếu cùng ngày và đã có cache → trả về ngay
    if (cachedDate == today && cachedId != null) {
      final found = all.where((s) => s.id == cachedId).firstOrNull;
      if (found != null) return found;
    }

    // Ngày mới hoặc chưa có cache → pick deterministic theo ngày
    final index = today.hashCode.abs() % all.length;
    final picked = all[index];

    await box.put(HiveConstants.slangOfDayKey, picked.id);
    await box.put(HiveConstants.slangOfDayDateKey, today);

    return picked;
  }

  // --- Private helpers ---

  String _normalize(String text) => text.toLowerCase().trim();

  /// Key ngày hôm nay dạng 'YYYY-MM-DD'
  String _todayKey() {
    final now = DateTime.now();
    return '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
  }

  int _trendOrder(trendLevel) {
    switch (trendLevel.toString()) {
      case 'TrendLevel.hot':
        return 0;
      case 'TrendLevel.rising':
        return 1;
      case 'TrendLevel.classic':
        return 2;
      default:
        return 3;
    }
  }
}
