import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:love_shayari/model.dart';
import 'package:share_plus/share_plus.dart';


import 'fourthpage.dart';

class thirdpage extends StatefulWidget {
  int i;
  List temp;
  int t;

  thirdpage(this.i, this.temp, this.t);

  @override
  State<thirdpage> createState() => _thirdpageState();
}

class _thirdpageState extends State<thirdpage> {

  PageController? p;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    p = PageController(initialPage: widget.i);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${model.title[widget.t]}'),
        ),
        body: Column(
          children: [
            Container(
              height: 50,
              width: 370,
              color: Colors.white,
              alignment: Alignment.center,
              child: Text("${widget.i + 1} / ${widget.temp.length}"),
            ),
            Container(
                height: 300,
                width: 350,
                alignment: Alignment.center,
                color: Colors.orange,
                child: PageView.builder(
                  controller: p,
                  onPageChanged: (value) {
                    setState(() {
                      widget.i = value;
                      print(value);
                    });
                  },
                  itemCount: widget.temp.length,
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.center,
                      child: Text(
                        "${widget.temp[widget.i]}",
                        style: TextStyle(fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                )),
            Spacer(),
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.lightGreen,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      FlutterClipboard.copy("${widget.temp[widget.i]}")
                          .then((value) {
                        Fluttertoast.showToast(
                            msg: "copy",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      });
                    },
                    icon: Icon(Icons.copy),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          if (widget.i > 0) {
                            widget.i--;
                            p!.jumpToPage(widget.i);
                          }
                        });
                      },
                      icon: Icon(Icons.chevron_left)),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  fourthpage(widget.temp[widget.i], widget.t),
                            ));
                      },
                      icon: Icon(Icons.edit)),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          if (widget.i < widget.temp.length - 1) {
                            widget.i++;
                            p!.jumpToPage(widget.i);
                          }
                        });
                      },
                      icon: Icon(Icons.chevron_right)),
                  IconButton(
                    onPressed: () {
                      Share.share("${widget.temp[widget.i]}");
                    },
                    icon: Icon(Icons.share),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
