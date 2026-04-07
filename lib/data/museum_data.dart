import 'package:painter_ebook/models/museum.dart';

const List<Museum> museums = [
  Museum(
    name: 'Art Institute of Chicago',
    location: '美國・芝加哥',
    image: 'assets/images/museums/art_institute_of_chicago.jpg',
    description: '美國最重要的藝術博物館之一，收藏大量印象派與後印象派經典作品。',
    dashboardTier: MuseumDashboardTier.featured,
    featuredArtworks: [
      MuseumArtwork(
        title: 'A Sunday Afternoon on the Island of La Grande Jatte',
        painter: 'Georges Seurat',
        museumName: 'Art Institute of Chicago',
      ),
      MuseumArtwork(
        title: 'Mahana no atua',
        painter: 'Paul Gauguin',
        museumName: 'Art Institute of Chicago',
      ),
      MuseumArtwork(
        title: 'Nighthawks',
        painter: 'Edward Hopper',
        museumName: 'Art Institute of Chicago',
      ),
      MuseumArtwork(
        title: 'Paris Street; Rainy Day',
        painter: 'Gustave Caillebotte',
        museumName: 'Art Institute of Chicago',
      ),
    ],
  ),
  Museum(
    name: 'The National Gallery',
    location: '英國・倫敦',
    image: 'assets/images/museums/national_gallery_london.jpg',
    description: '位於倫敦市中心的世界級公共美術館，以十三世紀至二十世紀初的歐洲繪畫聞名。',
    dashboardTier: MuseumDashboardTier.standard,
    featuredArtworks: [
      MuseumArtwork(
        title: 'Une Baignade, Asnieres',
        painter: 'Georges Seurat',
        museumName: 'The National Gallery',
      ),
      MuseumArtwork(
        title: 'The Fighting Temeraire',
        painter: 'J. M. W. Turner',
        museumName: 'The National Gallery',
      ),
      MuseumArtwork(
        title: 'Rain, Steam and Speed',
        painter: 'J. M. W. Turner',
        museumName: 'The National Gallery',
      ),
    ],
  ),
  Museum(
    name: 'Rijksmuseum',
    location: '荷蘭・阿姆斯特丹',
    image: 'assets/images/museums/rijksmuseum_amsterdam.jpg',
    description: '荷蘭國家博物館，以荷蘭黃金時代繪畫與歷史名作著稱。',
    dashboardTier: MuseumDashboardTier.compact,
    featuredArtworks: [
      MuseumArtwork(
        title: 'The Night Watch',
        painter: 'Rembrandt',
        museumName: 'Rijksmuseum',
      ),
      MuseumArtwork(
        title: 'The Milkmaid',
        painter: 'Johannes Vermeer',
        museumName: 'Rijksmuseum',
      ),
    ],
  ),
  Museum(
    name: 'Mauritshuis',
    location: '荷蘭・海牙',
    image: 'assets/images/museums/mauritshuis_the_hague.jpg',
    description: '館舍精緻的皇家美術館，收藏多件荷蘭代表作，包含維梅爾與林布蘭的重要作品。',
    dashboardTier: MuseumDashboardTier.standard,
    featuredArtworks: [
      MuseumArtwork(
        title: 'The Anatomy Lesson of Dr. Nicolaes Tulp',
        painter: 'Rembrandt',
        museumName: 'Mauritshuis',
      ),
      MuseumArtwork(
        title: 'Girl with a Pearl Earring',
        painter: 'Johannes Vermeer',
        museumName: 'Mauritshuis',
      ),
    ],
  ),
  Museum(
    name: 'The Metropolitan Museum of Art',
    location: '美國・紐約',
    image: 'assets/images/museums/metropolitan_museum_new_york.jpg',
    description: '世界最大型博物館之一，館藏跨越多個時代與地域，類型完整而龐大。',
    dashboardTier: MuseumDashboardTier.featured,
    featuredArtworks: [
      MuseumArtwork(
        title: 'Ia Orana Maria',
        painter: 'Paul Gauguin',
        museumName: 'The Metropolitan Museum of Art',
      ),
      MuseumArtwork(
        title: 'The Dance Class',
        painter: 'Edgar Degas',
        museumName: 'The Metropolitan Museum of Art',
      ),
      MuseumArtwork(
        title: 'Portrait of Madame X',
        painter: 'John Singer Sargent',
        museumName: 'The Metropolitan Museum of Art',
      ),
    ],
  ),
  Museum(
    name: 'Columbus Museum of Art',
    location: '美國・哥倫布',
    image: 'assets/images/museums/columbus_museum_of_art.jpg',
    description: '俄亥俄州重要的區域美術館，兼具美國藝術與現代藝術收藏強項。',
    dashboardTier: MuseumDashboardTier.compact,
    featuredArtworks: [
      MuseumArtwork(
        title: 'Morning Sun',
        painter: 'Edward Hopper',
        museumName: 'Columbus Museum of Art',
      ),
    ],
  ),
  Museum(
    name: "Musee d'Orsay",
    location: '法國・巴黎',
    image: 'assets/images/museums/musee_dorsay_paris.jpg',
    description: '由舊火車站改建而成，是印象派與後印象派藝術的重要殿堂。',
    dashboardTier: MuseumDashboardTier.featured,
    featuredArtworks: [
      MuseumArtwork(
        title: 'The Floor Scrapers',
        painter: 'Gustave Caillebotte',
        museumName: "Musee d'Orsay",
      ),
      MuseumArtwork(
        title: 'L Etoile (The Star)',
        painter: 'Edgar Degas',
        museumName: "Musee d'Orsay",
      ),
      MuseumArtwork(
        title: 'Bal du moulin de la Galette',
        painter: 'Pierre-Auguste Renoir',
        museumName: "Musee d'Orsay",
      ),
    ],
  ),
  Museum(
    name: 'Tate Britain',
    location: '英國・倫敦',
    image: 'assets/images/museums/tate_britain_london.jpg',
    description: '英國藝術國家級美術館，作品橫跨都鐸時期至當代。',
    dashboardTier: MuseumDashboardTier.compact,
    featuredArtworks: [
      MuseumArtwork(
        title: 'Carnation, Lily, Lily, Rose',
        painter: 'John Singer Sargent',
        museumName: 'Tate Britain',
      ),
    ],
  ),
  Museum(
    name: 'The Phillips Collection',
    location: '美國・華盛頓特區',
    image: 'assets/images/museums/phillips_collection_dc.jpg',
    description: '被譽為美國第一座現代藝術博物館，以親密展廳尺度與十九、二十世紀收藏見長。',
    dashboardTier: MuseumDashboardTier.standard,
    featuredArtworks: [
      MuseumArtwork(
        title: 'Luncheon of the Boating Party',
        painter: 'Pierre-Auguste Renoir',
        museumName: 'The Phillips Collection',
      ),
    ],
  ),
];

/// Total featured artworks across all museums in this app.
final int totalFeaturedArtworks =
    museums.fold(0, (sum, m) => sum + m.featuredCount);
