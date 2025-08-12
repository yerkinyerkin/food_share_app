import 'package:flutter/material.dart';
import 'package:food_share_app/core/styles/color_styles.dart';
import 'package:food_share_app/features/profile/screens/profile_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key, required this.index});
  final int index;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int _currentIndex = widget.index;

  final List<Widget> _pages = const [
    Scaffold(),
    Scaffold(),
    Scaffold(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    if (_currentIndex == index) return;
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.whiteColor,
      body: IndexedStack(index: _currentIndex, children: _pages),

      // ▼ Custom pill bottom bar (replaces BottomNavigationBar)
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        child: Container(
          height: 64,
          decoration: BoxDecoration(
            color: const Color(0xFF6F6F6F),           
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              _BarItem(
                index: 0,
                current: _currentIndex,
                label: 'Главная',
                asset: 'assets/images/png/home_logo.png',
                onTap: _onItemTapped,
              ),
              _BarItem(
                index: 1,
                current: _currentIndex,
                label: 'Каталог',
                asset: 'assets/images/png/catalog_logo.png',
                onTap: _onItemTapped,
              ),
              _BarItem(
                index: 2,
                current: _currentIndex,
                label: 'Корзина',
                asset: 'assets/images/png/shopping_logo.png',
                onTap: _onItemTapped,
              ),
              _BarItem(
                index: 3,
                current: _currentIndex,
                label: 'Профиль',
                asset: 'assets/images/png/profile_logo.png',
                onTap: _onItemTapped,
              ),
            ],
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _BarItem extends StatelessWidget {
  const _BarItem({
    required this.index,
    required this.current,
    required this.label,
    required this.asset,
    required this.onTap,
  });

  final int index;
  final int current;
  final String label;
  final String asset;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final bool active = index == current;

    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: () => onTap(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon (active → white icon inside green circle)
            Container(
              width: 38,
              height: 32,
              decoration: BoxDecoration(
                color: active ? ColorStyles.primaryColor : Colors.transparent,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Image.asset(
                asset,
                width: 18,
                height: 18,
                color: Colors.white,
                colorBlendMode: BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 8,
                height: 1.1,
                color: Colors.white.withOpacity(active ? 1.0 : 0.9),
                fontWeight: active ? FontWeight.w400 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
