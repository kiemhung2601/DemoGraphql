import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class Article extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  final String subtitle;

  const Article({ Key? key, required this.title, required this.image, required this.description, required this.subtitle, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),      
        ),
        Image(
          image: NetworkImage(image),
          height: 200,
          width: 200,
        ),
        Text(
          description,
          style: const TextStyle(fontSize: 14),
        ),
        ElevatedButton(
          onPressed: () => _launchURL(subtitle),
          child: const Text('Read more')
          ),
      ]
    );
  }
}

void _launchURL(String url) async {
  if (!await launch(url)) throw 'Could not launch $url';
}
