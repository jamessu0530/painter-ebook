import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:painter_ebook/widgets/gallery_painter_card.dart';

class GalleryCardItem {
  final String title;
  final String imageUrl;
  final VoidCallback onTap;

  const GalleryCardItem({
    required this.title,
    required this.imageUrl,
    required this.onTap,
  });
}

class StackedGalleryView extends StatefulWidget {
  final List<GalleryCardItem> items;
  final int maxVisibleCards;

  const StackedGalleryView({
    super.key,
    required this.items,
    this.maxVisibleCards = 7,
  });

  @override
  State<StackedGalleryView> createState() => _StackedGalleryViewState();
}

class _StackedGalleryViewState extends State<StackedGalleryView> {
  late int _activeIndex;
  double _dragDx = 0;

  @override
  void initState() {
    super.initState();
    _activeIndex = widget.items.isEmpty ? 0 : widget.items.length ~/ 2;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) {
      return const SizedBox.shrink();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        final cardWidth = math.min(420.0, width * 0.78);
        final cardHeight = math.min(420.0, height * 0.86);
        final centerX = (width - cardWidth) / 2;
        final centerY = (height - cardHeight) / 2;
        final spread = math.min(86.0, width * 0.12);
        final halfWindow = (widget.maxVisibleCards ~/ 2).clamp(1, 4);

        final visibleOffsets =
            List<int>.generate(halfWindow * 2 + 1, (i) => i - halfWindow);
        final visibleCards = visibleOffsets
            .map((offset) => _VisibleCard(
                  index: _wrapIndex(_activeIndex + offset),
                  offset: offset.toDouble(),
                ))
            .toList();

        final ordered = [...visibleCards]..sort((a, b) {
          final da = ((a.offset * spread) + _dragDx).abs();
          final db = ((b.offset * spread) + _dragDx).abs();
          return db.compareTo(da);
        });

        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onHorizontalDragUpdate: (details) {
            setState(() => _dragDx += details.delta.dx);
          },
          onHorizontalDragEnd: (_) {
            final shift = (-_dragDx / spread).round();
            setState(() {
              _activeIndex = _wrapIndex(_activeIndex + shift);
              _dragDx = 0;
            });
          },
          onHorizontalDragCancel: () {
            setState(() => _dragDx = 0);
          },
          child: MouseRegion(
            onHover: (event) {
              final localX = event.localPosition.dx.clamp(0, width);
              final center = width / 2;
              final hoverShift =
                  ((localX - center) / spread).round().clamp(-halfWindow, halfWindow);
              final candidate = _wrapIndex(_activeIndex + hoverShift);
              if (candidate != _activeIndex && hoverShift != 0) {
                setState(() {
                  _activeIndex = candidate;
                  _dragDx = 0;
                });
              }
            },
            child: Stack(
              clipBehavior: Clip.none,
              children: ordered.map((card) {
                final visualOffset = (card.offset * spread) + _dragDx;
                final distance = (visualOffset / spread).abs();
                final isActive = distance < 0.45;
                final left = centerX + visualOffset;
                final top = centerY + (isActive ? -14 : math.min(22, distance * 9.0));
                final scale = isActive ? 1.08 : math.max(0.86, 1.0 - distance * 0.09);
                final opacity = isActive ? 1.0 : math.max(0.5, 0.9 - distance * 0.14);
                final shadow = isActive ? 34.0 : math.max(8.0, 18.0 - distance * 3);

                return AnimatedPositioned(
                  key: ValueKey<int>(card.index),
                  duration: const Duration(milliseconds: 240),
                  curve: Curves.easeOutCubic,
                  left: left,
                  top: top,
                  width: cardWidth,
                  height: cardHeight,
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 240),
                    curve: Curves.easeOutCubic,
                    scale: scale,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 220),
                      opacity: opacity,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 240),
                        curve: Curves.easeOutCubic,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: shadow,
                              spreadRadius: isActive ? 2 : 0,
                              color: Colors.black.withValues(alpha: isActive ? 0.28 : 0.12),
                              offset: Offset(0, isActive ? 14 : 8),
                            ),
                          ],
                        ),
                        child: MouseRegion(
                          onEnter: (_) {
                            if (_activeIndex != card.index) {
                              setState(() {
                                _activeIndex = card.index;
                                _dragDx = 0;
                              });
                            }
                          },
                          child: GalleryPainterCard(
                            title: widget.items[card.index].title,
                            imageUrl: widget.items[card.index].imageUrl,
                            onTap: () {
                              setState(() {
                                _activeIndex = card.index;
                                _dragDx = 0;
                              });
                              widget.items[card.index].onTap();
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  int _wrapIndex(int index) {
    final len = widget.items.length;
    if (len == 0) return 0;
    return (index % len + len) % len;
  }
}

class _VisibleCard {
  final int index;
  final double offset;

  const _VisibleCard({
    required this.index,
    required this.offset,
  });
}
