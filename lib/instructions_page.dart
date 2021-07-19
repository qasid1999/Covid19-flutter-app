import 'package:flutter/material.dart';

class InstructionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        toolbarHeight: 70,
        backgroundColor: Colors.blue[800],
        title: Text(
          "Instructions",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: 550,
          margin: EdgeInsets.only(bottom: 40),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.blue[800],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40))),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              instructionTextWidget(
                "Frequently clean your hands with soap and water, or an alcohol-based hand rub",
              ),
              SizedBox(
                height: 14,
              ),
              instructionTextWidget(
                "Clean your hands before you put your mask on, as well as before and after you take it off, and after you touch it at any time.",
              ),
              SizedBox(
                height: 14,
              ),
              instructionTextWidget(
                "Clean and disinfect surfaces frequently especially those which are regularly touched, such as door handles, faucets and phone screens.",
              ),
              SizedBox(
                height: 14,
              ),
              instructionTextWidget(
                  "Make sure it covers both your nose, mouth and chin."),
              SizedBox(
                height: 14,
              ),
              instructionTextWidget("Don’t use masks with valves"),
            ],
          ),
        ),
      ),
    );
  }

  Widget instructionTextWidget(String text) {
    return ListTile(
      leading: Icon(
        Icons.circle,
        size: 17,
        color: Colors.white,
      ),
      title: Text(
        text,
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 17, color: Colors.white),
      ),
    );
  }
}
