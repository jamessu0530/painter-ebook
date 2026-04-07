import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:painter_ebook/data/museum_data.dart';
import 'package:painter_ebook/models/museum.dart';
import 'package:painter_ebook/pages/museum_detail_page.dart';

/// Strict 2-column Pinterest layout: equal width, height driven by percentage.
class MuseumDashboardGrid extends StatelessWidget {
  const MuseumDashboardGrid({super.key, required this.museums});

  final List<Museum> museums;

  static const double _minHeight = 120;
  static const double _maxHeight = 300;

  @override
  Widget build(BuildContext context) {
    if (museums.isEmpty) return const SizedBox.shrink();

    final total = totalFeaturedArtworks;
    final sorted = List<Museum>.from(museums)
      ..sort((a, b) =>
          b.coveragePercent(total).compareTo(a.coveragePercent(total)));

    final minP = sorted
        .map((m) => m.coveragePercent(total))
        .reduce((a, b) => a < b ? a : b);
    final maxP = sorted
        .map((m) => m.coveragePercent(total))
        .reduce((a, b) => a > b ? a : b);

    return StaggeredGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 0,
      crossAxisSpacing: 0,
      children: [
        for (var i = 0; i < sorted.length; i++)
          StaggeredGridTile.extent(
            crossAxisCellCount: 1,
            mainAxisExtent:
                _heightForPercent(sorted[i].coveragePercent(total), minP, maxP),
            child: _DashboardCard(
              museum: sorted[i],
              rank: i,
              totalInApp: total,
              minPercent: minP,
              maxPercent: maxP,
            ),
          ),
      ],
    );
  }

  double _heightForPercent(double percent, double minP, double maxP) {
    final range = (maxP - minP).abs();
    final t = range < 0.001
        ? 0.5
        : ((percent - minP) / range).clamp(0.0, 1.0);
    return _minHeight + (_maxHeight - _minHeight) * t;
  }
}

class _DashboardCard extends StatelessWidget {
  const _DashboardCard({
    required this.museum,
    required this.rank,
    required this.totalInApp,
    required this.minPercent,
    required this.maxPercent,
  });

  final Museum museum;
  final int rank;
  final int totalInApp;
  final double minPercent;
  final double maxPercent;

  static const _cornerRadius = BorderRadius.only(
    topLeft: Radius.circular(24),
    topRight: Radius.circular(22),
    bottomRight: Radius.circular(20),
    bottomLeft: Radius.zero,
  );

  static const _heroAccent = Color(0xFF143FAF);

  Color _background() {
    if (rank == 0) return _heroAccent;

    final pct = museum.coveragePercent(totalInApp);
    final range = (maxPercent - minPercent).abs();
    final rawT = range < 0.001
        ? (pct / 100).clamp(0.0, 1.0)
        : ((pct - minPercent) / range).clamp(0.0, 1.0);
    final t = Curves.easeInCubic.transform(rawT);

    final nudge = (rank % 4 - 1.5) * 2.5;
    return HSLColor.fromAHSL(
      1,
      246 + (228 - 246) * t + nudge,
      0.18 + (0.76 - 0.18) * t,
      0.86 + (0.50 - 0.86) * t,
    ).toColor();
  }

  @override
  Widget build(BuildContext context) {
    final bg = _background();
    final bright = bg.computeLuminance() < 0.42;
    final fg = bright ? Colors.white : const Color(0xFF0A0A0A);
    final fgSub = bright
        ? Colors.white.withValues(alpha: 0.68)
        : const Color(0xFF0A0A0A).withValues(alpha: 0.50);

    const border = RoundedRectangleBorder(borderRadius: _cornerRadius);

    final pctSize = (58.0 - rank * 3.0).clamp(32.0, 58.0);
    final pctWeight = rank <= 1 ? FontWeight.w900 : FontWeight.w800;

    return Material(
      color: bg,
      shape: border,
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => MuseumDetailPage(museum: museum)),
        ),
        customBorder: border,
        splashColor: Colors.black.withValues(alpha: 0.06),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 14, 12, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                museum.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: fg,
                  height: 1.2,
                  letterSpacing: -0.2,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                museum.location,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w500,
                  color: fgSub,
                ),
              ),
              const Spacer(),
              Text(
                museum.coveragePercentLabel(totalInApp),
                style: TextStyle(
                  fontSize: pctSize,
                  fontWeight: pctWeight,
                  height: 0.88,
                  letterSpacing: -2.5,
                  color: fg,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
