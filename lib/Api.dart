import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:youtube/model/video.dart';

const String CHAVE_YOUTUBE_API = "AIzaSyCD9UwSua96OMAcZuTudPpUuIfffHcGnTg";
//const String ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const String URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    http.Response response = await http.get(
      Uri.parse("$URL_BASE"
          "search"
          "?part=snippet"
          "&type=video"
          "&maxResults=20"
          "&order=date"
          "&key= $CHAVE_YOUTUBE_API"
          // "&channelId=$ID_CANAL"
          "&q=$pesquisa"),
    );
    var resultado = response.statusCode.toString();
    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);
      // List<Video> videos;
      for (var video in dadosJson["items"]) {
        print(video.toString());

        Map<String, dynamic> dadosJson = json.decode(response.body);

        List<Video> videos = dadosJson["items"].map<Video>((map) {
          return Video.fromJson(map);
          //return Video.converterJson(map);
        }).toList();

        return videos;

        // for (var video in videos) {
        //   print("resultado: ${video.titulo.toString()}");
        // }
        //print("Resultado: " + videos.toString() );

        /*
      for( var video in dadosJson["items"] ){
        print("Resultado: " + video.toString() );
      }*/
        //print("resultado: " + dadosJson["items"].toString() );

      }

      print("O código é ========> $resultado");
      print("O dadosJson.toString() é ========> ${dadosJson.toString()}");
      print("O pageInfo é ========> ${dadosJson["pageInfo"]}");
      print("O title é ========> ${dadosJson["items"][0]["snippet"]["title"]}");
    } else {
      print("Erro: ELSE");
      //return List<Video>.empty();
    }
    print("ERRRO");
    return List<Video>.empty();
  }
}
