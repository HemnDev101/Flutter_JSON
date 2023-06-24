import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sqllite/model/screen1db.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import 'package:sqllite/model/image_model.dart';
import 'package:sqllite/Widget/image_list.dart';

class screen1 extends StatefulWidget {
  const screen1({super.key});

  @override
  State<screen1> createState() => _screen1State();
}

class _screen1State extends State<screen1> {
  int counter = 0;

  List<ImageModel> images = [];
  @override
  Widget build(BuildContext context) {
    void fetchImage() async {
      counter++;

      var uri =
          Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter');
      var response = await get(uri);
       var imagesModel = ImageModel.fromJson(json.decode(response.body));
     
      setState(() {
              images.add(imagesModel); 
      });

    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => fetchImage(),
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Screen 1"),
      ),
 body:  
     ImageList(images),

 
    );
  }
}
