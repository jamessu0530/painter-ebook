import 'package:flutter/material.dart';
import 'package:painter_ebook/pages/about_tab_page.dart';
import 'package:painter_ebook/pages/gallery_tab_page.dart';
import 'package:painter_ebook/pages/home_tab_page.dart';
import 'package:painter_ebook/pages/painters_tab_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
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
      ),
    );
  }
}
