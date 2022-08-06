import 'package:flutter/material.dart';
import 'package:love_shayari/model.dart';
import 'package:love_shayari/thirdpage.dart';

class secondpage extends StatefulWidget {
  int i;

  secondpage(this.i);

  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  List temp = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    switch (widget.i) {
      case 0:
        temp = model.prerana;
        break;
      case 1:
        temp = model.jivan;
        break;
      case 2:
        temp = model.mahhobat;
        break;
      case 3:
        temp = model.yade;
        break;
      case 4:
        temp = model.anay;
        break;
      case 5:
        temp = model.rajneeti;
        break;
      case 6:
        temp = model.frdship;
        break;
      case 7:
        temp = model.dard;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${model.title[widget.i]}'),
      ),
      body: ListView.builder(
        itemCount: temp.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => thirdpage(index, temp, widget.i),
                    ));
              },
              // tileColor: Colors.grey,
              leading: Container(
                height: 60,
                width: 60,
                child: Image.asset("images/${model.image[widget.i]}"),
              ),
              title: Text(
                "${temp[index]}",
                maxLines: 2,
              ),
            ),
          );
        },
      ),
    );
  }
}
