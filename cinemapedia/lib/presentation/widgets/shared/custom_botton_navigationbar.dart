import 'package:flutter/material.dart';

class CustomBottonNavigationbar extends StatelessWidget {
  const CustomBottonNavigationbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: [
      BottomNavigationBarItem(icon: Icon(Icons.home_max), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.label_outlined), label: 'Categories'),
      BottomNavigationBarItem(icon: Icon(Icons.favorite_outline_rounded), label: 'Favorites')
    ]);
  }
}
