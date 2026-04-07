import 'package:flutter/material.dart';
import 'package:painter_ebook/data/painter_data.dart';
import 'package:painter_ebook/pages/painter_detail_page.dart';
import 'package:painter_ebook/widgets/artwork_image.dart';
import 'package:painter_ebook/widgets/featured_painter_card.dart';
import 'package:painter_ebook/widgets/section_header.dart';

class HomeTabPage extends StatelessWidget {
  const HomeTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    final featured = painters.take(4).toList();
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 36),
      children: [
        _HeroBlock(
          onStart: () => DefaultTabController.of(context).animateTo(1),
        ),
        const SizedBox(height: 26),
        const SectionHeader(
          title: 'Featured Painters',
          subtitle: 'Curated starts for your visual reading journey.',
        ),
        SizedBox(
          height: 260,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: featured.length,
            separatorBuilder: (_, index) => const SizedBox(width: 14),
            itemBuilder: (context, index) {
              final painter = featured[index];
              return FeaturedPainterCard(
                painter: painter,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PainterDetailPage(painter: painter),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _HeroBlock extends StatelessWidget {
  final VoidCallback onStart;

  const _HeroBlock({required this.onStart});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned.fill(
            child: ArtworkImage(imageUrl: painters.first.heroImageUrl, fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF0000FF).withValues(alpha: 0.18),
                    const Color(0xFF0000FF).withValues(alpha: 0.65),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Painter\nE-Book',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: Colors.white,
                      ),
                ),
                const SizedBox(height: 14),
                const Text(
                  'A curated digital reading room on 10 major painters.\n'
                  'Read biographies, movements, and masterpieces in a gallery-like flow.',
                  style: TextStyle(
                    color: Colors.white,
                    height: 1.45,
                  ),
                ),
                const SizedBox(height: 18),
                TextButton(
                  onPressed: onStart,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.white.withValues(alpha: 0.16),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  ),
                  child: const Text('Start Reading'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
