import 'package:flutter/material.dart';

void main() {
  runApp(const PainterBookApp());
}

/// App 進入點
class PainterBookApp extends StatelessWidget {
  const PainterBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Painter E-Book',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

/// 畫家資料型別
class Painter {
  final String name;
  final String chineseName;
  final String famousWork;
  final String style;
  final String description;

  const Painter({
    required this.name,
    required this.chineseName,
    required this.famousWork,
    required this.style,
    required this.description,
  });
}

/// 假資料：10 位畫家
const List<Painter> painters = [
  Painter(
    name: 'Georges Seurat',
    chineseName: '秀拉',
    famousWork: 'A Sunday Afternoon on the Island of La Grande Jatte',
    style: '點描派 / 新印象派',
    description:
        '秀拉是新印象派的重要代表人物。他使用細小色點構成畫面，讓色彩在觀者眼中混合。作品重視結構與秩序，畫面安靜且理性。',
  ),
  Painter(
    name: 'Rembrandt',
    chineseName: '林布蘭',
    famousWork: 'The Night Watch',
    style: '巴洛克',
    description:
        '林布蘭是荷蘭黃金時代最具代表性的畫家之一。他擅長明暗對比，能強烈表現人物情感。自畫像與肖像作品對後世影響深遠。',
  ),
  Painter(
    name: 'Johannes Vermeer',
    chineseName: '維梅爾',
    famousWork: 'Girl with a Pearl Earring',
    style: '荷蘭黃金時代 / 寫實',
    description:
        '維梅爾以室內場景聞名，作品數量不多但品質極高。他善於描繪自然光線與寧靜氛圍，畫面細緻且富有詩意。',
  ),
  Painter(
    name: 'Paul Gauguin',
    chineseName: '高更',
    famousWork: 'Where Do We Come From? What Are We? Where Are We Going?',
    style: '後印象派 / 象徵主義',
    description:
        '高更追求原始與精神性的藝術表現，常使用大膽平塗色塊與簡化輪廓。在大溪地時期創作出許多重要作品。',
  ),
  Painter(
    name: 'Edward Hopper',
    chineseName: '霍普',
    famousWork: 'Nighthawks',
    style: '美國寫實主義',
    description:
        '霍普擅長描繪都市中的孤獨與疏離感。他利用光影與空間安排營造沉靜張力，呈現現代生活的心理狀態。',
  ),
  Painter(
    name: 'Gustave Caillebotte',
    chineseName: '卡耶博特',
    famousWork: 'Paris Street; Rainy Day',
    style: '印象派 / 都市題材',
    description:
        '卡耶博特以巴黎街景與現代生活場景著稱。他結合寫實技巧與印象派色彩觀察，構圖常帶有攝影般視角。',
  ),
  Painter(
    name: 'Edgar Degas',
    chineseName: '德加',
    famousWork: 'The Dance Class',
    style: '印象派',
    description:
        '德加常描繪芭蕾舞者、劇院與日常人物，重視動作瞬間與構圖節奏。除了油畫，也大量使用粉彩與素描。',
  ),
  Painter(
    name: 'John Singer Sargent',
    chineseName: '薩金特',
    famousWork: 'Madame X',
    style: '肖像畫 / 印象派影響',
    description:
        '薩金特是 19 世紀末非常著名的肖像畫家。他筆觸流暢，能快速抓住人物氣質，作品兼具華麗外觀與心理刻畫。',
  ),
  Painter(
    name: 'Pierre-Auguste Renoir',
    chineseName: '雷諾瓦',
    famousWork: 'Dance at Le Moulin de la Galette',
    style: '印象派',
    description:
        '雷諾瓦喜歡描繪人物、聚會與日常歡樂場景。他的色彩明亮溫暖、筆觸柔和，常呈現光線在人物肌膚上的變化。',
  ),
  Painter(
    name: 'J. M. W. Turner',
    chineseName: '透納',
    famousWork: 'The Fighting Temeraire',
    style: '浪漫主義',
    description:
        '透納以風景與海景聞名，特別重視光與氣氛。他晚期作品色彩奔放，對後來的現代繪畫發展有重要影響。',
  ),
];

/// 首頁：AppBar + TabBar + TabBarView
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Painter E-Book'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.list), text: '清單 List'),
              Tab(icon: Icon(Icons.grid_view), text: '格子 Grid'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            PainterListPage(),
            PainterGridPage(),
          ],
        ),
      ),
    );
  }
}

/// 清單分頁：ListView.separated + 自訂卡片
class PainterListPage extends StatelessWidget {
  const PainterListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: painters.length,
      separatorBuilder: (_, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final painter = painters[index];
        return PainterCard(
          painter: painter,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailPage(painter: painter),
              ),
            );
          },
        );
      },
    );
  }
}

/// 格子分頁：GridView.builder
class PainterGridPage extends StatelessWidget {
  const PainterGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: painters.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.05,
      ),
      itemBuilder: (context, index) {
        final painter = painters[index];
        return PainterGridCard(
          painter: painter,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailPage(painter: painter),
              ),
            );
          },
        );
      },
    );
  }
}

/// 自訂清單卡片（Card + InkWell）
class PainterCard extends StatelessWidget {
  final Painter painter;
  final VoidCallback onTap;

  const PainterCard({
    super.key,
    required this.painter,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.5,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              const CircleAvatar(
                child: Icon(Icons.palette),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${painter.name}（${painter.chineseName}）',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 4),
                    Text('代表作：${painter.famousWork}'),
                    Text('風格：${painter.style}'),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}

/// 自訂格子卡片（Card + InkWell）
class PainterGridCard extends StatelessWidget {
  final Painter painter;
  final VoidCallback onTap;

  const PainterGridCard({
    super.key,
    required this.painter,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.brush, size: 30),
              const SizedBox(height: 8),
              Text(
                painter.name,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                painter.chineseName,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 8),
              Text(
                painter.famousWork,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 詳細頁
class DetailPage extends StatelessWidget {
  final Painter painter;

  const DetailPage({super.key, required this.painter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(painter.chineseName),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  painter.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 6),
                Text(
                  '中文名：${painter.chineseName}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Divider(height: 24),
                Text('代表作：${painter.famousWork}'),
                const SizedBox(height: 8),
                Text('風格：${painter.style}'),
                const SizedBox(height: 14),
                Text(
                  '簡介',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 6),
                Text(
                  painter.description,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 20),
                TextButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('返回上一頁'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
