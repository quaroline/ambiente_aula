import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

void main() {
  runApp(MyApp());
}

const String imageUrl = "https://i.imgur.com/{0}.png";
const String studentName = "Carolynne";

final Random random = new Random();

Map imagesUris = {};

enum ImageType { user }

String getImageUrl(ImageType type) =>
    imageUrl.replaceAll("{0}", imagesUris[type.toString()]);

int generateNumberBySize(int size) {
  var numero = "";

  for (var i = 0; i < size; i++) numero += random.nextInt(9).toString();

  return int.parse(numero);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AP1',
      theme: ThemeData(primaryColor: Colors.white),
      home: MyHomePage(title: 'AP1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _initializeImageMap() {
    imagesUris = new Map();

    imagesUris[ImageType.user.toString()] = 'w65MVVH';
  }

  List<Widget> _createMenu() {
    var textColor = Colors.white;

    List<Widget> tiles = [_createDrawerHeader()];

    [
      Tuple2<String, Icon>("Salas virtuais",
          Icon(Icons.featured_play_list_outlined, color: textColor)),
      Tuple2<String, Icon>("Anotações de aula",
          Icon(Icons.library_books_outlined, color: textColor)),
      Tuple2<String, Icon>(
          "Avisos", Icon(Icons.email_outlined, color: textColor)),
      Tuple2<String, Icon>(
          "Desempenho", Icon(Icons.military_tech, color: textColor)),
      Tuple2<String, Icon>("Frequencia", Icon(Icons.moving, color: textColor)),
      Tuple2<String, Icon>(
          "Laboratório virtual", Icon(Icons.import_contacts, color: textColor)),
      Tuple2<String, Icon>("Materiais de apoio",
          Icon(Icons.sim_card_download_outlined, color: textColor)),
      Tuple2<String, Icon>(
          "Mensagens", Icon(Icons.messenger_outline, color: textColor)),
      Tuple2<String, Icon>("Minha biblioteca",
          Icon(Icons.collections_bookmark_outlined, color: textColor)),
      Tuple2<String, Icon>(
          "Minhas turmas", Icon(Icons.person_search, color: textColor)),
      Tuple2<String, Icon>("Pearson",
          Icon(Icons.collections_bookmark_outlined, color: textColor)),
      Tuple2<String, Icon>("Sair", Icon(Icons.exit_to_app, color: textColor))
    ].forEach((tuple) {
      tiles.add(ListTile(
          title: Text(tuple.item1, style: TextStyle(color: Colors.white)),
          leading: tuple.item2,
          tileColor: Colors.grey.shade900,
          selectedTileColor: Colors.grey.shade800,
          hoverColor: Colors.grey.shade700,
          selected: tuple.item1 == "Salas virtuais",
          onTap: () {
            Navigator.pop(context);
          }));
    });

    return tiles;
  }

  Widget _createDrawerHeader() {
    return DrawerHeader(
        decoration: BoxDecoration(
            color: Colors.grey.shade900,
            border:
                Border(bottom: BorderSide(color: Colors.white38, width: 2))),
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(getImageUrl(ImageType.user))))),
            Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(studentName.toLowerCase(),
                    style: TextStyle(color: Colors.white, fontSize: 16))),
            Container(
                child: Text("ALUNO",
                    style: TextStyle(
                        color: Colors.white38,
                        fontSize: 14,
                        fontWeight: FontWeight.w100)))
          ],
        )));
  }

  Widget _createSidebar() {
    return Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.grey.shade900),
        child: Drawer(
            child:
                ListView(padding: EdgeInsets.zero, children: _createMenu())));
  }

  List<Widget> _createSubjectsCards() {
    List<Widget> cards = [];

    var colors = [Colors.pink, Colors.orange, Colors.green, Colors.cyan];

    var subjectsNames = [
      "Banco de Dados",
      "Programação Orientada a Objetos",
      "Redes de Computador",
      "Desenvolvimento de Sistema Móveis"
    ];

    for (int i = 0; i < subjectsNames.length; i++) {
      cards.add(Padding(
          padding: EdgeInsets.all(15),
          child: Container(
              decoration: BoxDecoration(
                  color: colors[i][300],
                  borderRadius: BorderRadius.all(Radius.circular(3))),
              child: Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Column(children: [
                    ListTile(
                        title: Text(subjectsNames[i],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        subtitle: Text(
                            'Turma: ${generateNumberBySize(4)}-B - ${generateNumberBySize(2)}N - Graduação',
                            style:
                                TextStyle(color: Colors.white, fontSize: 10))),
                    Container(
                        decoration: BoxDecoration(color: Colors.white),
                        child: Padding(
                            padding: EdgeInsets.all(25),
                            child: Center(
                                child: Column(children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                        child: Icon(Icons.star,
                                            color: Colors.grey[
                                                (i % 2 == 0) ? 300 : 600]),
                                        padding:
                                            EdgeInsets.only(left: 8, right: 8)),
                                    Padding(
                                        child: Icon(Icons.chat_bubble,
                                            color: Colors.grey[300]),
                                        padding:
                                            EdgeInsets.only(left: 8, right: 8)),
                                    Padding(
                                        child: Icon(Icons.info,
                                            color: Colors.grey[
                                                (random.nextInt(10) > 5)
                                                    ? 300
                                                    : 600]),
                                        padding:
                                            EdgeInsets.only(left: 8, right: 8))
                                  ]),
                              Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.green[800],
                                              onPrimary: Colors.white),
                                          child: Padding(
                                              child: Text('Entrar na sala'),
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 20)))))
                            ]))))
                  ])))));
    }

    return cards;
  }

  @override
  Widget build(BuildContext context) {
    _initializeImageMap();

    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 70,
            title: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.exit_to_app, color: Colors.black))
            ])),
        body: Center(
            child: Container(
                child: GridView.count(
                    primary: false,
                    crossAxisCount: 3,
                    padding: const EdgeInsets.all(10),
                    children: _createSubjectsCards()))),
        drawer: _createSidebar());
  }
}
