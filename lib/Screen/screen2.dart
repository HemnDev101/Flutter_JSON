import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sqllite/Widget/image_list.dart';
import 'package:sqllite/Widget/image_list2.dart';

import 'package:sqllite/model/image_model2.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  List<ImageModel2> images = [];
  TextEditingController inputController = TextEditingController();

  void fetchImage(int id) async {
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/photos/$id");
    var response = await get(uri);
    var imageModel2 = ImageModel2.fromJson(json.decode(response.body));
   

    setState(() {
      images.add(imageModel2); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen2"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          TextField(
            controller: inputController,
            decoration: InputDecoration(hintText: "Input ID"),
          ),
          ElevatedButton(
              onPressed: () {
                String txtData = inputController.text;
                int Data = int.parse(txtData);
                fetchImage(Data);
              },
              child: Icon(Icons.input)),
           ImageList2(images)
        ]),
      ),
    );
  }
}
