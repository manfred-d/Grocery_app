import 'package:flutter/material.dart';
// import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/provider/dark_theme_provider.dart';
import 'package:grocery_app/screens/cart/cart_screen.dart';
import 'package:grocery_app/screens/categories.dart';
import 'package:grocery_app/screens/home_screen.dart';
import 'package:grocery_app/screens/user.dart';
import 'package:provider/provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  final List<Map<String,dynamic>> _pages = [
    {'Page': const HomeScreen(), 'title': 'Home Screen',},
    {'Page': const CategoriesScreen(), 'title': 'Categories Screen',},
    {'Page':  const CartScreen(), 'title': 'Cart Screen',},
    {'Page': const UserScreen(), 'title': 'User Screen',},
    
  ];

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool isDark = themeState.getDarkTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]["title"]),
      ),
      body: _pages[_selectedIndex]["Page"],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: isDark
              ? Theme.of(context).cardColor
              : Colors.white,
          type: BottomNavigationBarType.shifting,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          unselectedItemColor: isDark ?Colors.white10 : Colors.black12,
          selectedItemColor: isDark ? Colors.lightBlue.shade100 : Colors.black87,
          onTap: _selectedPage,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 0
                  ? Icons.home_rounded
                  : Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 0
                  ? Icons.category_outlined
                  : Icons.category_rounded),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              icon:
                  Icon(_selectedIndex == 0 ? Icons.shopping_cart : Icons.shopping_cart_checkout),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                  _selectedIndex == 0 ? Icons.person_2_outlined : Icons.person_2_rounded),
              label: "User",
            ),
          ]),
    );
  }
}
