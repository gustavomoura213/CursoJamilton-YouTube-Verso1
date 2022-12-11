import 'package:flutter/material.dart';
import 'package:youtube/model/video.dart';
import 'Api.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'model/VideoView.dart';

class Inicio extends StatefulWidget {
  Inicio(this.pesquisa, {super.key});
  String pesquisa;
  //Inicio(this.pesquisa)
  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  _listarVideos(String pesquisa) {
    Api api = Api();
    return api.pesquisar(pesquisa);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: _listarVideos(widget.pesquisa),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: Colors.red,
              ),
            );
          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  List<Video>? videos = snapshot.data;
                  Video video = videos![index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                VideoView(video.id.toString())),
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(video.imagem),
                          )),
                        ),
                        ListTile(
                          title: Text(video.titulo),
                          subtitle: Text(video.canal),
                        ),
                      ],
                    ),
                  );
                }, // itemBuilder
                separatorBuilder: (context, index) => const Divider(
                  height: 2,
                  color: Colors.black,
                ),
                itemCount: snapshot.data!.length,
              );
            } else {
              return const Center(child: Text("Nenhum dado a ser exibido."));
            } //else
        } //switch
      }, //builder
    );
  } //BuildContext
} //_InicioState
