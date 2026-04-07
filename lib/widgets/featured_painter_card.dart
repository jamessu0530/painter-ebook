import 'package:flutter/material.dart';
import 'package:painter_ebook/models/painter.dart';
import 'package:painter_ebook/widgets/artwork_image.dart';

class FeaturedPainterCard extends StatelessWidget {
  final Painter painter;
  final VoidCallback onTap;

  /// When set (e.g. museum artwork title), shown instead of [Painter.famousWorks.first].
  final String? subtitle;

  const FeaturedPainterCard({
    super.key,
    required this.painter,
    required this.onTap,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 238,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ArtworkImage(
                imageUrl: painter.heroImageUrl,
                fit: BoxFit.cover,
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.0),
                      Colors.black.withValues(alpha: 0.62),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      painter.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      subtitle ?? painter.famousWorks.first,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
