import 'package:flutter/material.dart';

class gridview_demo extends StatefulWidget {
  const gridview_demo({Key? key}) : super(key: key);

  @override
  State<gridview_demo> createState() => _gridview_demoState();
}

class _gridview_demoState extends State<gridview_demo> {
  List bglist = [
    Colors.orange,
    Colors.red,
    Colors.lightBlueAccent,
    Colors.lightBlue
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
          itemCount: bglist.length,
          itemBuilder: (context, index) {
            return Container(
              color: bglist[index],
              // margin: EdgeInsets.all(10),
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 2)),
    );
  }
}
