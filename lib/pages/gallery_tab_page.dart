import 'package:flutter/material.dart';
import 'package:painter_ebook/data/artwork_intro_data.dart';
import 'package:painter_ebook/data/painter_data.dart';
import 'package:painter_ebook/widgets/artwork_image.dart';
import 'package:painter_ebook/widgets/section_header.dart';
import 'package:painter_ebook/widgets/stacked_gallery_view.dart';

class GalleryTabPage extends StatelessWidget {
  const GalleryTabPage({super.key});

  List<GalleryCardItem> _buildGalleryItems(BuildContext context) {
    final items = <GalleryCardItem>[];
    for (final painter in painters) {
      final heroTitle =
          painter.famousWorks.isNotEmpty ? painter.famousWorks.first : '${painter.name} Hero';
      final galleryTitle =
          painter.famousWorks.length > 1 ? painter.famousWorks[1] : '${painter.name} Gallery';

      items.add(
        GalleryCardItem(
          title: heroTitle,
          imageUrl: painter.heroImageUrl,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => _ArtworkDetailPage(
                painterName: painter.name,
                workTitle: heroTitle,
                imageUrl: painter.heroImageUrl,
                intro: artworkIntroByTitle[heroTitle] ?? '此作品為 ${painter.name} 的代表作之一。',
              ),
            ),
          ),
        ),
      );

      items.add(
        GalleryCardItem(
          title: galleryTitle,
          imageUrl: painter.galleryImageUrl,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => _ArtworkDetailPage(
                painterName: painter.name,
                workTitle: galleryTitle,
                imageUrl: painter.galleryImageUrl,
                intro: artworkIntroByTitle[galleryTitle] ?? '此作品為 ${painter.name} 的代表作之一。',
              ),
            ),
          ),
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    final items = _buildGalleryItems(context); // 10 painters x 2 = 20
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 18, 16, 6),
          child: SectionHeader(
            title: 'Gallery',
            subtitle: '',
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 24),
            child: StackedGalleryView(
              items: items,
            ),
          ),
        ),
      ],
    );
  }
}

class _ArtworkDetailPage extends StatelessWidget {
  const _ArtworkDetailPage({
    required this.painterName,
    required this.workTitle,
    required this.imageUrl,
    required this.intro,
  });

  final String painterName;
  final String workTitle;
  final String imageUrl;
  final String intro;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('作品介紹')),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          ArtworkImage(
            imageUrl: imageUrl,
            height: 300,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  workTitle,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 6),
                Text(
                  painterName,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  intro,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
