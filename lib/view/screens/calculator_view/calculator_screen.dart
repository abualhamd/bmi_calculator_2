import 'package:bmi_calculator_2/view/components/count_widget.dart';
import 'package:bmi_calculator_2/app/utils/colors_manager.dart';
import 'package:bmi_calculator_2/view/components/material_pink_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../app/config/routes_manager.dart';
import '../../../app/utils/app_strings.dart';

import '../../provider/bmi_provider.dart';
import 'components/gender_row_widget.dart';
import 'components/height_slider_widget.dart';

class BMICalcuator extends StatelessWidget {
  const BMICalcuator();

  @override
  Widget build(BuildContext context) {
    final read = context.read<BMIProvider>();
    
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
            const GenderRowWidget(),
            SizedBox(
              height: 20,
            ),
            const HeightSlider(),
            SizedBox(
              height: 20,
            ),
            //? weight & age count widgets
            Row(
              // mainAxisAlignment: MainAxisAlignment.,
              children: [
                Expanded(
                  child: CountWidget(
                    title: AppStrings.weight,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: CountWidget(
                    title: AppStrings.age,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: MaterialPinkButton(onPressed: () {
        read.calcBMI();
        Navigator.pushNamed(context, Routes.resultsRoute);
      }, text: AppStrings.calcBMI),
    );
  }
}
