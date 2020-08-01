import 'package:flutter/material.dart';
import 'dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Zone",
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: TextTheme(
            display1:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            headline:
                TextStyle(color: Colors.white, fontWeight: FontWeight.normal)),
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/cgif.webp"),
                      fit: BoxFit.cover)),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                      text: "COVID-19\n",
                      style: Theme.of(context).textTheme.display1,
                    ),
                    TextSpan(
                      text: "\nSTAY HOME BE SAFE",
                      style: Theme.of(context).textTheme.headline,
                    ),
                  ]),
                )
              ],
            ),
          ),
          FittedBox(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Dashboard();
                }));
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 30.0),
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.red),
                child: Row(
                  children: <Widget>[
                    Text('View Details'),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
