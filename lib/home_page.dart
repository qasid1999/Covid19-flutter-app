import 'package:covid_19_app/update_by_country.dart';
import 'package:covid_19_app/update_page.dart';
import 'package:flutter/material.dart';

import 'custome_button.dart';
import 'instructions_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'images/coronaimage.png',
                  height: 200,
                  width: 150,
                ),
                SizedBox(
                  height: 40,
                ),
                CustomButton(
                  icon: Icons.update_sharp,
                  text: 'Updates',
                  iconColor: Colors.amber,
                  backgroundColor: Colors.cyan[200],
                  onprsd: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return UpdatePage();
                    }));
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                CustomButton(
                  icon: Icons.integration_instructions,
                  text: 'Instructions',
                  iconColor: Colors.cyan,
                  backgroundColor: Colors.orange[200],
                  onprsd: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return InstructionPage();
                        },
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                CustomButton(
                  icon: Icons.home,
                  text: 'Updates by Country',
                  iconColor: Colors.orange[200],
                  backgroundColor: Colors.cyan[200],
                  onprsd: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return UpdateByCountry();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
