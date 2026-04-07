import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:painter_ebook/data/artwork_intro_data.dart';
import 'package:painter_ebook/models/painter.dart';
import 'package:painter_ebook/services/home_bgm_controller.dart';
import 'package:painter_ebook/widgets/artwork_image.dart';

class PainterDetailPage extends StatefulWidget {
  final Painter painter;

  const PainterDetailPage({super.key, required this.painter});

  @override
  State<PainterDetailPage> createState() => _PainterDetailPageState();
}

class _PainterDetailPageState extends State<PainterDetailPage> {
  final AudioPlayer _player = AudioPlayer();

  static const Map<String, String> _audioByPainter = {
    'rembrandt': 'assets/audio/rembrandt.m4a',
    'vermeer': 'assets/audio/vermeer.m4a',
    'turner': 'assets/audio/turner.m4a',
    'renoir': 'assets/audio/renoir.m4a',
    'degas': 'assets/audio/degas.m4a',
    'gauguin': 'assets/audio/gauguin.m4a',
    'caillebotte': 'assets/audio/caillebotte.m4a',
    'seurat': 'assets/audio/seurat.m4a',
    'sargent': 'assets/audio/sargent.m4a',
    'hopper': 'assets/audio/hopper.m4a',
  };

  @override
  void initState() {
    super.initState();
    HomeBgmController.pause();
    _initAudio();
  }

  String? _assetForPainter(String name) {
    final key = name.toLowerCase();
    for (final entry in _audioByPainter.entries) {
      if (key.contains(entry.key)) return entry.value;
    }
    return null;
  }

  Future<void> _initAudio() async {
    final asset = _assetForPainter(widget.painter.name);
    if (asset == null) return;
    try {
      await _player.setAsset(asset);
      await _player.setLoopMode(LoopMode.one);
      await _player.play();
    } catch (_) {}
  }

  String _introForWork(String work) {
    return artworkIntroByTitle[work] ?? '這件作品是該畫家風格的重要代表，建議搭配章節內容閱讀其構圖與時代背景。';
  }

  void _showImageIntro({
    required String title,
    required String intro,
  }) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (_) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              intro,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.45),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _player.stop();
    _player.dispose();
    HomeBgmController.play();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 320,
            pinned: true,
            surfaceTintColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              title: Text(
                widget.painter.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => _showImageIntro(
                        title: '${widget.painter.name}｜章節主視覺',
                        intro:
                            '這張 Hero 圖用來代表 ${widget.painter.name} 的整體風格與時代氣氛。'
                            '建議先閱讀下方「章節介紹」，再回看畫面中的光線、色調與構圖。',
                      ),
                      child: ArtworkImage(
                        imageUrl: widget.painter.heroImageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.18),
                          Colors.black.withValues(alpha: 0.72),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 18, 16, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.painter.chineseName,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${widget.painter.birthYear} - ${widget.painter.deathYear}  •  ${widget.painter.nationality}',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.painter.artMovement,
                    style: TextStyle(
                      color: widget.painter.accentColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 22),
                  Text('章節介紹', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 8),
                  Text(widget.painter.description, style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: 22),
                  Text('代表作品', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 10),
                  ...widget.painter.famousWorks.map(
                    (work) => Card(
                      margin: const EdgeInsets.only(bottom: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              work,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              _introForWork(work),
                              style: TextStyle(
                                color: Colors.grey.shade800,
                                height: 1.45,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text('畫家的畫', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 260,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
                      separatorBuilder: (context, index) => const SizedBox(width: 14),
                      itemBuilder: (context, index) {
                        final isHero = index == 0;
                        final imageUrl = isHero
                            ? widget.painter.heroImageUrl
                            : widget.painter.galleryImageUrl;
                        final workTitle = widget.painter.famousWorks[index];
                        return _PainterWorkCard(
                          imageUrl: imageUrl,
                          painterName: widget.painter.name,
                          workTitle: workTitle,
                          onTap: () => _showImageIntro(
                            title: workTitle,
                            intro: _introForWork(workTitle),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 14),
                  TextButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('返回電子書'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PainterWorkCard extends StatelessWidget {
  const _PainterWorkCard({
    required this.imageUrl,
    required this.painterName,
    required this.workTitle,
    required this.onTap,
  });

  final String imageUrl;
  final String painterName;
  final String workTitle;
  final VoidCallback onTap;

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
                imageUrl: imageUrl,
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
                      painterName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      workTitle,
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
