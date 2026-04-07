import 'package:flutter/material.dart';
import 'package:painter_ebook/data/museum_data.dart';
import 'package:painter_ebook/widgets/museum_dashboard_grid.dart';

class AboutTabPage extends StatelessWidget {
  const AboutTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 14),
            child: Text(
              'Museum Coverage',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                  ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(6, 0, 6, 28),
          sliver: SliverToBoxAdapter(
            child: MuseumDashboardGrid(museums: museums),
          ),
        ),
      ],
    );
  }
}
