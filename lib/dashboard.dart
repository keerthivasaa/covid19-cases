import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

Future<Covid> fetchData() async {
  final response = await http
      .get('https://corona.lmao.ninja/v2/countries/india?yesterday=false');
  if (response.statusCode == 200) {
    return Covid.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Covid');
  }
}

class Covid {
  final int cases;
  final int deaths;
  final int recovered;
  final int active;
  final int updated;

  Covid({this.cases, this.deaths, this.recovered, this.active, this.updated});

  factory Covid.fromJson(Map<String, dynamic> jsno) {
    return Covid(
      cases: jsno['cases'],
      deaths: jsno['deaths'],
      recovered: jsno['recovered'],
      active: jsno['active'],
      updated: jsno['updated'],
    );
  }
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Future<Covid> futureCovid;
  @override
  void initState() {
    // TODO: implement initState
    futureCovid = fetchData();
    super.initState();
  }

  String _dataValue(int timeInMillis) {
    var date = DateTime.fromMillisecondsSinceEpoch(timeInMillis);
    var formattedDate = DateFormat("EEEE (dd-MM-yyy, hh:mm a)").format(date);
    return formattedDate.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Covid>(
          future: futureCovid,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: <Widget>[
                  Expanded(
                    flex: 8,
                    child: new SafeArea(
                      top: false,
                      bottom: false,
                      minimum: const EdgeInsets.all(0.0),
                      child: new Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/virus.gif"),
                              fit: BoxFit.fitWidth),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 25, right: 20, bottom: 25),
                    height: 70,
                    width: 300,
                    decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.amber.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: Colors.black38,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            'Cases : ',
                            style:
                                TextStyle(fontSize: 30.0, color: Colors.amber),
                          ),
                          Text(
                            snapshot.data.cases.toString(),
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.amber),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 25, right: 20, bottom: 25),
                    height: 70,
                    width: 300,
                    decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.red.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: Colors.black38,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            'Deaths : ',
                            style: TextStyle(fontSize: 30.0, color: Colors.red),
                          ),
                          Text(
                            snapshot.data.deaths.toString(),
                            style: TextStyle(fontSize: 25.0, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 25, right: 20, bottom: 25),
                    height: 70,
                    width: 300,
                    decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.green.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: Colors.black38,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            'Recover : ',
                            style:
                                TextStyle(fontSize: 30.0, color: Colors.green),
                          ),
                          Text(
                            snapshot.data.recovered.toString(),
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 25, right: 20, bottom: 25),
                    height: 70,
                    width: 300,
                    decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.white.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: Colors.black38,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            'Active : ',
                            style:
                                TextStyle(fontSize: 30.0, color: Colors.white),
                          ),
                          Text(
                            snapshot.data.active.toString(),
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                  ' Last Update : ${_dataValue(snapshot.data.updated)}'),
                            ],
                          ),
                        ),
                      ))
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
