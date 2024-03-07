import 'package:flutter/material.dart';
import 'package:yoputube/componentes/Api.dart';
import 'package:yoputube/model/video.dart';
import '../componentes/video_view.dart';


class Inicio extends StatefulWidget {
  String pesquisa;

  Inicio(this.pesquisa);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  _listarVideos(String pesquisax) {
    Api api = Api();
    return api.pesquisar(pesquisax);
  }

  @override
  Widget build(BuildContext context) {
    print('resultado: Inicio ${widget.pesquisa}');
    return FutureBuilder<List<Video>>(
        future: _listarVideos(widget.pesquisa),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasData) {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    List<Video>? videos = snapshot.data;
                    Video? video = videos?[index];

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
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(video!.imagem.toString()),
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text(video!.titulo.toString()),
                            subtitle: Text(video!.canal.toString()),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                  itemCount: snapshot.data!.length,
                );
              } else {
                return const Center(
                  child: Text("Nenhum dado a ser exibido!"),
                );
              }
              break;
          }
          ;
        });
  }
}
