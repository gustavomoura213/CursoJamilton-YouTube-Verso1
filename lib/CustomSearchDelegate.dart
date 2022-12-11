import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
          //close(context, query);
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, "");
        //print("resultado leading: query = $query");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //print("resultado => pesquisa realizada: query = $query");
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();

    //print("resultado sugest digitado:  $query");
    // List<String> lista = [];
    // if (query.isNotEmpty) {
    //   lista = [
    //     "Android",
    //     "Android Navegaçãoa",
    //     "IOS",
    //     "Jogos",
    //   ]
    //       .where((texto) => texto.toLowerCase().startsWith(query.toLowerCase()))
    //       .toList();
    //   return ListView.builder(
    //     itemCount: lista.length,
    //     itemBuilder: (context, index) {
    //       return ListTile(
    //         onTap: () {
    //           close(context, lista[index]);
    //         },
    //         title: Text(lista[index]),
    //       );
    //     },
    //   );
    // } else {
    //   return const Center(
    //     child: Text("Nenhum Resultado Para a Pesquisa"),
    //   );
    // }
  }
}
