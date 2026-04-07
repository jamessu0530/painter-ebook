import 'package:flutter/material.dart';
import 'package:painter_ebook/models/painter.dart';

const List<Painter> painters = [
  Painter(
    name: 'Georges Seurat',
    chineseName: '秀拉',
    birthYear: 1859,
    deathYear: 1891,
    nationality: 'French',
    artMovement: 'Post-Impressionism / Pointillism',
    famousWorks: [
      '大碗島的星期日下午 A Sunday Afternoon on the Island of La Grande Jatte',
      '阿尼埃爾浴場 Une Baignade, Asnières',
      '馬戲團 (The Circus)',
    ],
    description:
        '秀拉是點描派與新印象派的代表人物，主張以色點排列來產生光學混色效果。'
        '他的畫面結構嚴謹、節奏安靜，常呈現理性與秩序感。'
        '雖然創作生涯短暫，但他對色彩理論與現代繪畫的影響非常深遠。',
    heroImageUrl: 'assets/images/seurat_a_sunday_afternoon.jpg',
    galleryImageUrl: 'assets/images/seurat_une_baignade_asnieres.jpg',
    accentColor: Color(0xFFB05E3C),
  ),
  Painter(
    name: 'Rembrandt',
    chineseName: '林布蘭',
    birthYear: 1606,
    deathYear: 1669,
    nationality: 'Dutch',
    artMovement: 'Dutch Golden Age / Baroque',
    famousWorks: [
      '夜巡 The Night Watch',
      '杜普教授的解剖課 The Anatomy Lesson of Dr. Nicolaes Tulp',
      '浪子回頭 (The Return of the Prodigal Son)',
    ],
    description:
        '林布蘭以強烈的明暗對比聞名，擅長用光線塑造戲劇張力與人物心理。'
        '他的肖像與自畫像細膩呈現人性的脆弱、榮耀與衰老。'
        '在巴洛克繪畫史中，他是兼具技法與情感深度的大師。',
    heroImageUrl: 'assets/images/rembrandt_the_night_watch.jpg',
    galleryImageUrl: 'assets/images/rembrandt_the_anatomy_lesson.jpg',
    accentColor: Color(0xFF5A4636),
  ),
  Painter(
    name: 'Johannes Vermeer',
    chineseName: '維梅爾',
    birthYear: 1632,
    deathYear: 1675,
    nationality: 'Dutch',
    artMovement: 'Dutch Golden Age',
    famousWorks: [
      '戴珍珠耳環的少女 Girl with a Pearl Earring',
      '倒牛奶的女僕 The Milkmaid',
      '台夫特風景 (View of Delft)',
    ],
    description:
        '維梅爾以室內場景與自然光表現聞名，畫面安靜卻富有情緒。'
        '他對光線、材質與空間距離的掌握非常精準，色彩清透細緻。'
        '雖然作品數量不多，但每一幅都具有高度完成度與詩意。',
    heroImageUrl: 'assets/images/vermeer_girl_with_a_pearl_earring.jpg',
    galleryImageUrl: 'assets/images/vermeer_the_milkmaid.png',
    accentColor: Color(0xFF2E4A7D),
  ),
  Painter(
    name: 'Paul Gauguin',
    chineseName: '高更',
    birthYear: 1848,
    deathYear: 1903,
    nationality: 'French',
    artMovement: 'Post-Impressionism / Symbolism',
    famousWorks: [
      '神之日 Mahana no atua',
      '你好，瑪麗亞 Ia Orana Maria',
      '我們從何處來？我們是誰？我們往何處去？ Where Do We Come From? What Are We? Where Are We Going?',
    ],
    description:
        '高更以大膽色塊、平面化構圖與象徵語言建立了獨特風格。'
        '他追求非寫實的情感與精神性表現，對後印象派發展影響很大。'
        '其大溪地時期作品在藝術史上重要，但也常被當代視角重新討論。',
    heroImageUrl: 'assets/images/gauguin_mahana_no_atua.jpg',
    galleryImageUrl: 'assets/images/gauguin_ia_orana_maria.jpg',
    accentColor: Color(0xFF73428E),
  ),
  Painter(
    name: 'Edward Hopper',
    chineseName: '霍普',
    birthYear: 1882,
    deathYear: 1967,
    nationality: 'American',
    artMovement: 'American Realism',
    famousWorks: [
      '夜鷹 Nighthawks',
      '清晨的陽光 Morning Sun',
      '加油站 (Gas)',
    ],
    description:
        '霍普擅長描繪現代城市中的孤獨感與疏離感。'
        '他用精準構圖與冷靜光線，讓日常場景帶有電影般敘事。'
        '作品中的沉默與距離，成為20世紀美國繪畫的重要語言。',
    heroImageUrl: 'assets/images/hopper_nighthawks.jpg',
    galleryImageUrl: 'assets/images/hopper_morning_sun.jpg',
    accentColor: Color(0xFF305A58),
  ),
  Painter(
    name: 'Gustave Caillebotte',
    chineseName: '卡耶博特',
    birthYear: 1848,
    deathYear: 1894,
    nationality: 'French',
    artMovement: 'Impressionism',
    famousWorks: [
      '巴黎街道，雨天 Paris Street; Rainy Day',
      '刨地板的人 The Floor Scrapers',
      '歐洲橋 (Le Pont de l Europe)',
    ],
    description:
        '卡耶博特的巴黎街景作品具有強烈透視與現代都市視角。'
        '他融合寫實技巧與印象派的光色觀察，畫面兼具秩序與氣氛。'
        '除了創作，他也在資助印象派畫家方面扮演重要角色。',
    heroImageUrl: 'assets/images/caillebotte_paris_street_rainy_day.jpg',
    galleryImageUrl: 'assets/images/caillebotte_the_floor_scrapers.jpg',
    accentColor: Color(0xFF4B687B),
  ),
  Painter(
    name: 'Edgar Degas',
    chineseName: '德加',
    birthYear: 1834,
    deathYear: 1917,
    nationality: 'French',
    artMovement: 'Impressionism',
    famousWorks: [
      '舞蹈課 The Dance Class',
      '星 L’Étoile (The Star)',
      '十四歲小舞者 (Little Dancer of Fourteen Years)',
    ],
    description:
        '德加長期關注舞者與劇場題材，善於捕捉身體動作的瞬間。'
        '他並不浪漫化舞台，而是描繪排練、疲憊與重複訓練的真實感。'
        '在油畫、粉彩與雕塑之間的跨媒材實驗，拓展了印象派表現方式。',
    heroImageUrl: 'assets/images/degas_the_dance_class.jpg',
    galleryImageUrl: 'assets/images/degas_l_etoile_the_star.jpg',
    accentColor: Color(0xFF845A5D),
  ),
  Painter(
    name: 'John Singer Sargent',
    chineseName: '薩金特',
    birthYear: 1856,
    deathYear: 1925,
    nationality: 'American',
    artMovement: 'Portraiture / Impressionist Influence',
    famousWorks: [
      '卡納西翁夫人 Portrait of Madame X',
      '康乃馨、百合、百合、玫瑰 Carnation, Lily, Lily, Rose',
      '佛朗明哥舞 (El Jaleo)',
    ],
    description:
        '薩金特是19世紀末極具代表性的肖像畫家，以流暢筆觸著稱。'
        '他在華麗外觀與人物心理之間取得平衡，特別擅長高階肖像。'
        '其筆觸速度與質感表現，讓人物具有強烈現場感。',
    heroImageUrl: 'assets/images/sargent_portrait_of_madame_x.jpg',
    galleryImageUrl: 'assets/images/sargent_carnation_lily_lily_rose.jpg',
    accentColor: Color(0xFF4B3C30),
  ),
  Painter(
    name: 'Pierre-Auguste Renoir',
    chineseName: '雷諾瓦',
    birthYear: 1841,
    deathYear: 1919,
    nationality: 'French',
    artMovement: 'Impressionism',
    famousWorks: [
      '紅磨坊的舞會 Bal du moulin de la Galette',
      '船上的午宴 Luncheon of the Boating Party',
      '鞦韆 (The Swing)',
    ],
    description:
        '雷諾瓦擅長描繪人物、聚會與戶外光線下的歡愉氛圍。'
        '他以溫暖色調與柔和筆觸呈現肌膚與空氣的流動感。'
        '作為印象派核心人物之一，他對人物畫的現代化有關鍵貢獻。',
    heroImageUrl: 'assets/images/renoir_bal_du_moulin_de_la_galette.jpg',
    galleryImageUrl: 'assets/images/renoir_luncheon_of_the_boating_party.jpg',
    accentColor: Color(0xFFA35E4D),
  ),
  Painter(
    name: 'J. M. W. Turner',
    chineseName: '透納',
    birthYear: 1775,
    deathYear: 1851,
    nationality: 'British',
    artMovement: 'Romanticism',
    famousWorks: [
      '戰艦無畏號 The Fighting Temeraire',
      '雨、蒸氣與速度 Rain, Steam and Speed',
      '奴隸船 (The Slave Ship)',
    ],
    description:
        '透納以風景與海景中的光、霧與氣候變化聞名。'
        '他常讓具體形體溶解在色彩與大氣中，形成接近抽象的視覺效果。'
        '這種對光與動態的實驗，深刻影響後續現代繪畫發展。',
    heroImageUrl: 'assets/images/turner_the_fighting_temeraire.jpg',
    galleryImageUrl: 'assets/images/turner_rain_steam_and_speed.jpg',
    accentColor: Color(0xFFD08B2D),
  ),
];
