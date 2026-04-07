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
    return MaterialApp(
      title: 'Painter E-Book',
      debugShowCheckedModeBanner: false,
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
      home: const HomePage(),
    );
  }
}
