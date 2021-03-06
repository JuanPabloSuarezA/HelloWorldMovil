import 'package:flutter/material.dart';
import 'package:hello_world_movil/src/pages/home_page.dart';
import 'package:hello_world_movil/src/pages/info_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material App",
      home: Center(child: HomePage()),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: <String, WidgetBuilder>{"vistaAPI": (context) => InfoPage()},
    );
  }
}
