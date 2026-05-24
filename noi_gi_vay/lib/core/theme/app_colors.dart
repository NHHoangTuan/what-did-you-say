import 'package:flutter/material.dart';

/// Bảng màu chính của app — dark theme, neon accent
class AppColors {
  AppColors._();

  // Backgrounds
  static const Color background = Color(0xFF0D0D0D);
  static const Color surface = Color(0xFF1A1A1A);
  static const Color surfaceElevated = Color(0xFF242424);
  static const Color surfaceHighlight = Color(0xFF2E2E2E);

  // Accents
  static const Color accentPurple = Color(0xFFA855F7);
  static const Color accentCyan = Color(0xFF06B6D4);
  static const Color accentPurpleLight = Color(0xFFD8B4FE);
  static const Color accentCyanLight = Color(0xFF67E8F9);

  // Gradient stops
  static const LinearGradient accentGradient = LinearGradient(
    colors: [accentPurple, accentCyan],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  // Text
  static const Color textPrimary = Color(0xFFF5F5F5);
  static const Color textSecondary = Color(0xFFAAAAAA);
  static const Color textMuted = Color(0xFF666666);

  // Trend level colors
  static const Color trendHot = Color(0xFFEF4444);       // 🔥 Đang hot
  static const Color trendRising = Color(0xFFF59E0B);    // ⚡ Mới nổi
  static const Color trendClassic = Color(0xFF6B7280);   // 📦 Cổ điển

  // Utility
  static const Color divider = Color(0xFF2A2A2A);
  static const Color error = Color(0xFFEF4444);
  static const Color success = Color(0xFF22C55E);

  // Card border
  static const Color cardBorder = Color(0xFF2A2A2A);
}
