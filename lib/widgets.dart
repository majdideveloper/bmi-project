import 'package:flutter/material.dart';

Widget maleOrFemale(
        {String text = 'MALE',
        IconData icon = Icons.male,
        Color color = Colors.black54}) =>
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 160,
            ),
            Text(
              '$text',
              style: TextStyle(
                fontSize: 36,
              ),
            ),
          ],
        ),
      ),
    );

Widget sliderUnit({
  String titleOfWidget = 'Height',
  double min = 20,
  double max = 70,
  String unit = 'cm',
  double valueOfValue = 60,
  void Function(double)? onchanged,
}) =>
    Container(
      child: Column(
        children: [
          Text(
            titleOfWidget,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          Slider(
            activeColor: Colors.black,
            max: max,
            min: min,
            value: valueOfValue,
            onChanged: onchanged,
          ),
          Text(
            '$titleOfWidget :${valueOfValue.round()} $unit',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
