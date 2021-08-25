import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hello_world_movil/src/components/post_class.dart';
import 'package:http/http.dart' as http;

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Información de API"),
      ),
      body: _extraerInfo(),
    );
  }
}

Future<List<Post>> fetchPost() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  if (response.statusCode == 200) {
    List listaJson = json.decode(response.body);
    // print(listaPost.elementAt(0));
    List<Post> listaPost = [];
    listaJson.forEach((element) {
      listaPost.add(Post.fromJson(element));
    });
    return listaPost;
    // return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('No se pudo cargar la información');
  }
}

Widget _extraerInfo() {
  return FutureBuilder<List<Post>>(
    future: fetchPost(),
    initialData: [],
    builder: (context, AsyncSnapshot<List<Post>> snapshot) {
      if (snapshot.hasData) {
        return _mostrarInfo(snapshot.data);
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }
      return CircularProgressIndicator();
    },
  );
}

Widget _mostrarInfo(List<Post>? listaInfo) {
  List<Widget> listaVistas = [];

  listaInfo?.forEach((element) {
    listaVistas.add(ListTile(
      title: Text(element.toString()),
    ));

    listaVistas.add(Divider());
  });

  return ListView(
    children: listaVistas,
  );
}
