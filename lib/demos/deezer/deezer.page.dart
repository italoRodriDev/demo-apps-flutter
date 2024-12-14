import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:palette_generator/palette_generator.dart';

class DeezerPage extends StatefulWidget {
  const DeezerPage({super.key});

  @override
  State<DeezerPage> createState() => _DeezerPageState();
}

class _DeezerPageState extends State<DeezerPage> {
  final AudioPlayer player = AudioPlayer();

  List<Map<String, String>> musics = [
    {
      "title": 'Poesia Acústica 13',
      "subtitle": 'Pineapple StormTv',
      "url": "songs/poesia_acustica.mp3",
      "image":
          "https://static1.purebreak.com.br/articles/6/11/01/36/@/499899-capa-do-album-poesia-acustica-13-580x0-1.jpg"
    },
    {
      "title": 'Fútil',
      "subtitle": 'Chris MC',
      "url": "songs/futil.mp3",
      "image":
          "https://i.scdn.co/image/ab67616d0000b2731e841166d42530b727bbd533"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MusicPlayerScreen(
        listMusics: musics,
        player: player,
      ),
    );
  }
}

class MusicPlayerScreen extends StatefulWidget {
  final List<Map<String, String>> listMusics;
  final AudioPlayer player;

  const MusicPlayerScreen({
    super.key,
    required this.listMusics,
    required this.player,
  });

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  bool isPlaying = false;
  bool isAleatory = false;
  bool isRepeat = false;
  Color backgroundColor = Colors.black;
  int currentPage = 0;
  late PageController pageController;
  late Map<String, String> currentMusic;

  Duration currentPosition = Duration.zero;
  Duration totalDuration = Duration.zero;
  String timeFormatted = '00:00';
  String timeTotalFormatted = '00:00';

  @override
  void initState() {
    super.initState();
    currentMusic = widget.listMusics[0];
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    _initializeMusicPlayer();
    _setDominantColor(currentMusic['image']!);

    widget.player.onPositionChanged.listen((position) {
      setState(() {
        currentPosition = position;
        timeFormatted =
            "${currentPosition.inMinutes}:${(currentPosition.inSeconds % 60).toString().padLeft(2, '0')}";
        if (timeFormatted == timeTotalFormatted) {
          if (isRepeat == false) {
            isPlaying = false;
          }
        }
      });
    });

    widget.player.onDurationChanged.listen((duration) {
      setState(() {
        totalDuration = duration;
        timeTotalFormatted =
            "${totalDuration.inMinutes}:${(totalDuration.inSeconds % 60).toString().padLeft(2, '0')}";
      });
    });

    widget.player.onPlayerComplete.listen((event) {
      if (isRepeat) {
        _playSong(currentMusic['url']!);
      } else {
        nextMusic();
      }
    });
  }

  Future<void> _initializeMusicPlayer() async {
    await _playSong(currentMusic['url']!);
  }

  Future<void> _setDominantColor(String imageUrl) async {
    try {
      final PaletteGenerator paletteGenerator =
          await PaletteGenerator.fromImageProvider(NetworkImage(imageUrl));
      setState(() {
        backgroundColor = paletteGenerator.vibrantColor?.color ?? Colors.black;
      });
    } catch (e) {
      setState(() {
        backgroundColor = Colors.black;
      });
    }
  }

  Future<void> _playSong(String audioPath) async {
    await widget.player.setReleaseMode(ReleaseMode.stop);
    await widget.player.play(AssetSource(audioPath));
    setState(() {
      isPlaying = true;
    });
  }

  Future<void> _pauseResumeSong() async {
    if (isPlaying) {
      await widget.player.pause();
    } else {
      await widget.player.resume();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void backMusic() {
    if (currentPage > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void nextMusic() {
    if (currentPage < widget.listMusics.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Column(
          children: [
            const Text(
              'MIX DA FAIXA',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              currentMusic['title']!,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.cast, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 50),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                  currentMusic = widget.listMusics[index];
                  _setDominantColor(currentMusic['image']!);
                  _playSong(currentMusic['url']!);
                });
              },
              itemCount: widget.listMusics.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      widget.listMusics[index]['image']!,
                      width: 350,
                      height: 350,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text(
                  currentMusic['title']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${currentMusic['subtitle']} - ${currentMusic['title']}',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                Slider(
                  onChanged: (value) async {
                    Duration newPosition = Duration(seconds: value.toInt());
                    await widget.player.seek(newPosition);
                    setState(() {
                      currentPosition = newPosition;
                    });
                  },
                  max: totalDuration.inSeconds.toDouble(),
                  value: currentPosition.inSeconds
                      .toDouble()
                      .clamp(0, totalDuration.inSeconds.toDouble()),
                  activeColor: Colors.white,
                  inactiveColor: Colors.grey[300],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        timeFormatted,
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        timeTotalFormatted,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.shuffle,
                        color: isAleatory == true ? Colors.black : Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          isAleatory = !isAleatory;
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.skip_previous,
                          color: Colors.white, size: 50),
                      onPressed: backMusic,
                    ),
                    IconButton(
                      icon: Icon(
                        isPlaying
                            ? CupertinoIcons.pause_solid
                            : CupertinoIcons.play_fill,
                        color: Colors.white,
                        size: 50,
                      ),
                      onPressed: _pauseResumeSong,
                    ),
                    IconButton(
                      icon: const Icon(Icons.skip_next,
                          color: Colors.white, size: 50),
                      onPressed: nextMusic,
                    ),
                    IconButton(
                      icon: Icon(
                        isRepeat ? Icons.repeat_one : Icons.repeat,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          isRepeat = !isRepeat;
                        });
                        widget.player.setReleaseMode(
                          isRepeat ? ReleaseMode.loop : ReleaseMode.stop,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Text('by Italo Rodri Dev.',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white))
        ],
      ),
    );
  }
}
