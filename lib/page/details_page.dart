import 'package:flutter/material.dart';

const String _loremIpsumParagraph = 'Text here';

class DetailsPage extends StatelessWidget {
  final int index;


  const DetailsPage({
    this.index = 0,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Details page'),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 300,
              child: Image.network(
                'https://source.unsplash.com/random?sig=$index',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Random Image',
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          color: Colors.black54,
                          fontSize: 30,
                        ),),

                  SizedBox(height: 10),
                  Text(
                    _loremIpsumParagraph,
                    style: TextStyle(
                      color: Colors.black54,
                      height: 1.5,
                      fontSize: 16,
                    ),),
                ],
              ),),
          ],
        ),);
}
