import 'dart:math';

import 'package:bmi_project/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double valueHeight = 150;
  double valueAge = 20;
  double valueWeight = 75;
  double result = 0;
  bool isMale = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        isMale = true;
                        print(isMale);
                      });
                    },
                    child: Expanded(
                        child: maleOrFemale(
                      color: isMale ? Colors.black54 : Colors.grey,
                    ))),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = !isMale;
                      print(isMale);
                    });
                  },
                  child: Expanded(
                    child: maleOrFemale(
                      text: "FEMALE",
                      icon: Icons.female,
                      color: isMale ? Colors.grey : Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: sliderUnit(
                max: 250,
                min: 70,
                titleOfWidget: 'Height',
                unit: "cm",
                valueOfValue: valueHeight,
                onchanged: (value) {
                  setState(() {
                    valueHeight = value;
                  });
                }),
          ),
          Expanded(
            flex: 1,
            child: sliderUnit(
                titleOfWidget: 'weight',
                max: 200,
                min: 10,
                unit: 'Kg',
                valueOfValue: valueWeight,
                onchanged: (value) {
                  setState(() {
                    valueWeight = value;
                  });
                }),
          ),
          Expanded(
            flex: 1,
            child: sliderUnit(
                titleOfWidget: 'Age',
                max: 100,
                min: 1,
                unit: 'years',
                valueOfValue: valueAge,
                onchanged: (value) {
                  setState(() {
                    valueAge = value;
                  });
                }),
          ),
          Container(
            padding: EdgeInsetsDirectional.only(
              bottom: 10,
            ),
            child: Text(
              'your BMI = ${result.toInt().toString()}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
                result = valueWeight / pow(valueHeight / 100, 2);
              });
            },
            child: Text('Calculate'),
            height: 60,
            color: Colors.black45,
            minWidth: double.infinity,
          )
        ],
      ),
    );
  }
}
