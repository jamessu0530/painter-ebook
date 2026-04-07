import 'package:flutter/material.dart';
import 'package:painter_ebook/data/painter_data.dart';
import 'package:painter_ebook/models/museum.dart';
import 'package:painter_ebook/models/painter.dart';
import 'package:painter_ebook/pages/painter_detail_page.dart';
import 'package:painter_ebook/widgets/artwork_image.dart';
import 'package:painter_ebook/widgets/featured_painter_card.dart';
import 'package:painter_ebook/widgets/section_header.dart';

class MuseumDetailPage extends StatelessWidget {
  final Museum museum;

  const MuseumDetailPage({super.key, required this.museum});

  static Painter? _painterByName(String name) {
    for (final p in painters) {
      if (p.name == name) return p;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('美術館導覽')),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          ArtworkImage(
            imageUrl: museum.image,
            height: 260,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  museum.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 6),
                Text(
                  museum.location,
                  style: TextStyle(color: Colors.grey.shade700),
                ),
                const SizedBox(height: 14),
                Text(
                  museum.description,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 24),
                const SectionHeader(
                  title: '本 App 精選作品',
                  subtitle: '點選卡片進入畫家章節介紹。',
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 260,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: museum.featuredArtworks.length,
                    separatorBuilder: (context, index) => const SizedBox(width: 14),
                    itemBuilder: (context, index) {
                      final artwork = museum.featuredArtworks[index];
                      final painter = _painterByName(artwork.painter);
                      if (painter == null) {
                        return SizedBox(
                          width: 238,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    artwork.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(artwork.painter),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                      return FeaturedPainterCard(
                        painter: painter,
                        subtitle: artwork.title,
                        onTap: () => Navigator.push(
                          context,
                          PageRouteBuilder<void>(
                            transitionDuration: const Duration(milliseconds: 260),
                            reverseTransitionDuration: const Duration(milliseconds: 220),
                            pageBuilder: (context, animation, secondaryAnimation) => FadeTransition(
                              opacity: animation,
                              child: PainterDetailPage(painter: painter),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
