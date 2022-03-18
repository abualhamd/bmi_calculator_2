import 'package:bmi_calculator_2/components/card.dart';
import 'package:bmi_calculator_2/constants/colors.dart';
import 'package:bmi_calculator_2/constants/decorations_and_styles.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  final String bmi;
  final String intrprt;
  final String advice;

  ResultsScreen({
    required this.bmi,
    required this.intrprt,
    required this.advice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: null,
        title: Text('BMI Calculator'),
      ),
      bottomNavigationBar: MaterialButton(
        onPressed: () {
          Navigator.pop(context);
        },
        height: 50,
        color: kPinkColor,
        child: Text(
          'Re-calculate your BMI',
          style: kActiveTitleTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Your Result',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: CardWidget(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 65),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          intrprt,
                          style: TextStyle(
                              color: kGreenColor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          bmi,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 90,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'Normal BMI range:',
                              style: kInctiveTitleTextStyle,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '18,5 - 25 kg/m2',
                              style: kActiveTitleTextStyle,
                            ),
                          ],
                        ),
                        Text(
                          advice,
                          textAlign: TextAlign.center,
                          style: kActiveTitleTextStyle,
                        ),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
