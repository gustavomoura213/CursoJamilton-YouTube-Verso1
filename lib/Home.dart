import 'dart:ui';

import 'package:flutter/material.dart';
import 'CustomSearchDelegate.dart';
import 'inscricoes.dart';
import 'inicio.dart';
import 'emAlta.dart';
import 'biblioteca.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  String res = "";
  String _resultado = "";
  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(_resultado),
      const EmAlta(),
      const Inscricoes(),
      const Biblioteca(),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
        title: Image.asset(
          "imagens/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              String res = await showSearch(
                  context: context, delegate: CustomSearchDelegate()) as String;
              setState(() {
                _resultado = res;
              });
              print("resultado res: $res");
            },
          ),
          //IconButton(icon: Icon(Icons.videocam),onPressed: (){print("acao: videocam");}),
          //IconButton(icon: Icon(Icons.account_circle),onPressed: (){print("acao: conta");})
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
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
                //backgroundColor: Colors.orange,
                label: "Início",
                icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                //backgroundColor: Colors.red,
                label: "Em alta",
                icon: Icon(Icons.whatshot)),
            BottomNavigationBarItem(
                //backgroundColor: Colors.blue,
                label: "Inscrições",
                icon: Icon(Icons.subscriptions)),
            BottomNavigationBarItem(
                //backgroundColor: Colors.green,
                label: "Biblioteca",
                icon: Icon(Icons.folder)),
          ]),
    );
  }
}
