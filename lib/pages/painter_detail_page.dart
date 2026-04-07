import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
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

  static const Map<String, Map<String, String>> _artworkIntros = {
    'Georges Seurat': {
      '大碗島的星期日下午 A Sunday Afternoon on the Island of La Grande Jatte':
          '秀拉以點描法建構出安靜卻緊張的都市休閒場景，色點在視覺中混色，展現科學化的光色實驗。',
      '阿尼埃爾浴場 Une Baignade, Asnières':
          '畫面描繪塞納河畔青年休憩的片刻，以穩定構圖與明亮空氣感，呈現工業時代下的新城市生活。',
      '馬戲團 (The Circus)':
          '晚期作品，節奏更強、構圖更動態，透過點描與曲線張力營造舞台的速度與眩目感。',
    },
    'Rembrandt': {
      '夜巡 The Night Watch':
          '林布蘭以戲劇性光線打破傳統群像的靜態排列，讓人物像在舞台上被瞬間點亮，充滿敘事動能。',
      '杜普教授的解剖課 The Anatomy Lesson of Dr. Nicolaes Tulp':
          '作品結合科學觀察與群像心理，透過視線導引與明暗層次，讓知識、權威與好奇心同時出場。',
      '浪子回頭 (The Return of the Prodigal Son)':
          '以溫柔厚重的光影描繪寬恕與悔悟，被視為林布蘭晚年最具精神深度的宗教題材之一。',
    },
    'Johannes Vermeer': {
      '戴珍珠耳環的少女 Girl with a Pearl Earring':
          '維梅爾以極簡背景與柔和轉身瞬間，讓少女神情成為焦點；珍珠與肌膚受光細節極為精準。',
      '倒牛奶的女僕 The Milkmaid':
          '日常勞動場景被提升為詩意時刻，光線落在牆面與麵包質地上，展現維梅爾對材質的敏銳觀察。',
      '台夫特風景 (View of Delft)':
          '以寧靜城市全景捕捉雲影與水面反光，被視為荷蘭城市風景畫中最具氣氛與秩序感的名作之一。',
    },
    'Paul Gauguin': {
      '神之日 Mahana no atua':
          '融合大溪地文化意象與宗教象徵，使用非自然主義色彩，強化精神性與儀式感。',
      '你好，瑪麗亞 Ia Orana Maria':
          '把基督教主題與南洋語境並置，呈現跨文化視覺語言，也是高更象徵主義的重要代表。',
      '我們從何處來？我們是誰？我們往何處去？ Where Do We Come From? What Are We? Where Are We Going?':
          '高更以大型象徵構圖回應生命命題，色塊與人物姿態共同形成哲學式敘事。',
    },
    'Edward Hopper': {
      '夜鷹 Nighthawks':
          '以夜間街角餐館的冷光與玻璃分隔，刻畫現代都市中的孤獨與距離感。',
      '清晨的陽光 Morning Sun':
          '簡化空間與色塊，透過人物坐姿與光線方向，傳達安靜卻略帶疏離的心理狀態。',
      '加油站 (Gas)':
          '黃昏公路旁的人造光源與自然暗色交界，象徵現代文明與荒野邊界的微妙張力。',
    },
    'Gustave Caillebotte': {
      '巴黎街道，雨天 Paris Street; Rainy Day':
          '以近乎攝影般透視描繪奧斯曼改造後的巴黎，雨天氛圍與都市節奏兼具。',
      '刨地板的人 The Floor Scrapers':
          '少見地以勞動者為主角，強調室內光線與肌理，展現卡耶博特寫實面向。',
      '歐洲橋 (Le Pont de l Europe)':
          '鐵橋結構與人物動線交錯，反映19世紀工業城市的新視覺經驗。',
    },
    'Edgar Degas': {
      '舞蹈課 The Dance Class':
          '德加關注排練時刻而非完美演出，透過非對稱構圖與切角視點呈現身體訓練的真實。',
      '星 L’Étoile (The Star)':
          '舞台聚光把主角推向視覺中心，同時在陰影中保留後台壓力與觀演關係。',
      '十四歲小舞者 (Little Dancer of Fourteen Years)':
          '以雕塑揭示芭蕾體系下的紀律與社會現實，兼具美感與批判意味。',
    },
    'John Singer Sargent': {
      '卡納西翁夫人 Portrait of Madame X':
          '以銳利輪廓與高反差黑裙塑造強烈氣場，曾因姿態與時尚感引發爭議。',
      '康乃馨、百合、百合、玫瑰 Carnation, Lily, Lily, Rose':
          '捕捉黃昏短暫光線的戶外作品，色彩細膩、氣氛溫柔，是薩金特抒情面代表作。',
      '佛朗明哥舞 (El Jaleo)':
          '藉由舞者姿態與樂手節奏形成舞台張力，筆觸快速而富戲劇性。',
    },
    'Pierre-Auguste Renoir': {
      '紅磨坊的舞會 Bal du moulin de la Galette':
          '以閃爍斑駁的戶外光與人群互動，呈現巴黎週末社交生活的活力。',
      '船上的午宴 Luncheon of the Boating Party':
          '人物關係與空間層次交織，暖色調與自然光讓整體氛圍愉悅而親密。',
      '鞦韆 (The Swing)':
          '透過人物姿態與光斑筆觸，描繪印象派典型的瞬間感與輕盈空氣。',
    },
    'J. M. W. Turner': {
      '戰艦無畏號 The Fighting Temeraire':
          '以退役帆船與蒸汽拖船對照，象徵舊時代落幕與工業時代崛起。',
      '雨、蒸氣與速度 Rain, Steam and Speed':
          '把速度、天氣與機械動能融成一體，展現透納近乎抽象的光色處理。',
      '奴隸船 (The Slave Ship)':
          '以激烈海象與血色夕陽控訴奴隸貿易，情緒與道德立場同樣強烈。',
    },
  };

  String _introForWork(String work) {
    final byPainter = _artworkIntros[widget.painter.name];
    if (byPainter == null) return '這件作品是該畫家風格的重要代表，建議搭配章節內容閱讀其構圖與時代背景。';
    return byPainter[work] ?? '這件作品展現了畫家在題材、光線與筆觸上的核心特徵。';
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
