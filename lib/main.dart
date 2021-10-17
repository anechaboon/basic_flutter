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

    // list data text widget
    List<Widget> data = [];
    data.add(Text("Press to Plus"));
    data.add(Text(
      number.toString(),
      style: TextStyle(fontSize: 60),
    ));
    data.add(Text("OK"));

    return Scaffold(
      appBar: AppBar(
        title: Text("Harty"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: data,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNumber,
        child: Icon(Icons.add),
      ),
    );
  }

  void addNumber() {
    setState(() {
      number++;
    });
  }
}
