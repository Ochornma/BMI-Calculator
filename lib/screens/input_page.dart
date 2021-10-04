import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/card_child.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/card_child.dart';
import '../constants.dart';
import '../components/round_button.dart';
import '../components/bottom_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';



enum Gender{
  Male,
  Female,
}

enum Side{
  left,
  right,
}

class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender;
  int height = 180;
  int leftWeight = 60;
  int age = 20;

  void tapDetected(Gender gender){
    setState(() {
      this.gender = gender;
    });
  }

  void weightDecreased(Side side){
    setState(() {
      side == Side.left ? leftWeight-- : age--;
    });
  }
  void weightIncreased(Side side){
    setState(() {
      side == Side.left ? leftWeight++ : age++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: Row(
              children: [
                Expanded(child: ReusableCard(color: gender == Gender.Male ? kActiveColor : kInactiveColor, onTap: (){
                  tapDetected(Gender.Male);
                },
                  cardChild: CardChild(
                    icon: FontAwesomeIcons.mars,
                    iconSize: 80.0,
                    text: "MALE",

                  ),
                )
                ),
                Expanded(child: ReusableCard(color: gender == Gender.Female ? kActiveColor : kInactiveColor,
                  onTap: (){
                    tapDetected(Gender.Female);
                  },
                  cardChild: CardChild(
                    icon: FontAwesomeIcons.venus,
                    iconSize: 80.0,
                    text: "FEMALE",
                  ),))
              ],
            ),
            ),
            Expanded(child:
            ReusableCard(color: kActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("HEIGHT", style: kTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumberStyle,),
                      Text("cm", style: kTextStyle,)
                    ],),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xff8d8e98),
                        thumbColor: Color(0xffeb1555),
                        overlayColor: Color(0x29eb1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 32)
                    ),
                    child: Slider(value: height.toDouble(),
                        min: 120,
                        max: 220,

                        onChanged: (newHeight){
                          setState(() {
                            height = newHeight.round();
                          });
                        }),
                  )
                ],
              ),
            ),
            ),
            Expanded(child:
            Row(
              children: [
                Expanded(child:
                ReusableCard(color: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("WEIGHT", style: kTextStyle,
                        ),
                        Text(leftWeight.toString(), style: kNumberStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                weightIncreased(Side.left);
                              },),
                            SizedBox(width: 10.0,),
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                weightDecreased(Side.left);
                              },)
                          ],
                        )
                      ],
                    )
                )
                ),
                Expanded(child:
                ReusableCard(color: kActiveColor, cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("AGE", style: kTextStyle,
                    ),
                    Text(age.toString(), style: kNumberStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            weightIncreased(Side.right);
                          },),
                        SizedBox(width: 10.0,),
                        RoundIconButton(icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            weightDecreased(Side.right);
                          },)
                      ],
                    )
                  ],
                ),
                )
                )
              ],
            ),
            ),
            BottomButton(onTap:(){
              CalculatorBrain cal = CalculatorBrain(weight: leftWeight, height: height);

              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
                  bmiResult: cal.calculateBMI(),
                interpreation: cal.getInterpre(),
                resultTest: cal.getResult(),

              )));
            }, title: "CONTINUE",)
          ],
        )

    );
  }
}



