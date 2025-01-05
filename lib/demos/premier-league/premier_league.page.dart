import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crise/components/text.component.dart';

class PremierLeaguePage extends StatefulWidget {
  const PremierLeaguePage({super.key});

  @override
  State<PremierLeaguePage> createState() => _PremierLeaguePageState();
}

class _PremierLeaguePageState extends State<PremierLeaguePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 51, 8, 58),
          title: Image.network(
              'https://logodownload.org/wp-content/uploads/2016/03/premier-league-3.png',
              width: 150),
        ),
        body: SafeArea(child: SingleChildScrollView(child: pageHome())));
  }
}

pageHome() {
  return Column(
    children: [
      Container(
        width: double.infinity,
        height: 450,
        child: Stack(
          children: [
            Positioned.fill(
                child: Image.network(
              'https://assets.goal.com/images/v3/blt21eb317b90839682/UCL_Arsenal_Man_City_Saka_Haaland.jpg?auto=webp&format=pjpg&width=3840&quality=60',
              fit: BoxFit.cover,
            )),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                    height: 450,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                          const Color.fromARGB(255, 51, 8, 58).withOpacity(0.9),
                          const Color.fromARGB(255, 51, 8, 58).withOpacity(0.0)
                        ])),
                    child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextComponent(
                              value: 'Assistir',
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                            ),
                            IconButton(
                              icon: const Icon(
                                CupertinoIcons.play_circle,
                                color: Colors.white,
                                size: 50,
                              ),
                              onPressed: () {},
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 150,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      TextComponent(
                                          value: 'Arsenal',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          color: Colors.white),
                                      const SizedBox(height: 3),
                                      Image.network(
                                          'https://logodownload.org/wp-content/uploads/2017/02/Arsenal-logo-escudo-shield-1.png',
                                          height: 60),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          TextComponent(
                                            value: '25 - Saka',
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    TextComponent(
                                        value: '1 - 1',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 33,
                                        color: Colors.white),
                                  ],
                                ),
                                Container(
                                    width: 150,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        TextComponent(
                                            value: 'Man. City',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                            color: Colors.white),
                                        const SizedBox(height: 3),
                                        Image.network(
                                            'https://logodownload.org/wp-content/uploads/2017/02/manchester-city-fc-logo-escudo-badge.png',
                                            height: 60),
                                        const SizedBox(height: 8),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextComponent(
                                              value: '33 - De Bruyne',
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                              ],
                            )
                          ],
                        ))))
          ],
        ),
      )
    ],
  );
}
