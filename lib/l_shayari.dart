import 'package:flutter/material.dart';
import 'package:love_shayari/model.dart';
import 'package:love_shayari/secondpage.dart';

class love_shayari extends StatefulWidget {
  const love_shayari({Key? key}) : super(key: key);

  @override
  State<love_shayari> createState() => _love_shayariState();
}

class _love_shayariState extends State<love_shayari> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Love Shayari'),
      ),
      body: ListView.builder(
        itemCount: model.title.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            shadowColor: Colors.amberAccent,
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => secondpage(index),
                    ));
              },
              title: Text("${model.title[index]}"),
              leading: Container(
                height: 60,
                width: 60,
                padding: EdgeInsets.all(10),
                child: Image.asset("images/${model.image[index]}"),
              ),
            ),
          );
        },
      ),
    );
  }
}
