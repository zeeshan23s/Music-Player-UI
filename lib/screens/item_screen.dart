import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/models/songs.dart';

class ItemScreen extends StatefulWidget {
  final Songs song;

  const ItemScreen({Key? key, required this.song}) : super(key: key);

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  bool isFavourite = false;

  Timer? timer;

  int sliderValue = 0;

  bool _isPlaying = false;

  void periodicUpdate() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (sliderValue < 30) {
        setState(() {
          sliderValue = sliderValue + 1;
        });
      } else {
        setState(() {
          _isPlaying = false;
        });
        stopPeriodicUpdate();
      }
    });
  }

  void stopPeriodicUpdate() {
    timer?.cancel();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    stopMusic();
  }

  void playMusic(String audioURL) async {
    if (sliderValue == 30) {
      setState(() {
        sliderValue = 0;
      });
    }
    await _audioPlayer.play(UrlSource(audioURL),
        position: Duration(seconds: sliderValue));
    periodicUpdate();
  }

  void stopMusic() async {
    _audioPlayer.stop();
    stopPeriodicUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient:
              RadialGradient(colors: [Color(0xFF36474F), Color(0xFF28353B)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: 30 * MediaQuery.of(context).size.height / 740,
                horizontal: 20 * MediaQuery.of(context).size.width / 360),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_ios)),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                            height:
                                380 * MediaQuery.of(context).size.height / 740,
                            width:
                                320 * MediaQuery.of(context).size.width / 360,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        widget.song.artworkUrl100!),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(30 *
                                    MediaQuery.of(context).size.height /
                                    740))),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            height:
                                80 * MediaQuery.of(context).size.height / 740,
                            width:
                                320 * MediaQuery.of(context).size.width / 360,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      const Color(0xFF36474F).withOpacity(0.3),
                                      const Color(0xFF2C3A40).withOpacity(0.3)
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(45 *
                                        MediaQuery.of(context).size.height /
                                        740),
                                    bottomRight: Radius.circular(45 *
                                        MediaQuery.of(context).size.height /
                                        740))),
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8 *
                                        MediaQuery.of(context).size.height /
                                        740,
                                    horizontal: 20 *
                                        MediaQuery.of(context).size.width /
                                        360),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(widget.song.trackName!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1
                                                ?.copyWith(fontSize: 16),
                                            overflow: TextOverflow.ellipsis),
                                        Text(widget.song.artistName!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                ?.copyWith(fontSize: 10),
                                            overflow: TextOverflow.ellipsis)
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: (() {
                                        setState(() {
                                          if (isFavourite == false) {
                                            isFavourite = true;
                                          } else {
                                            isFavourite = false;
                                          }
                                        });
                                      }),
                                      child: Icon(
                                          isFavourite
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: isFavourite
                                              ? Colors.red
                                              : Colors.white),
                                    )
                                  ],
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Slider(
                          activeColor: Colors.red,
                          inactiveColor: Colors.white,
                          min: 0,
                          max: 30,
                          value: sliderValue.toDouble(),
                          onChanged: (value) async {
                            setState(() {
                              stopMusic();
                              sliderValue = value.toInt();
                              _isPlaying = false;
                            });
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  22 * MediaQuery.of(context).size.width / 360),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  '00 : ${sliderValue.toString().length == 1 ? '0$sliderValue' : sliderValue}',
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11,
                                      color: Colors.white)),
                              Text('00 : 30',
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11,
                                      color: Colors.white))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: GlassmorphicContainer(
                        height: 80 * MediaQuery.of(context).size.height / 740,
                        width: 310 * MediaQuery.of(context).size.width / 360,
                        borderRadius: 10,
                        linearGradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(102, 255, 255, 255),
                              Color.fromARGB(13, 255, 255, 255)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        border: 2 * MediaQuery.of(context).size.height / 740,
                        blur: 40,
                        borderGradient: LinearGradient(
                            colors: [
                              const Color.fromARGB(102, 255, 255, 255)
                                  .withOpacity(0.5),
                              const Color.fromARGB(13, 255, 255, 255)
                                  .withOpacity(0.5)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  20 * MediaQuery.of(context).size.width / 360),
                          child: Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(Icons.replay_10, size: 40),
                                Row(
                                  children: [
                                    const Icon(Icons.skip_previous, size: 40),
                                    GestureDetector(
                                        onTap: () {
                                          if (_isPlaying) {
                                            stopMusic();
                                          } else {
                                            playMusic(widget.song.previewUrl!);
                                          }
                                          setState(() {
                                            _isPlaying = !_isPlaying;
                                          });
                                        },
                                        child: Icon(
                                            _isPlaying
                                                ? Icons.pause
                                                : Icons.play_arrow,
                                            size: 40)),
                                    const Icon(Icons.skip_next, size: 40)
                                  ],
                                ),
                                const Icon(Icons.repeat_rounded, size: 40)
                              ],
                            ),
                          ),
                        )),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
