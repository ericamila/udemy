import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String titulo;

  const Home({super.key, required this.titulo});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.titulo,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //floatingActionButton: FloatingActionButton(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        elevation: 6,
        //mini: true,
        onPressed: () {
          print("resultado : botao pressionado");
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        //p Círculo
        //child: const Icon(Icons.add),
        icon: Icon(Icons.add_shopping_cart),
        label: Text("Adicionar"),
        /*shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),*/
      ),
      bottomNavigationBar: BottomAppBar(
        //shape: CircularNotchedRectangle(), //LEGAL
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
            ),
          ],
        ),
      ),
    );
  }
}
