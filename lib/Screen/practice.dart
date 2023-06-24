import 'dart:async';

void main() async {
print("About to fetch data");

  get("http://Google.com").then((value) => print(value));

  print(await get("http://hemndev101.com"));
  print("end");
}

Future<String> get(String url) {
  return new Future.delayed(new Duration(seconds: 3), () {
    if (url == 'http://hemndev101.com') return 'welcome Hemn';
    return "Go The Data!!";
  });
}
