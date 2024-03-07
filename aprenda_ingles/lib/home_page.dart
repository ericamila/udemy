import 'package:aprenda_ingles/bicho_page.dart';
import 'package:aprenda_ingles/numero_page.dart';
import 'package:aprenda_ingles/vogais_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aprenda inglês'),
        bottom: TabBar(
          indicatorWeight: 4,
          controller: _tabController,
          tabs: const [
            Text('Bichos'),
            Text('Números'),
            Text('Vogais'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Bichos(),
          Numeros(),
          Vogais(),
        ],
      ),
    );
  }
}
