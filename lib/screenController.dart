import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sqllite/Screen/screen2.dart';
import 'Screen/screen1.dart';

class screenController extends StatelessWidget {
  const screenController({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
        centerTitle: true,
           ),

      body: Center(

        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          ElevatedButton(
              onPressed: () {
                 Navigator.of(context).push( MaterialPageRoute(builder: (_) => screen1()) );
              },
              child: Text("Screen1")),
          ElevatedButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => Screen2()));
          }, child: Text("Screen2"))
        ]),
      ),
    );
  }
}
