import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdatePage extends StatefulWidget {
  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  getUpdate() async {
    var response =
        await http.get(Uri.https("corona.lmao.ninja", "v3/covid-19/all/"));
    var jsondata = jsonDecode(response.body);

    UpdateOfCovid getteData = UpdateOfCovid(
      confirmed: jsondata['cases'],
      active: jsondata['active'],
      death: jsondata['deaths'],
      recovered: jsondata['recovered'],
    );
    return getteData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        toolbarHeight: 70,
        backgroundColor: Colors.blue[100],
        title: Text(
          "Latest Update",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: getUpdate(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'World Wide',
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      IconButton(icon: Icon(Icons.refresh), onPressed: () {}),
                    ],
                  ),
                  SizedBox(height: 20),
                  BuildChildernOfColumn(
                    text1: "Confirmed",
                    text2: "Recovered",
                    container1Color: Colors.cyan,
                    container2Color: Colors.green[200],
                    text1Color: Colors.white,
                    text2Color: Colors.white,
                    case1: snapshot.data.confirmed,
                    case2: snapshot.data.recovered,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BuildChildernOfColumn(
                    text1: "Death",
                    text2: "Active",
                    container2Color: Colors.cyan,
                    container1Color: Colors.red[200],
                    text1Color: Colors.white,
                    text2Color: Colors.white,
                    case1: snapshot.data.death,
                    case2: snapshot.data.active,
                  ),
                ],
              );
          },
        ),
      ),
    );
  }
}

class BuildChildernOfColumn extends StatelessWidget {
  BuildChildernOfColumn({
    this.text1,
    this.text2,
    this.container1Color,
    this.container2Color,
    this.text1Color,
    this.text2Color,
    this.case1,
    this.case2,
  });
  final String text1;
  final String text2;
  final Color text1Color;
  final Color text2Color;
  final Color container1Color;
  final Color container2Color;
  var case1;
  var case2;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildChildernOfRow(text1, container1Color, text1Color, case1),
        SizedBox(
          width: 20,
        ),
        buildChildernOfRow(text2, container2Color, text2Color, case2),
      ],
    );
  }

  Widget buildChildernOfRow(
      String text, Color color, Color textColor, var cases) {
    return Expanded(
      child: PhysicalModel(
        elevation: 20,
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: color,
        child: Container(
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$text',
                style: TextStyle(
                    color: textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "$cases",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class UpdateOfCovid {
  var confirmed;
  var active;
  var death;
  var recovered;
  UpdateOfCovid({
    this.confirmed,
    this.active,
    this.death,
    this.recovered,
  });
}
