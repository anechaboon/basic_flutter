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
        body: ListView.builder(
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              "number ${index+1}",
              style: TextStyle(fontSize: 25),
            ),
            subtitle: Text("minor 1"),
          );
        }));
  }
}
