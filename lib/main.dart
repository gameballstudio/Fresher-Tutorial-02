
import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:ui';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Tutorial 02',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Tutorial_02(title: 'Tutorial 02'),
    );
  }
}

class Tutorial_02 extends StatefulWidget {
  Tutorial_02({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _Tutorial_02State createState() => _Tutorial_02State();
}

class _Tutorial_02State extends State<Tutorial_02> {

  Color c = Colors.red;

  List<Widget> main_list = [Text(''),];

  Function delete = () {
  };

  Card tmp = new Card();

 void refresh() {
    makeList();
    setState(() {
    });
  // change color
  Random random = Random();
  // Pick a random number in the range [0.0, 1.0)
  double randomDouble = random.nextDouble();
  Color color = Color((randomDouble * 0xFFFFFF).toInt()).withOpacity(1.0);
  this.c = color;
 }

  List <String> l = [
    "Hi hi hi",
    "He he he",
    "Ha ha ha",
    "Hu hu hu"
  ];
  List <Text> t = [
    Text("Demo 01"),
    Text("Demo 02"),
    Text("Demo 03")
  ];

  Widget template(Text e, Function deleteObject) {
    this.tmp =  Card(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(e.data.toString(),
              style: TextStyle(fontSize: 20, color: this.c),
            ),
          ),
          FlatButton.icon(
              onPressed: (){
                print("Deleted: ${e.data.toString()}");
                // Card c = new Card( child: e);
                deleteObject(this.tmp);
              },
              icon: Icon(Icons.delete),
              label: Text('delete this')),
        ],
      ),
    );
    return this.tmp;
  }


  void makeList() {
    var list1 = l.map((e) {
      return template(Text(e), this.delete);
    }).toList();
    var list2 = t.map((e) {
      return template(e, this.delete);
    }).toList();
    list1.addAll(list2);
    main_list = list1;


  }

  @override
  Widget build(BuildContext context) {
    print("App state reloaded! | Width: ${window.physicalSize.width} | Height: ${window.physicalSize.height} |");
    print("---------------------------------------------------------");
    Function remove_text = (Widget o) {
      // setState(() {
      // });
      main_list.remove(o);
      main_list.map((t) {

        print("Check if Card text is text, then make the delete action");
      });

      print("Delete action");
      // main_list.removeAt(0);
      setState(() {
      });
    };
    this.delete = remove_text;
    // makeList();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black38,
        elevation: 0.0, // hide the drop shadow of the appbar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
            main_list,
         // make list of widget
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: refresh,
        tooltip: 'Refresh',
        elevation: 0.0,
        child: Icon(Icons.business),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
