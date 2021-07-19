import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    @required this.icon,
    @required this.text,
    @required this.iconColor,
    @required this.backgroundColor,
    @required this.onprsd,
  });
  final IconData icon;
  final String text;
  final Color iconColor;
  final Color backgroundColor;
  final VoidCallback onprsd;
  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: backgroundColor,
      elevation: 40,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.only(left: 10),
        height: 60,
        width: 300,
        child: TextButton(
          onPressed: onprsd,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
                color: iconColor,
                size: 40,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              Opacity(
                opacity: 0,
                child: Icon(
                  Icons.update,
                  color: iconColor,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
