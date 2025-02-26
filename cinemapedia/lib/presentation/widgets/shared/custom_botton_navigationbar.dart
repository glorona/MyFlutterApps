import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottonNavigationbar extends StatelessWidget {
  final int currentIndex;
  const CustomBottonNavigationbar({super.key, required this.currentIndex});

  void onItemTapped(BuildContext context, int index) {
    context.go('/home/$index');
  }



  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        elevation: 0,
        currentIndex: currentIndex,
        onTap: (value) => onItemTapped(context, value),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_max), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.label_outlined), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline_rounded), label: 'Favorites')
        ]);
  }
}
