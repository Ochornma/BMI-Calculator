import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/reusable_card.dart';
import '../components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
final String resultTest;
final String interpreation;
final String bmiResult;

ResultsPage({@required this.bmiResult, @required this.resultTest, @required this.interpreation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child:
          Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text("Your Result", style: kTitleTextStyle,
            ),
          )
          ),
          Expanded(
            flex: 5,
              child: ReusableCard(
                color: kInactiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(resultTest.toUpperCase(), style: kResultTextStyle,),
                    Text(bmiResult, style: kBMITextStyle,),
                    Text(interpreation,
                      textAlign: TextAlign.center,
                      style: kInterTextStyle,),


                  ],
                ),
              )
          ),
          BottomButton(onTap: (){
            Navigator.pop(context);
          }, title: "RE-CALCULATE")
        ],
      ),
    );
  }
}
