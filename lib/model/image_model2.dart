class ImageModel2 {
 late int id;
  late String url;
 late  String title;
  ImageModel2(this.id, this.title, this.url);

  ImageModel2.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
     url = parsedJson['url'];
    title = parsedJson['title'];
    
  }
}
