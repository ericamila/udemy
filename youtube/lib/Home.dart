import 'package:flutter/material.dart';
import 'package:yoputube/telas/Biblioteca.dart';
import 'package:yoputube/telas/EmAlta.dart';
import 'package:yoputube/telas/Inicio.dart';
import 'package:yoputube/telas/Inscricao.dart';

import 'componentes/CustomSearchDelegate.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  String? _resultado = "";

  @override
  Widget build(BuildContext context) {


    List<Widget> telas = [
      Inicio(_resultado!),
      EmAlta(),
      Inscricao(),
      Biblioteca(),
    ];
    print('resultado: Home ${_resultado}');
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.grey,
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          "imagens/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: [
      /*    IconButton(
            onPressed: () {
              print("ação: videocam");
            },
            icon: Icon(Icons.videocam),
          ),*/
          IconButton(
            onPressed: () async{
              String? res = await showSearch(context: context, delegate: CustomSearchDelegate());
              setState(() {
                _resultado = res;
              });
              print('resultado: digitado ${res}');
            },
            icon: Icon(Icons.search),
          ),
        /*  IconButton(
            onPressed: () {
              print("ação: conta");
            },
            icon: Icon(Icons.account_circle),
          ),*/
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice) {
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: const [
          BottomNavigationBarItem(
            label: "Início",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Em alta",
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            label: "Inscrições",
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            label: "Biblioteca",
            icon: Icon(Icons.folder),
          ),
        ],
      ),
    );
  }
}
