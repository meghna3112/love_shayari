import 'dart:math';

import 'package:flutter/material.dart';
import 'package:love_shayari/model.dart';

class fourthpage extends StatefulWidget {
  String t;
  int i;

  fourthpage(this.t, this.i);

  @override
  State<fourthpage> createState() => _fourthpageState();
}

class _fourthpageState extends State<fourthpage> {
  Color bgcolor = Colors.orange;
  List<Color> gralist = [Colors.lightGreen, Colors.orangeAccent];

  int a = 0;
  double f =20;

  List fontfamily = ["f1", "f2", "f3"];
  String family = "";
  String emoji = "😞 😔 😟 😕 🙁 ☹️";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${model.title[widget.i]}"),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            width: 370,
            color: Colors.white,
            alignment: Alignment.center,
          ),
          Container(
            height: 400,
            width: 350,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: a == 0 ? bgcolor : null,
                gradient: a == 1
                    ? LinearGradient(
                        colors: gralist,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)
                    : null),
            child: Text(
              "$emoji \n${widget.t} \n$emoji",
              style: TextStyle(fontSize: f, fontFamily: family),
              textAlign: TextAlign.center,
            ),
          ),
          Spacer(),
          Container(
            height: 150,
            width: double.infinity,
            color: Colors.lime,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          int a1 = Random().nextInt(model.glist.length);
                          a = 1;
                          gralist = model.glist[a1];
                        });
                      },
                      icon: Icon(Icons.repeat),
                    ),
                    IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              builder: (context) {
                                return Container(
                                  height: 750,
                                  child: GridView.builder(
                                    itemCount: model.glist.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          setState(() {
                                            gralist = model.glist[index];
                                            a = 1;
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  colors: model.glist[index])),
                                        ),
                                      );
                                    },
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2),
                                  ),
                                );
                              },
                              context: context,
                              isScrollControlled: true);
                        },
                        icon: Icon(Icons.zoom_out_map))
                  ],
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              // backgroundColor: Colors.lightBlueAccent,
                              // barrierColor: Color(0x8BE09DAD),
                              barrierColor: Colors.transparent,
                              builder: (context) {
                                return Container(
                                  height: 250,
                                  child: GridView.builder(
                                      itemCount: model.bglist.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            setState(() {
                                              bgcolor = model.bglist[index];
                                              a = 0;
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            color: model.bglist[index],
                                            // margin: EdgeInsets.all(10),
                                          ),
                                        );
                                      },
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 5,
                                              mainAxisSpacing: 10,
                                              crossAxisSpacing: 10,
                                              childAspectRatio: 2)),
                                );
                              },
                              context: context,
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 100,
                            color: Colors.red,
                            child: Text('BackGround',
                                style: TextStyle(fontSize: 16)),
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(5),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 50,
                          width: 100,
                          color: Colors.red,
                          child: Text(
                            'Text Color',
                            style: TextStyle(fontSize: 16),
                          ),
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(5),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 50,
                          width: 100,
                          color: Colors.red,
                          child: Text('Share'),
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(5),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                builder: (context) {
                                  return Container(
                                    height: 150,
                                    child: ListView.builder(
                                      itemBuilder: (context, index) {
                                        return Container(
                                          width: 100,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 30, horizontal: 10),
                                          child: Text(
                                            "Shayari",
                                            style: TextStyle(
                                                fontFamily: fontfamily[index]),
                                          ),
                                          color: Colors.deepOrangeAccent,
                                        );
                                      },
                                      itemCount: fontfamily.length,
                                      scrollDirection: Axis.horizontal,
                                    ),
                                  );
                                },
                                context: context);
                          },
                          child: Container(
                            height: 50,
                            width: 100,
                            color: Colors.red,
                            child: Text('Font'),
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(5),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(onTap: () {
                          showModalBottomSheet(builder: (context) {
                            return Container(
                              height: 250,
                              child: ListView.builder(
                                itemCount: model.emoji.length,
                                itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                   setState(() {
                                     emoji = model.emoji[index];
                                   });
                                   Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: 70,
                                    alignment: Alignment.center,
                                    child: Text("${model.emoji[index]}",
                                        style: TextStyle(fontSize: 25)),
                                  ),
                                );
                              },),
                            );
                          } , context: context,);
                        },
                          child: Container(
                            height: 50,
                            width: 100,
                            color: Colors.red,
                            child: Text('Emoji'),
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(5),
                          ),
                        ) ,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(builder: (context) {
                              return Container(
                                height: 150,
                               child: StatefulBuilder(builder: (context, setState1) {
                                 return Slider(onChanged: (value) {
                                   setState1(() {
                                    setState(
                                      () {
                                        f = value;
                                      },
                                    ) ;
                                   },);
                                 } , value: f,min: 15,max: 70,);
                               },),
                              );
                            },context: context);
                          },
                          child: Container(
                            height: 50,
                            width: 100,
                            color: Colors.red,
                            child: Text('Text Size'),
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
