import 'package:basic_flutter/screen/formscreen.dart';
import 'package:flutter/material.dart';
import 'FoodMenu.dart';

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
  }}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: TabBarView(
            children: [FormScreen(), Container()],
          ),
          backgroundColor: Colors.lightBlueAccent,
          bottomNavigationBar: TabBar(tabs: [
            Tab(text: "บันทึกคะแนน",),
            Tab(text: "รายชื่อนักเรียน",),
          ]),
        ));
  }
}
