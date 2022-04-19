import 'package:bmi_calculator/BMIModel.dart';
import 'package:bmi_calculator/ResultScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({Key? key}) : super(key: key);

  @override
  State<BMICalculatorScreen> createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  double _heightofUser = 100.0;
  double _weightofUser = 40.0;

  double _bmi = 0;

  late BMIModel _bmiModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 300,
                height: 300,
                child: SvgPicture.asset(
                  "assets/images/heart.svg",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "BMI Calculator",
                style: TextStyle(
                    color: Colors.red[700],
                    fontSize: 40,
                    fontWeight: FontWeight.w800),
              ),
              Text(
                "We can care about about you",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Your Hight (cm)",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
              Container(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Slider(
                    min: 80.0,
                    max: 300.0,
                    onChanged: (height) {
                      setState(() {
                        _heightofUser = height;
                      });
                    },
                    value: _heightofUser,
                    divisions: 100,
                    activeColor: Colors.pink,
                    label: "$_heightofUser",
                  )),
              Text(
                "Your height is $_heightofUser(cm)",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Slider(
                  min: 30.0,
                  max: 200.0,
                  onChanged: (height) {
                    setState(() {
                      _weightofUser = height;
                    });
                  },
                  value: _weightofUser,
                  divisions: 100,
                  activeColor: Colors.pink,
                  label: "$_weightofUser",
                ),
              ),
              Text(
                "Your Weight is $_weightofUser(kg)",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 16, right: 16),
                child: FlatButton.icon(
                  onPressed: () {
                    setState(() {
                      _bmi = (_weightofUser) /
                          (_heightofUser / 100) *
                          (_heightofUser / 100);
                      if (_bmi >= 18.5 && _bmi <= 25) {
                        _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: true,
                            comments: "Your are fit");
                      } else if (_bmi < 18.5) {
                        _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: false,
                            comments: "Your are underweight");
                      } else if (_bmi > 25 && _bmi <= 30) {
                        _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: false,
                            comments: "You are Overweight");
                      } else {
                        _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: false,
                            comments: "You are obesed");
                      }
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultScreen(
                                  bmiModel: _bmiModel,
                                )));
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  label: Text("Calculate IBM"),
                  textColor: Colors.white,
                  color: Colors.pink,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
