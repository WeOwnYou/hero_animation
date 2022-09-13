import 'package:flutter/material.dart';
import 'package:hero_animation_skillbox/images.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: images
                .map(
                  (image) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => ImageDetails(image: image),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Card(
                        color: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Hero(
                                  tag: image.id,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(20)),
                                    child: SizedBox(
                                        height: 100,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Image.network(
                                          image.url,
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.85,
                                      top: MediaQuery.of(context).size.height *
                                          0.118),
                                  child: Hero(
                                    tag: '${image.id}-button',
                                    child: const Material(
                                      color: Colors.yellow,
                                      child: Icon(Icons.add),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            ListTile(title: Text(image.description))
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ));
  }
}

class ImageDetails extends StatelessWidget {
  final MyImage image;
  const ImageDetails({required this.image, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: image.id,
                  child: SizedBox(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      image.url,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width *
                          0.83,
                      top: MediaQuery.of(context).size.height *
                          0.26),
                  child: Hero(
                    tag: '${image.id}-button',
                    child: const Material(
                      color: Colors.yellow,
                      child: Icon(Icons.add, size: 40,),
                    ),
                  ),
                )
              ],
            ),
            Text(image.description)
          ],
        ),
      ),
    );
  }
}
