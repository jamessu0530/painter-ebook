import 'package:flutter/material.dart';

class Painter {
  final String name;
  final String chineseName;
  final int birthYear;
  final int deathYear;
  final String nationality;
  final String artMovement;
  final List<String> famousWorks;
  final String description;
  final String heroImageUrl;
  final String galleryImageUrl;
  final Color accentColor;

  const Painter({
    required this.name,
    required this.chineseName,
    required this.birthYear,
    required this.deathYear,
    required this.nationality,
    required this.artMovement,
    required this.famousWorks,
    required this.description,
    required this.heroImageUrl,
    required this.galleryImageUrl,
    required this.accentColor,
  });
}
