import 'package:flutter/material.dart';
import 'favorite_page.dart';
import 'home_page_tab.dart';
import 'discover_page.dart';
import '../utils/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  // Daftar halaman TIDAK BISA 'static const' lagi
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    // Inisialisasi _pages di sini
    _pages = <Widget>[
      // Kirim fungsi _onItemTapped(1) ke HomePageTab
      HomePageTab(
        onSeeAllPressed: () => _onItemTapped(1),
      ),
      const DiscoverPage(),
      const FavoritePage(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages, // Gunakan _pages yang sudah di-init
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            activeIcon: Icon(Icons.explore),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            activeIcon: Icon(Icons.bookmark),
            label: 'Save',
          ),
        ],
      ),
    );
  }
}