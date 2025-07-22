import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// RIPP AI Brand Colors
class RippAIColors {
  // Core Brand Palette
  static const deepNavy = Color(0xFF0C134F);
  static const darkIndigo = Color(0xFF1A237E);
  static const electricCyan = Color(0xFF00E5FF);
  static const matteGold = Color(0xFFCDA434);
  static const pureWhite = Color(0xFFFFFFFF);
  static const darkCharcoal = Color(0xFF212121);
  static const lightGray = Color(0xFFF0F0F0);
  
  // Gradients
  static const primaryGradient = LinearGradient(
    colors: [deepNavy, darkIndigo],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const accentGradient = LinearGradient(
    colors: [electricCyan, Color(0xFF40C4FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class LightModeColors {
  static const lightPrimary = RippAIColors.darkIndigo;
  static const lightOnPrimary = RippAIColors.pureWhite;
  static const lightPrimaryContainer = RippAIColors.lightGray;
  static const lightOnPrimaryContainer = RippAIColors.deepNavy;
  static const lightSecondary = RippAIColors.electricCyan;
  static const lightOnSecondary = RippAIColors.pureWhite;
  static const lightTertiary = RippAIColors.matteGold;
  static const lightOnTertiary = RippAIColors.darkCharcoal;
  static const lightError = Color(0xFFD32F2F);
  static const lightOnError = RippAIColors.pureWhite;
  static const lightErrorContainer = Color(0xFFFFEBEE);
  static const lightOnErrorContainer = Color(0xFFB71C1C);
  static const lightInversePrimary = RippAIColors.electricCyan;
  static const lightShadow = Color(0x1A000000);
  static const lightSurface = RippAIColors.pureWhite;
  static const lightOnSurface = RippAIColors.darkCharcoal;
  static const lightAppBarBackground = RippAIColors.pureWhite;
}

class DarkModeColors {
  static const darkPrimary = RippAIColors.electricCyan;
  static const darkOnPrimary = RippAIColors.deepNavy;
  static const darkPrimaryContainer = RippAIColors.deepNavy;
  static const darkOnPrimaryContainer = RippAIColors.pureWhite;
  static const darkSecondary = RippAIColors.matteGold;
  static const darkOnSecondary = RippAIColors.deepNavy;
  static const darkTertiary = RippAIColors.darkIndigo;
  static const darkOnTertiary = RippAIColors.pureWhite;
  static const darkError = Color(0xFFFF5252);
  static const darkOnError = RippAIColors.deepNavy;
  static const darkErrorContainer = Color(0xFFB71C1C);
  static const darkOnErrorContainer = RippAIColors.pureWhite;
  static const darkInversePrimary = RippAIColors.matteGold;
  static const darkShadow = Color(0x4D000000);
  static const darkSurface = RippAIColors.deepNavy;
  static const darkOnSurface = RippAIColors.pureWhite;
  static const darkAppBarBackground = RippAIColors.deepNavy;
}

class FontSizes {
  static const double displayLarge = 57.0;
  static const double displayMedium = 45.0;
  static const double displaySmall = 36.0;
  static const double headlineLarge = 32.0;
  static const double headlineMedium = 24.0;
  static const double headlineSmall = 22.0;
  static const double titleLarge = 22.0;
  static const double titleMedium = 18.0;
  static const double titleSmall = 16.0;
  static const double labelLarge = 16.0;
  static const double labelMedium = 14.0;
  static const double labelSmall = 12.0;
  static const double bodyLarge = 16.0;
  static const double bodyMedium = 14.0;
  static const double bodySmall = 12.0;
}

ThemeData get lightTheme => ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.light(
    primary: LightModeColors.lightPrimary,
    onPrimary: LightModeColors.lightOnPrimary,
    primaryContainer: LightModeColors.lightPrimaryContainer,
    onPrimaryContainer: LightModeColors.lightOnPrimaryContainer,
    secondary: LightModeColors.lightSecondary,
    onSecondary: LightModeColors.lightOnSecondary,
    tertiary: LightModeColors.lightTertiary,
    onTertiary: LightModeColors.lightOnTertiary,
    error: LightModeColors.lightError,
    onError: LightModeColors.lightOnError,
    errorContainer: LightModeColors.lightErrorContainer,
    onErrorContainer: LightModeColors.lightOnErrorContainer,
    inversePrimary: LightModeColors.lightInversePrimary,
    shadow: LightModeColors.lightShadow,
    surface: LightModeColors.lightSurface,
    onSurface: LightModeColors.lightOnSurface,
  ),
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    backgroundColor: LightModeColors.lightAppBarBackground,
    foregroundColor: LightModeColors.lightOnPrimaryContainer,
    elevation: 0,
    centerTitle: true,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: RippAIColors.electricCyan,
      foregroundColor: RippAIColors.pureWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: RippAIColors.darkIndigo,
      side: const BorderSide(color: RippAIColors.electricCyan, width: 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    ),
  ),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.orbitron(
      fontSize: FontSizes.displayLarge,
      fontWeight: FontWeight.bold,
      color: RippAIColors.darkIndigo,
    ),
    displayMedium: GoogleFonts.orbitron(
      fontSize: FontSizes.displayMedium,
      fontWeight: FontWeight.w600,
      color: RippAIColors.darkIndigo,
    ),
    displaySmall: GoogleFonts.orbitron(
      fontSize: FontSizes.displaySmall,
      fontWeight: FontWeight.w600,
      color: RippAIColors.darkIndigo,
    ),
    headlineLarge: GoogleFonts.orbitron(
      fontSize: FontSizes.headlineLarge,
      fontWeight: FontWeight.w600,
      color: RippAIColors.darkIndigo,
    ),
    headlineMedium: GoogleFonts.orbitron(
      fontSize: FontSizes.headlineMedium,
      fontWeight: FontWeight.w500,
      color: RippAIColors.darkIndigo,
    ),
    headlineSmall: GoogleFonts.orbitron(
      fontSize: FontSizes.headlineSmall,
      fontWeight: FontWeight.bold,
      color: RippAIColors.darkIndigo,
    ),
    titleLarge: GoogleFonts.inter(
      fontSize: FontSizes.titleLarge,
      fontWeight: FontWeight.w600,
      color: RippAIColors.darkCharcoal,
    ),
    titleMedium: GoogleFonts.inter(
      fontSize: FontSizes.titleMedium,
      fontWeight: FontWeight.w500,
      color: RippAIColors.darkCharcoal,
    ),
    titleSmall: GoogleFonts.inter(
      fontSize: FontSizes.titleSmall,
      fontWeight: FontWeight.w500,
      color: RippAIColors.darkCharcoal,
    ),
    labelLarge: GoogleFonts.inter(
      fontSize: FontSizes.labelLarge,
      fontWeight: FontWeight.w500,
      color: RippAIColors.darkCharcoal,
    ),
    labelMedium: GoogleFonts.inter(
      fontSize: FontSizes.labelMedium,
      fontWeight: FontWeight.w500,
      color: RippAIColors.darkCharcoal,
    ),
    labelSmall: GoogleFonts.inter(
      fontSize: FontSizes.labelSmall,
      fontWeight: FontWeight.w500,
      color: RippAIColors.darkCharcoal,
    ),
    bodyLarge: GoogleFonts.inter(
      fontSize: FontSizes.bodyLarge,
      fontWeight: FontWeight.normal,
      height: 1.5,
      color: RippAIColors.darkCharcoal,
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: FontSizes.bodyMedium,
      fontWeight: FontWeight.normal,
      height: 1.5,
      color: RippAIColors.darkCharcoal,
    ),
    bodySmall: GoogleFonts.inter(
      fontSize: FontSizes.bodySmall,
      fontWeight: FontWeight.normal,
      height: 1.5,
      color: RippAIColors.darkCharcoal,
    ),
  ),
);

ThemeData get darkTheme => ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.dark(
    primary: DarkModeColors.darkPrimary,
    onPrimary: DarkModeColors.darkOnPrimary,
    primaryContainer: DarkModeColors.darkPrimaryContainer,
    onPrimaryContainer: DarkModeColors.darkOnPrimaryContainer,
    secondary: DarkModeColors.darkSecondary,
    onSecondary: DarkModeColors.darkOnSecondary,
    tertiary: DarkModeColors.darkTertiary,
    onTertiary: DarkModeColors.darkOnTertiary,
    error: DarkModeColors.darkError,
    onError: DarkModeColors.darkOnError,
    errorContainer: DarkModeColors.darkErrorContainer,
    onErrorContainer: DarkModeColors.darkOnErrorContainer,
    inversePrimary: DarkModeColors.darkInversePrimary,
    shadow: DarkModeColors.darkShadow,
    surface: DarkModeColors.darkSurface,
    onSurface: DarkModeColors.darkOnSurface,
  ),
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    backgroundColor: DarkModeColors.darkAppBarBackground,
    foregroundColor: DarkModeColors.darkOnPrimaryContainer,
    elevation: 0,
    centerTitle: true,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: RippAIColors.electricCyan,
      foregroundColor: RippAIColors.deepNavy,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: RippAIColors.electricCyan,
      side: const BorderSide(color: RippAIColors.electricCyan, width: 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    ),
  ),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.orbitron(
      fontSize: FontSizes.displayLarge,
      fontWeight: FontWeight.bold,
      color: RippAIColors.pureWhite,
    ),
    displayMedium: GoogleFonts.orbitron(
      fontSize: FontSizes.displayMedium,
      fontWeight: FontWeight.w600,
      color: RippAIColors.pureWhite,
    ),
    displaySmall: GoogleFonts.orbitron(
      fontSize: FontSizes.displaySmall,
      fontWeight: FontWeight.w600,
      color: RippAIColors.pureWhite,
    ),
    headlineLarge: GoogleFonts.orbitron(
      fontSize: FontSizes.headlineLarge,
      fontWeight: FontWeight.w600,
      color: RippAIColors.electricCyan,
    ),
    headlineMedium: GoogleFonts.orbitron(
      fontSize: FontSizes.headlineMedium,
      fontWeight: FontWeight.w500,
      color: RippAIColors.electricCyan,
    ),
    headlineSmall: GoogleFonts.orbitron(
      fontSize: FontSizes.headlineSmall,
      fontWeight: FontWeight.bold,
      color: RippAIColors.electricCyan,
    ),
    titleLarge: GoogleFonts.inter(
      fontSize: FontSizes.titleLarge,
      fontWeight: FontWeight.w600,
      color: RippAIColors.pureWhite,
    ),
    titleMedium: GoogleFonts.inter(
      fontSize: FontSizes.titleMedium,
      fontWeight: FontWeight.w500,
      color: RippAIColors.pureWhite,
    ),
    titleSmall: GoogleFonts.inter(
      fontSize: FontSizes.titleSmall,
      fontWeight: FontWeight.w500,
      color: RippAIColors.pureWhite,
    ),
    labelLarge: GoogleFonts.inter(
      fontSize: FontSizes.labelLarge,
      fontWeight: FontWeight.w500,
      color: RippAIColors.matteGold,
    ),
    labelMedium: GoogleFonts.inter(
      fontSize: FontSizes.labelMedium,
      fontWeight: FontWeight.w500,
      color: RippAIColors.matteGold,
    ),
    labelSmall: GoogleFonts.inter(
      fontSize: FontSizes.labelSmall,
      fontWeight: FontWeight.w500,
      color: RippAIColors.matteGold,
    ),
    bodyLarge: GoogleFonts.inter(
      fontSize: FontSizes.bodyLarge,
      fontWeight: FontWeight.normal,
      height: 1.5,
      color: RippAIColors.pureWhite,
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: FontSizes.bodyMedium,
      fontWeight: FontWeight.normal,
      height: 1.5,
      color: RippAIColors.pureWhite,
    ),
    bodySmall: GoogleFonts.inter(
      fontSize: FontSizes.bodySmall,
      fontWeight: FontWeight.normal,
      height: 1.5,
      color: RippAIColors.pureWhite,
    ),
  ),
);