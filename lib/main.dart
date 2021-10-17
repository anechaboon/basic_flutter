import 'package:flutter/material.dart';

void main() {
  var app = MyApp();
  runApp(app);
}

// create widget
class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: MyHomePage(),
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int number = 0; // create state

  @override
  Widget build(BuildContext context) {
    // display
    return Scaffold(
      appBar: AppBar(
        title: Text("Harty"),
      ),
      body: Center(
        child: ListView(
          children: getData(10),
        ),
      ),
    );
  }

  //prepare data
  List<Widget> getData(int count) {
    List<Widget> data = [];
    for (var i = 1; i <= count; i++) {
      var menu = Text(
        "number ${i}",
        style: TextStyle(fontSize: 25),
      );
      data.add(menu);
    }
    return data;
  }
}
