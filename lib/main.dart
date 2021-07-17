import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

void main() {
  runApp(MyApp());
}

const String imageUrl = "https://i.imgur.com/{0}.png";
const String studentName = "Carolynne";

Map imagesUris = {};

enum ImageType { user }

String getImageUrl(ImageType type) =>
    imageUrl.replaceAll("{0}", imagesUris[type.toString()]);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AP1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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

  @override
  Widget build(BuildContext context) {
    _initializeImageMap();

    return Scaffold(
        appBar: AppBar(title: Text("Me passa, pfv!")),
        body: Center(child: Text('My Page!')),
        drawer: _createSidebar());
  }
}
