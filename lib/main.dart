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
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<FoodMenu> menu = [
    FoodMenu("Shrimp","2000","assets/images/Shrimp.jpg"),
    FoodMenu("Pork","100","assets/images/Pork.jpg"),
  ];
  int number = 0; // create state

  @override
  Widget build(BuildContext context) {
    // display
    return Scaffold(
        appBar: AppBar(
          title: Text("Harty"),
        ),
        body: ListView.builder(
          itemCount: menu.length,
          itemBuilder: (BuildContext context, int index) {
            FoodMenu food = menu[index];
            return ListTile(
              leading: Image.asset(food.img),
              title: Text(
                "${food.name}",
                style: TextStyle(fontSize: 25),
              ),
              subtitle: Text("price ${food.price}"),
            );
        }));
  }
}
