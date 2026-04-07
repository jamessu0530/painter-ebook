import 'package:flutter/material.dart';
import 'package:painter_ebook/pages/about_tab_page.dart';
import 'package:painter_ebook/pages/gallery_tab_page.dart';
import 'package:painter_ebook/pages/home_tab_page.dart';
import 'package:painter_ebook/pages/painters_tab_page.dart';
import 'package:painter_ebook/services/home_bgm_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 4,
      child: _HomePageShell(),
    );
  }
}

class _HomePageShell extends StatefulWidget {
  const _HomePageShell();

  @override
  State<_HomePageShell> createState() => _HomePageShellState();
}

class _HomePageShellState extends State<_HomePageShell> {
  TabController? _tabController;
  bool _bgmReady = false;

  @override
  void initState() {
    super.initState();
    _initBgm();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final next = DefaultTabController.of(context);
    if (_tabController == next) return;
    _tabController?.removeListener(_handleTabChange);
    _tabController = next;
    _tabController?.addListener(_handleTabChange);
    _syncBgmWithCurrentTab();
  }

  Future<void> _initBgm() async {
    try {
      await HomeBgmController.init();
      if (mounted) setState(() => _bgmReady = true);
      _syncBgmWithCurrentTab();
    } catch (_) {
      if (mounted) setState(() => _bgmReady = false);
    }
  }

  void _syncBgmWithCurrentTab() {
    final controller = _tabController;
    if (!_bgmReady || controller == null) return;
    HomeBgmController.play();
  }

  void _handleTabChange() {
    _syncBgmWithCurrentTab();
  }

  @override
  void dispose() {
    _tabController?.removeListener(_handleTabChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Painter E-Book'),
        bottom: const TabBar(
          tabs: [
            Tab(text: 'Home'),
            Tab(text: 'Painters'),
            Tab(text: 'Gallery'),
            Tab(text: 'Museum'),
          ],
        ),
      ),
      body: const TabBarView(
        children: [
          HomeTabPage(),
          PaintersTabPage(),
          GalleryTabPage(),
          AboutTabPage(),
        ],
      ),
    );
  }
}
