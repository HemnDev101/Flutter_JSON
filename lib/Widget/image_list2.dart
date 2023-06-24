import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../model/image_model2.dart';

class ImageList2 extends StatelessWidget {
  List<ImageModel2> images;
  ImageList2(this.images);

  @override
  Widget build(BuildContext context) {
    return ListView.builder( scrollDirection: Axis.vertical,
        shrinkWrap: true,
      itemBuilder: (context, index) {
        return Image.network(images[index].url);
      },
      itemCount: images.length,
    );
  }
}
