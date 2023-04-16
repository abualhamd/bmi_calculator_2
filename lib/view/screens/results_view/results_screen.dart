import 'package:bmi_calculator_2/view/components/card.dart';
import 'package:bmi_calculator_2/app/utils/colors_manager.dart';
import 'package:bmi_calculator_2/app/utils/decorations_and_styles.dart';
import 'package:bmi_calculator_2/view/components/material_pink_button.dart';
import 'package:bmi_calculator_2/view/provider/bmi_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/utils/app_strings.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen();

  @override
  Widget build(BuildContext context) {
    final read = context.read<BMIProvider>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(AppStrings.appTitle),
      ),
      bottomNavigationBar:
          MaterialPinkButton(
        onPressed: () {
          Navigator.pop(context);
        },
        text: AppStrings.reCalcBMI,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                AppStrings.youResult,
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
                          read.interpretation,
                          style: TextStyle(
                              color: ColorsManager.greenColor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          read.bmiIndex.toInt().toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 90,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              AppStrings.normalBMIRange,
                              style: kInctiveTitleTextStyle,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              AppStrings.normalRange,
                              style: kActiveTitleTextStyle,
                            ),
                          ],
                        ),
                        Text(
                          read.advice,
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
