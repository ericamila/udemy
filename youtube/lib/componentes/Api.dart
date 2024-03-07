import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:yoputube/model/video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyBuz4j--DPAfZXYKM60sBpdTeuYoFRw03c";
const ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    http.Response response = await http.get(
      Uri.parse(URL_BASE +
          "search"
              "?part=snippet"
              "&channelId=$ID_CANAL"
              "&maxResults=20"
              "&order=date"
              "&type=video"
              "&key=$CHAVE_YOUTUBE_API"
              "&q=$pesquisa"),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);
      List<Video> videos = dadosJson["items"].map<Video>((map) {
        return Video.fromJson(map);
        //return Video.converterJson(map);
      }).toList();

      return videos;

/*    for(var video in videos ){
        print("resultado: "+video.titulo.toString());
      }
      print("resultado: "+dadosJson["items"][1]["snippet"]["title"].toString());*/
    } else {
      return Future.error("error");
    }
  }
}
