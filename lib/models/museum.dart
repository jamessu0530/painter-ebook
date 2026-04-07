class MuseumArtwork {
  final String title;
  final String painter;
  final String museumName;

  const MuseumArtwork({
    required this.title,
    required this.painter,
    required this.museumName,
  });
}

/// Controls vertical weight in the dashboard masonry grid.
enum MuseumDashboardTier {
  /// Shorter tile
  compact,
  /// Default
  standard,
  /// Hero tile (taller, stronger emphasis)
  featured,
}

class Museum {
  final String name;
  final String location;
  final String image;
  final String description;
  final List<MuseumArtwork> featuredArtworks;

  /// Visual size tier in the staggered dashboard.
  final MuseumDashboardTier dashboardTier;

  const Museum({
    required this.name,
    required this.location,
    required this.image,
    required this.description,
    required this.featuredArtworks,
    this.dashboardTier = MuseumDashboardTier.standard,
  });

  int get featuredCount => featuredArtworks.length;

  /// Coverage % relative to a given total (supplied externally).
  double coveragePercent(int totalArtworksInApp) {
    if (totalArtworksInApp <= 0) return 0;
    return (featuredCount / totalArtworksInApp * 100).clamp(0, 100);
  }

  String coveragePercentLabel(int totalArtworksInApp) {
    final v = coveragePercent(totalArtworksInApp);
    if (v >= 10) return '${v.round()}%';
    return '${v.toStringAsFixed(1)}%';
  }
}
