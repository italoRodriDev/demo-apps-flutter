import 'package:app_portifolio/demos/twitter/widgets/card_twetter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crise/components/avatar.component.dart';
import 'package:flutter_crise/components/text.component.dart';
import 'package:flutter_crise/components/button.component.dart';

import 'comments.page.dart';

class HomeTwitterPage extends StatefulWidget {
  const HomeTwitterPage({super.key});

  @override
  State<HomeTwitterPage> createState() => _HomeTwitterPageState();
}

class _HomeTwitterPageState extends State<HomeTwitterPage> {
  List<dynamic> data = [
    {
      "photo":
          "https://mga-prod.s3.amazonaws.com/public/img/users/cIGCQcX7oCej0HIfMQDTBNb7mhsI0hKeJDsgZPsv.jpg",
      "name": "Italo R. Santos",
      "nickName": "italo_rd25",
      "likes": 16,
      "comments": ["Top", "Legal"],
      "description":
          "Pessoal estou liberando o nosso novo game quiz Recursos Humanos, com 3 vagas em disputa, os melhores candidatos se classificam para próxima etapa onde será realizado um teste prático. #TeamItalo #ProcessoSeletivo #Inclusao #Game",
      "images": [
        "https://firebasestorage.googleapis.com/v0/b/meconectarhapp.appspot.com/o/Testes%2Fetapa%201.png?alt=media&token=acdabbbe-f44e-4945-91c4-c935b856fa79",
        "https://firebasestorage.googleapis.com/v0/b/meconectarhapp.appspot.com/o/Testes%2Fetapa%202.png?alt=media&token=d3eaad81-46d1-4ef9-9807-cbb67ca205fe",
        "https://firebasestorage.googleapis.com/v0/b/meconectarhapp.appspot.com/o/Testes%2Fetapa%203.png?alt=media&token=ac85f999-bd63-4433-b3e4-dce1578bd371"
      ]
    },
    {
      "photo":
          "https://mga-prod.s3.amazonaws.com/public/img/users/cIGCQcX7oCej0HIfMQDTBNb7mhsI0hKeJDsgZPsv.jpg",
      "name": "Italo R. Santos",
      "nickName": "italo_rd25",
      "likes": 16,
      "comments": ["Top", "Legal"],
      "description":
          "Um pouco sobre nossa festa de halloween, a galera se divertiu muito, e foi super legal, a decoração ficou perfeita. Gostaria de agradecer a todos que participaram e esperamos que ano que vem seja ainda melhor. #Halloween",
      "images": [
        "https://lirp.cdn-website.com/82e2ead5/dms3rep/multi/opt/young-friends-having-fun-halloween-party-640w.jpg",
        "https://static.ndmais.com.br/2017/10/01bba693e5451f1d63f7bb20e1f49e66d81428d2.jpg",
        "https://blog.abler.com.br/wp-content/uploads/2023/09/happy-hour-de-halloween-1024x683.jpg"
      ]
    },
    {
      "photo":
          "https://www.tenda.com/blog/wp-content/uploads/2021/09/Pessoa-fisica-mobile.jpg",
      "name": "Maria Silva",
      "nickName": "maria_silva",
      "likes": 10,
      "comments": ["Muito bom!", "Adorei!"],
      "description":
          "Relembrando nossa última confraternização da equipe! #TeamWork",
      "images": []
    },
    {
      "photo":
          "https://cdn.pixabay.com/photo/2016/03/31/19/56/avatar-1295395_640.png",
      "name": "Carlos Souza",
      "nickName": "carlos_souza",
      "likes": 25,
      "comments": ["Incrível!", "Ótima festa!"],
      "description": "Evento de fim de ano da empresa! Foi sensacional. #Festa",
      "images": []
    },
    {
      "photo":
          "https://static.wikia.nocookie.net/xbox/images/1/15/19_-_YIswnk0.png/revision/latest/scale-to-width-down/250?cb=20210628044527",
      "name": "Ana Paula",
      "nickName": "ana_paula123",
      "likes": 8,
      "comments": ["Show!", "Muito divertido."],
      "description":
          "Uma noite inesquecível com amigos do trabalho. #HappyHour",
      "images": []
    },
    {
      "photo":
          "https://static1.squarespace.com/static/56dc8dcca3360c8bedccf836/57d5d447363d3cfcab824775/57d5d47c363d3cfcab8257d7/1473631356697/bear.jpg?format=original",
      "name": "Pedro Lima",
      "nickName": "pedro_lima",
      "likes": 14,
      "comments": ["Que festa!", "Quero mais!"],
      "description":
          "Ótima experiência no último evento corporativo! #Networking",
      "images": []
    },
    {
      "photo":
          "https://static1.squarespace.com/static/56dc8dcca3360c8bedccf836/57d5d447363d3cfcab824775/57d5d47b363d3cfcab8257a5/1473631355618/Monster-04.jpg?format=original",
      "name": "Beatriz Gonçalves",
      "nickName": "bia_goncalves",
      "likes": 20,
      "comments": ["Maravilhoso!", "Muito top!"],
      "description":
          "Nos divertimos muito na última festa da empresa! #CompanyParty",
      "images": []
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: SafeArea(
              child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 230,
                  color: const Color.fromARGB(255, 255, 102, 0),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const AvatarComponent(
                                radius: 25,
                                imageUrl:
                                    'https://mga-prod.s3.amazonaws.com/public/img/users/cIGCQcX7oCej0HIfMQDTBNb7mhsI0hKeJDsgZPsv.jpg'),
                            const SizedBox(width: 5),
                            TextComponent(
                                value: '@italo_rd25',
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ],
                        ),
                        const SizedBox(height: 8),
                        TextComponent(
                            value: 'Nível 4',
                            fontSize: 22,
                            color: const Color.fromARGB(255, 255, 203, 59),
                            fontWeight: FontWeight.w700),
                        const SizedBox(height: 8),
                        TextComponent(
                            value: 'Desenvolvedor Mobile',
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                        const SizedBox(height: 20),
                        SizedBox(
                            width: 212,
                            child: ButtonStylizedComponent(
                                borderRadius: 16,
                                label: Row(
                                  children: [
                                    TextComponent(
                                        value: "Nova postagem",
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                    const SizedBox(width: 2),
                                    const Icon(Icons.add, color: Colors.white),
                                  ],
                                ),
                                onPressed: () {}))
                      ],
                    ),
                  )),
              const SizedBox(height: 10),
              TextButton(
                  onPressed: () {},
                  child: TextComponent(
                    value: 'Início',
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  )),
              const SizedBox(height: 10),
              TextButton(
                  onPressed: () {},
                  child: TextComponent(
                    value: 'Vagas',
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  )),
              const SizedBox(height: 10),
              TextButton(
                  onPressed: () {},
                  child: TextComponent(
                    value: 'Cursos',
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  )),
              const SizedBox(height: 10),
              TextButton(
                  onPressed: () {},
                  child: TextComponent(
                    value: '#GameQuiz',
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  )),
              const SizedBox(height: 10),
              TextButton(
                  onPressed: () {},
                  child: TextComponent(
                    value: 'Sair',
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  )),
              const SizedBox(height: 10),
            ],
          )
        ],
      ))),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 102, 0),
        foregroundColor: Colors.white,
        elevation: 0.8,
        actions: [
          Padding(
              padding: EdgeInsets.all(2),
              child: Row(
                children: [
                  TextComponent(
                      value: '@italo_rd25',
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                  const SizedBox(width: 5),
                  const AvatarComponent(
                      radius: 25,
                      imageUrl:
                          'https://mga-prod.s3.amazonaws.com/public/img/users/cIGCQcX7oCej0HIfMQDTBNb7mhsI0hKeJDsgZPsv.jpg')
                ],
              ))
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  TextComponent(
                    value: "Feed de notícias",
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              )),
          const Divider(),
          for (var i in data)
            CardTwetter(
                onPressedComments: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CommentsTwetter(twetter: i)));
                },
                enableClickComment: true,
                enableClickLike: true,
                onLike: () {},
                photo: i['photo'],
                name: i['name'],
                nickName: i['nickName'],
                likes: i['likes'],
                comments: i['comments'],
                description: i['description'],
                images: i['images'])
        ],
      ))),
    );
  }
}
