import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/utils/app_strings.dart';
import '../../../app/utils/colors_manager.dart';
import '../../../app/utils/decorations_and_styles.dart';
import '../../components/card.dart';
import '../../components/material_pink_button.dart';

class ResultsScreen extends StatelessWidget {
  final String interpretation;
  final int bmiIndex;
  final String advice;

  const ResultsScreen({
    required this.bmiIndex,
    required this.interpretation,
    required this.advice,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        context.pop();
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(AppStrings.appTitle),
        ),
        bottomNavigationBar: MaterialPinkButton(
          onPressed: () {
            context.pop();
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 65),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            interpretation,
                            style: TextStyle(
                                color: ColorsManager.greenColor,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            bmiIndex.toString(),
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
      ),
    );
  }
}
