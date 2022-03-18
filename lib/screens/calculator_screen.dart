import 'package:bmi_calculator_2/components/card.dart';
import 'package:bmi_calculator_2/components/count_widget.dart';
import 'package:bmi_calculator_2/components/gender_card.dart';
import 'package:bmi_calculator_2/constants/colors.dart';
import 'package:bmi_calculator_2/constants/decorations_and_styles.dart';
import 'package:bmi_calculator_2/models/count_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'results_screen.dart';
import 'package:bmi_calculator_2/models/calculator_brain.dart';
import 'package:provider/provider.dart';

enum gender {
  male,
  female,
}

class BMICalcuator extends StatefulWidget {
  @override
  _BMICalcuatorState createState() => _BMICalcuatorState();
}

class _BMICalcuatorState extends State<BMICalcuator> {
  gender? selectedGender;
  int heightValue = 180;

  // CountData countData = CountData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI Calcuator',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: kBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = gender.male;
                      });
                    },
                    child: GenderCard(
                      gender: 'Male',
                      genderIconData: Icons.male,
                      color: selectedGender == gender.male
                          ? Colors.white
                          : kGreyColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = gender.female;
                      });
                    },
                    child: GenderCard(
                      gender: 'Female',
                      genderIconData: Icons.female,
                      color: selectedGender == gender.female
                          ? Colors.white
                          : kGreyColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: CardWidget(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style: kActiveTitleTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '$heightValue',
                          style: kNumbersTextStyle,
                        ),
                        Text(
                          'cm',
                          style: TextStyle(
                            color: kGreyColor,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                        thumbColor: kPinkColor,
                        overlayColor: Color(0xFF6D0B47),
                        thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 10, disabledThumbRadius: 10),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 25,
                        ),
                        activeTrackColor: Color(0xFFD7DDE4),
                        inactiveTrackColor: Color(0xFF9094B2),
                      ),
                      child: Slider(
                        value: heightValue.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (value) {
                          setState(() {
                            heightValue = value.round().toInt();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.,
              children: [
                Expanded(
                  child: CountWidget(
                    title: 'Weight',
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: CountWidget(
                    title: 'Age',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: MaterialButton(
        height: 50,
        color: kPinkColor,
        child: Text(
          'Calculate your BMI',
          style: kActiveTitleTextStyle,
        ),
        onPressed: () {
          CalcBrain brain = CalcBrain(
            weight: Provider.of<CountData>(context, listen: false).showWeight,
            height: heightValue,
          );
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ResultsScreen(
              bmi: brain.calcBMI,
              intrprt: brain.interpretation,
              advice: brain.advice,
            );
          }));
        },
      ),
    );
  }
}
