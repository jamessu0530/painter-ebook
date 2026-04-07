import 'package:flutter/material.dart';
import 'package:painter_ebook/data/painter_data.dart';
import 'package:painter_ebook/widgets/artwork_image.dart';
import 'package:painter_ebook/widgets/section_header.dart';
import 'package:painter_ebook/widgets/stacked_gallery_view.dart';

class GalleryTabPage extends StatelessWidget {
  const GalleryTabPage({super.key});

  static const Map<String, String> _introByWork = {
    '大碗島的星期日下午 A Sunday Afternoon on the Island of La Grande Jatte': '秀拉以點描法建構出安靜卻緊張的都市休閒場景，色點在視覺中混色，展現科學化的光色實驗。',
    '阿尼埃爾浴場 Une Baignade, Asnières': '畫面描繪塞納河畔青年休憩的片刻，以穩定構圖與明亮空氣感呈現新城市生活。',
    '夜巡 The Night Watch': '林布蘭以戲劇性光線打破傳統群像的靜態排列，讓人物像在舞台上被瞬間點亮。',
    '杜普教授的解剖課 The Anatomy Lesson of Dr. Nicolaes Tulp': '作品結合科學觀察與群像心理，透過視線導引與明暗層次讓敘事更有張力。',
    '戴珍珠耳環的少女 Girl with a Pearl Earring': '維梅爾以極簡背景與柔和轉身瞬間，讓少女神情成為焦點。',
    '倒牛奶的女僕 The Milkmaid': '日常勞動場景被提升為詩意時刻，光線與材質描寫細膩。',
    '神之日 Mahana no atua': '融合大溪地文化意象與宗教象徵，色彩大膽，儀式感強烈。',
    '你好，瑪麗亞 Ia Orana Maria': '把基督教主題與南洋語境並置，呈現高更跨文化的象徵語言。',
    '夜鷹 Nighthawks': '以夜間街角餐館的冷光與玻璃分隔，刻畫現代都市中的孤獨感。',
    '清晨的陽光 Morning Sun': '透過人物坐姿與光線方向，傳達安靜卻略帶疏離的心理狀態。',
    '巴黎街道，雨天 Paris Street; Rainy Day': '近乎攝影般透視描繪奧斯曼改造後的巴黎，都市節奏鮮明。',
    '刨地板的人 The Floor Scrapers': '以勞動者為主角，強調室內光線與肌理，是卡耶博特代表作之一。',
    '舞蹈課 The Dance Class': '德加關注排練而非演出，透過切角視點呈現身體訓練的真實。',
    '星 L’Étoile (The Star)': '舞台聚光把主角推向中心，同時在陰影中保留後台壓力與距離。',
    '卡納西翁夫人 Portrait of Madame X': '以銳利輪廓與高反差黑裙塑造強烈氣場，曾引發巨大話題。',
    '康乃馨、百合、百合、玫瑰 Carnation, Lily, Lily, Rose': '捕捉黃昏短暫光線的戶外作品，色彩細膩、氛圍柔和。',
    '紅磨坊的舞會 Bal du moulin de la Galette': '以閃爍斑駁的戶外光與人群互動，呈現巴黎週末社交生活活力。',
    '船上的午宴 Luncheon of the Boating Party': '人物關係與空間層次交織，暖色調與自然光營造親密感。',
    '戰艦無畏號 The Fighting Temeraire': '以帆船與蒸汽拖船對照，象徵舊時代落幕與工業時代崛起。',
    '雨、蒸氣與速度 Rain, Steam and Speed': '把速度、天氣與機械動能融成一體，展現透納近乎抽象的光色處理。',
  };

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
                intro: _introByWork[heroTitle] ?? '此作品為 ${painter.name} 的代表作之一。',
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
                intro: _introByWork[galleryTitle] ?? '此作品為 ${painter.name} 的代表作之一。',
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
