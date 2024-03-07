import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Vogais extends StatefulWidget {
  const Vogais({super.key});

  @override
  State<Vogais> createState() => _VogaisState();
}

class _VogaisState extends State<Vogais> {

  final player = AudioPlayer();

  _executar(String nomeAudio) async {
    player.setVolume(1);
    await player.setSource(AssetSource('audios/$nomeAudio.mp3'));
    await player.resume();
  }

  @override
  void initState() {
    super.initState();
    player.audioCache.loadAll([
      "audios/a.mp3", "audios/e.mp3", "audios/i.mp3",
      "audios/o.mp3", "audios/u.mp3",
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2,
      //scrollDirection: Axis.horizontal,
      children: [
        GestureDetector(
          onTap: () {
            _executar('a');
          },
          child: Image.asset('assets/images/a.png'),
        ),
        GestureDetector(
          onTap: () {
            _executar('e');
          },
          child: Image.asset('assets/images/e.png'),
        ),
        GestureDetector(
          onTap: () {
            _executar('i');
          },
          child: Image.asset('assets/images/i.png'),
        ),
        GestureDetector(
          onTap: () {
            _executar('o');
          },
          child: Image.asset('assets/images/o.png'),
        ),
        GestureDetector(
          onTap: () {
            _executar('u');
          },
          child: Image.asset('assets/images/u.png'),
        ),
      ],
    );
  }
}
