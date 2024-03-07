import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.brown,
          foregroundColor: Colors.white70,
          titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      tabBarTheme: const TabBarTheme(
        labelStyle: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(
            color: Colors.white70, fontSize: 17),
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.amber[100],
    ),
    home: const Home(),
  ));
}
