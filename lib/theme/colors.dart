import 'package:flutter/material.dart';

ColorScheme getColorsScheme(BuildContext context) =>
    Theme.of(context).colorScheme;

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF795900),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFFFDF9E),
  onPrimaryContainer: Color(0xFF261A00),
  secondary: Color(0xFF6B5D3F),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFF5E0BB),
  onSecondaryContainer: Color(0xFF241A04),
  tertiary: Color(0xFF4A6547),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFCCEBC4),
  onTertiaryContainer: Color(0xFF072008),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFFFBFF),
  onBackground: Color(0xFF1E1B16),
  surface: Color(0xFFFFFBFF),
  onSurface: Color(0xFF1E1B16),
  surfaceVariant: Color(0xFFEDE1CF),
  onSurfaceVariant: Color(0xFF4D4639),
  outline: Color(0xFF7F7667),
  onInverseSurface: Color(0xFFF7EFE7),
  inverseSurface: Color(0xFF34302A),
  inversePrimary: Color(0xFFF2BF48),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF795900),
  outlineVariant: Color(0xFFD0C5B4),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFF2BF48),
  onPrimary: Color(0xFF402D00),
  primaryContainer: Color(0xFF5B4300),
  onPrimaryContainer: Color(0xFFFFDF9E),
  secondary: Color(0xFFD8C4A0),
  onSecondary: Color(0xFF3B2F15),
  secondaryContainer: Color(0xFF52452A),
  onSecondaryContainer: Color(0xFFF5E0BB),
  tertiary: Color(0xFFB0CFA9),
  onTertiary: Color(0xFF1D361C),
  tertiaryContainer: Color(0xFF334D30),
  onTertiaryContainer: Color(0xFFCCEBC4),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF1E1B16),
  onBackground: Color(0xFFE9E1D8),
  surface: Color(0xFF1E1B16),
  onSurface: Color(0xFFE9E1D8),
  surfaceVariant: Color(0xFF4D4639),
  onSurfaceVariant: Color(0xFFD0C5B4),
  outline: Color(0xFF998F80),
  onInverseSurface: Color(0xFF1E1B16),
  inverseSurface: Color(0xFFE9E1D8),
  inversePrimary: Color(0xFF795900),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFF2BF48),
  outlineVariant: Color(0xFF4D4639),
  scrim: Color(0xFF000000),
);
