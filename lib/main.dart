import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

const String imageUrl = "https://i.imgur.com/{0}.png";
const String studentName = "Carolynne";

Map imagesUris = {};

enum ImageType {
  user
}

String getImageUrl(ImageType type) => imageUrl.replaceAll("{0}", imagesUris[type.toString()]);

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

  Widget _createDrawerHeader() {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Color.fromRGBO(32, 32, 32, 1),
        border: Border(bottom: BorderSide(color: Colors.white38, width: 2))
      ),
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
                      image: NetworkImage(getImageUrl(ImageType.user))
                  )
              )
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(
                studentName.toLowerCase(), 
                style: TextStyle(color: Colors.white, fontSize: 16)
              )
            ),
            Container(
              child: Text(
                "ALUNO", 
                style: TextStyle(color: Colors.white38, fontSize: 14, fontWeight: FontWeight.w100)
              )
            )
          ],
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    _initializeImageMap();

    return Scaffold(
      appBar: AppBar(title: Text("Me passa, pfv!")),
      body: Center(child: Text('My Page!')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _createDrawerHeader(),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}