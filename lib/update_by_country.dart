import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdateByCountry extends StatefulWidget {
  @override
  _UpdateByCountryState createState() => _UpdateByCountryState();
}

class _UpdateByCountryState extends State<UpdateByCountry> {
  String countryname = "Pakistan";
  TextEditingController nameController = TextEditingController();

  Widget buildCoulmnChildern(var confirmed, var recoverd, var death) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        containerforShowingCases(confirmed, Colors.orange[300], "Confirmed"),
        SizedBox(
          height: 15,
        ),
        containerforShowingCases(recoverd, Colors.green, "Recovered"),
        SizedBox(
          height: 15,
        ),
        containerforShowingCases(death, Colors.red[400], "Death"),
      ],
    );
  }

  Widget submitButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            setState(
              () {
                if (nameController.text.isEmpty) {
                  nameController.text = "Pakistan";
                  countryname = "Pakistan";
                } else {
                  countryname = nameController.text;
                }
              },
            );
          },
          child: Container(
            height: 30,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Center(
              child: Text(
                'Submit',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildtext(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget customtextfield() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black38),
        color: Colors.grey[300],
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      padding: EdgeInsets.only(left: 16),
      child: TextField(
        controller: nameController,
        onChanged: (value) {
          countryname = value;
        },
        decoration: InputDecoration(
          hintText: "Enter Country Name",
          hintStyle: TextStyle(color: Colors.grey[700]),
          border: InputBorder.none,
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget containerforShowingCases(var covidcase, Color color, String text) {
    return PhysicalModel(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(16)),
      elevation: 20,
      child: Container(
        padding: EdgeInsets.only(top: 20),
        height: 100,
        width: 350,
        color: Colors.white,
        child: Center(
            child: Column(
          children: [
            Text(
              text,
              style: TextStyle(color: color, fontSize: 30),
            ),
            Text(
              "$covidcase",
              style: TextStyle(color: color, fontSize: 20),
            ),
          ],
        )),
      ),
    );
  }

  getCountryData(BuildContext context) async {
    CountryData data;
    try {
      var response = await http.get(
        Uri.https(
          "covid19.mathdro.id",
          "api/countries/$countryname/",
        ),
      );
      var jsondata = jsonDecode(response.body);
      data = CountryData(
        confirmed: jsondata['confirmed']['value'],
        recovered: jsondata['recovered']['value'],
        death: jsondata['deaths']["value"],
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      return Navigator.pop(context);
                    });
                  },
                  child: Text('OK'))
            ],
            title: Text(
              'Error',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            content: Text(
              "There is error please check your internet connection or enter the valid conutry name",
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.justify,
            ),
          );
        },
      );
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.blue[800],
        title: Text(
          "Latest Update",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: 600,
          margin: EdgeInsets.only(bottom: 40),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.blue[800],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40))),
          child: Column(
            children: [
              customtextfield(),
              SizedBox(
                height: 20,
              ),
              submitButton(),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  buildtext(countryname == null ? "Name" : countryname),
                ],
              ),
              FutureBuilder(
                future: getCountryData(context),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return buildCoulmnChildern(snapshot.data.confirmed,
                        snapshot.data.recovered, snapshot.data.death);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CountryData {
  var confirmed;
  var recovered;
  var death;
  CountryData({
    @required this.confirmed,
    @required this.recovered,
    @required this.death,
  });
}
