import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResultScreen extends StatelessWidget {
  //const ResultScreen({Key? key}) : super(key: key);
  final bmiModel;
   ResultScreen({this.bmiModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              width: 200,
              height: 200,
              child: bmiModel.isNormal ? SvgPicture.asset("assets/images/happy.svg", fit: BoxFit.contain,) :
              SvgPicture.asset("assets/images/sad.svg", fit: BoxFit.contain,)
          ),

          SizedBox(
            height: 20,
          ),
          Text("Your BMI is ${bmiModel.bmi}", style: TextStyle(color: Colors.red, fontSize: 36, fontWeight: FontWeight.w900),),
          bmiModel.isNormal ?
          Text(" You are absesd", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),)
              :
          Text(" You are underwieght", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),),

          SizedBox(
            height: 20,
          ),
          bmiModel.isNormal ?
          Text("Hurrah! Your weight is normal", style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w400),)
              :
          Text("Sad You weight is not normal", style:  TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w400),)
        ],
      ),
    ),
    );
  }
}
