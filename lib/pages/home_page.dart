import 'package:flutter/material.dart';
import 'package:painter_ebook/pages/about_tab_page.dart';
import 'package:painter_ebook/pages/gallery_tab_page.dart';
import 'package:painter_ebook/pages/home_tab_page.dart';
import 'package:painter_ebook/pages/painters_tab_page.dart';
import 'package:painter_ebook/services/home_bgm_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  bool _bgmReady = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabChange);
    _initBgm();
  }

  Future<void> _initBgm() async {
    try {
      await HomeBgmController.init();
      await HomeBgmController.play();
      if (mounted) setState(() => _bgmReady = true);
    } catch (_) {
      if (mounted) setState(() => _bgmReady = false);
    }
  }

  void _handleTabChange() {
    if (!_bgmReady || _tabController.indexIsChanging) return;
    if (_tabController.index == 0) {
      HomeBgmController.play();
    } else {
      HomeBgmController.pause();
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Painter E-Book'),
        bottom: TabBar(
          controller: _tabController,
            tabs: [
              Tab(text: 'Home'),
              Tab(text: 'Painters'),
              Tab(text: 'Gallery'),
              Tab(text: 'Museum'),
            ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          HomeTabPage(),
          PaintersTabPage(),
          GalleryTabPage(),
          AboutTabPage(),
        ],
      ),
    );
  }
}
