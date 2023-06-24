import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:sqllite/model/image_model.dart';

class ImageList extends StatelessWidget {
  List<ImageModel> images;
  ImageList(this.images);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) {
        print(images[index].url);


        return  buildImage(images[index]);
      },
    );
  }

  Widget buildImage(ImageModel image){
return  Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(
               
              width: 3
            )
          ),
          child: Column(
            children: [
              Image.network(image.url ),
              Text(image.title) , 
            ],
          )
          
          
          );
  }
}
