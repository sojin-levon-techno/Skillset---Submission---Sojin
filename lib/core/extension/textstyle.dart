import 'package:flutter/material.dart';

extension StyleExtension on BuildContext {
  TextTheme get style => Theme.of(this).textTheme;
  TextStyle get bodyLarge => style.bodyLarge ?? const TextStyle();
  TextStyle get bodyMedium => style.bodyMedium ?? const TextStyle();
  TextStyle get bodySmall => style.bodySmall ?? const TextStyle();
  TextStyle get labelLarge => style.labelLarge ?? const TextStyle();
  TextStyle get labelMedium => style.labelMedium ?? const TextStyle();
  TextStyle get labelSmall => style.labelSmall ?? const TextStyle();
  TextStyle get titleLarge => style.titleLarge ?? const TextStyle();
  TextStyle get titleMedium => style.titleMedium ?? const TextStyle();
  TextStyle get titleSmall => style.titleSmall ?? const TextStyle();
  TextStyle get headLineLarge => style.headlineLarge ?? const TextStyle();
  TextStyle get headLineMedium => style.headlineMedium ?? const TextStyle();
  TextStyle get headLineSmall => style.headlineSmall ?? const TextStyle();
  TextStyle get displayLarge => style.displayLarge ?? const TextStyle();
  TextStyle get displayMedium => style.displayMedium ?? const TextStyle();
  TextStyle get displaySmall => style.displaySmall ?? const TextStyle();
}
