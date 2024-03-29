import 'package:flutter/material.dart';
import 'ui/list_user.dart';
import 'ui/list_berita.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: PageHomeJson(),debugShowCheckedModeBanner: false,
    );
  }
}


class PageHomeJson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON Flutter'),
        backgroundColor: Colors.red,
      ),

      body: Center(
        child: ListView(
          children: <Widget>[
            MaterialButton(
              color: Colors.red,
              textColor: Colors.white,
              onPressed: (){

                Navigator.push(context, MaterialPageRoute(builder: (context)=> ListUser()));
              }, child: Text('Nestedlist Json'),
            ),
            MaterialButton(
              color: Colors.red,
              textColor: Colors.white,
              onPressed: (){

                Navigator.push(context, MaterialPageRoute(builder: (context)=> PageListBerita()));
              }, child: Text('Apps Berita'),
            ),
          ],
        ),
      ),
    );
  }
}
