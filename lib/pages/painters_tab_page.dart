import 'package:flutter/material.dart';
import 'package:painter_ebook/data/painter_data.dart';
import 'package:painter_ebook/pages/painter_detail_page.dart';
import 'package:painter_ebook/widgets/painter_grid_card.dart';
import 'package:painter_ebook/widgets/section_header.dart';

class PaintersTabPage extends StatelessWidget {
  const PaintersTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 18, 16, 6),
          child: SectionHeader(
            title: 'All Painters',
            subtitle: 'Tap any entry to open a full chapter.',
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 30),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.74,
            ),
            itemCount: painters.length,
            itemBuilder: (context, index) {
              final painter = painters[index];
              return PainterGridCard(
                painter: painter,
                onTap: () => Navigator.push(
                  context,
                  PageRouteBuilder(
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
    );
  }
}
