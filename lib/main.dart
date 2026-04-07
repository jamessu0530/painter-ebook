import 'package:flutter/material.dart';
import 'package:painter_ebook/pages/home_page.dart';

void main() => runApp(const PainterBookApp());

// Palette inspired by your reference image.
const Color kTrueBlue = Color(0xFF0000FF);
const Color kClearWhite = Color(0xFFFFFFFF);
const Color kGreenTea = Color(0xFFA1F2C7);
const Color kSweetPeach = Color(0xFFFFBA85);
const Color kCanvas = Color(0xFFF8F8FA);

class PainterBookApp extends StatelessWidget {
  const PainterBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const _PainterBookAppShell();
  }
}

class _PainterBookAppShell extends StatefulWidget {
  const _PainterBookAppShell();

  @override
  State<_PainterBookAppShell> createState() => _PainterBookAppShellState();
}

class _PainterBookAppShellState extends State<_PainterBookAppShell> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleThemeMode() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Painter E-Book',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: kTrueBlue,
          onPrimary: kClearWhite,
          secondary: kGreenTea,
          onSecondary: Color(0xFF0F2458),
          error: Color(0xFFB3261E),
          onError: kClearWhite,
          surface: kClearWhite,
          onSurface: Color(0xFF16162B),
        ),
        scaffoldBackgroundColor: kCanvas,
        textTheme: const TextTheme(
          displayMedium: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w800,
            height: 0.93,
            letterSpacing: -1.2,
          ),
          headlineMedium: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            height: 1.05,
          ),
          titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            height: 1.58,
          ),
        ),
        cardTheme: const CardThemeData(
          margin: EdgeInsets.zero,
          elevation: 0.6,
          color: kClearWhite,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: kCanvas,
          foregroundColor: Color(0xFF16162B),
          surfaceTintColor: Colors.transparent,
        ),
        tabBarTheme: const TabBarThemeData(
          labelColor: kTrueBlue,
          unselectedLabelColor: Color(0xFF5D5D6B),
          indicatorColor: kTrueBlue,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: kTrueBlue,
            backgroundColor: kSweetPeach.withValues(alpha: 0.22),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xFF8FA8FF),
          onPrimary: Color(0xFF0A1028),
          secondary: Color(0xFF6ED8B5),
          onSecondary: Color(0xFF06241E),
          error: Color(0xFFFFB4AB),
          onError: Color(0xFF690005),
          surface: Color(0xFF171A24),
          onSurface: Color(0xFFE7E9F2),
        ),
        scaffoldBackgroundColor: const Color(0xFF10121A),
        textTheme: const TextTheme(
          displayMedium: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w800,
            height: 0.93,
            letterSpacing: -1.2,
          ),
          headlineMedium: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            height: 1.05,
          ),
          titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            height: 1.58,
          ),
        ),
        cardTheme: const CardThemeData(
          margin: EdgeInsets.zero,
          elevation: 0.2,
          color: Color(0xFF1B1F2A),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF10121A),
          foregroundColor: Color(0xFFE7E9F2),
          surfaceTintColor: Colors.transparent,
        ),
        tabBarTheme: const TabBarThemeData(
          labelColor: Color(0xFFB9C7FF),
          unselectedLabelColor: Color(0xFF9AA1B4),
          indicatorColor: Color(0xFF8FA8FF),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFFD6DEFF),
            backgroundColor: const Color(0xFF2A3150),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      home: HomePage(
        isDarkMode: _themeMode == ThemeMode.dark,
        onToggleDarkMode: _toggleThemeMode,
      ),
    );
  }
}
