import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../app/config/go_router.dart';
import '../../../app/utils/app_strings.dart';
import '../../../app/utils/colors_manager.dart';
import '../../../app/utils/enums/enums.dart';
import '../../components/count_widget.dart';
import '../../components/material_pink_button.dart';
import '../../provider/bmi_provider.dart';
import 'components/gender_row_widget.dart';
import 'components/height_slider_widget.dart';

class BMICalcuator extends StatelessWidget {
  const BMICalcuator();

  @override
  Widget build(BuildContext context) {
    final read = context.read<BMIProvider>();
    final watch = context.watch<BMIProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            AppStrings.appTitle,
            style: TextStyle(color: ColorsManager.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GenderRowWidget(
              choosenGender: watch.bmiModel.gender,
              onCardTapped: ({required Gender gender}) {
                read.setGender(gender: gender);
              },
            ),
            SizedBox(height: 20),
            HeightSlider(
              height: watch.bmiModel.height,
              onHeightChanged: (value) {
                read.setHeight(height: value.round().toInt());
              },
            ),
            SizedBox(height: 20),
            //? weight & age count widgets
            Row(
              // mainAxisAlignment: MainAxisAlignment.,
              children: [
                Expanded(
                  child: CountWidget(
                    title: AppStrings.weight,
                    count: watch.bmiModel.weight,
                    onIncrease: () {
                      read.incWeight();
                    },
                    onDecrease: () {
                      read.decWeight();
                    },
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: CountWidget(
                    title: AppStrings.age,
                    count: watch.bmiModel.age,
                    onIncrease: () {
                      read.incAge();
                    },
                    onDecrease: () {
                      read.decAge();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: MaterialPinkButton(
        onPressed: () {
          read.calcBMI();
          context.goNamed(AppRoutes.resultsRoute, extra: {
            "bmiIndex": read.bmiIndex,
            "interpretation": read.interpretation,
            "advice": read.advice,
          });
        },
        text: AppStrings.calcBMI,
      ),
    );
  }
}
