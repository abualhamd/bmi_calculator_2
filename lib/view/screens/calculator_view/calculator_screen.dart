import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import '../../../app/config/go_router.dart';
import '../../../app/utils/app_strings.dart';
import '../../../app/utils/colors_manager.dart';
import '../../../app/utils/enums/enums.dart';
import '../../components/count_widget.dart';
import '../../components/material_pink_button.dart';
import 'components/gender_row_widget.dart';
import 'components/height_slider_widget.dart';

class BMICalcuator extends HookWidget {
  const BMICalcuator();

  @override
  Widget build(BuildContext context) {
    int calcBMI({required int weight, required int height}) {
      final value = weight / ((height / 100) * (height / 100));
      return value.toInt();
    }

    String getInterpretation({required int bmiIndex}) {
      if (bmiIndex >= 25) {
        return AppStrings.overweight;
      } else if (bmiIndex >= 18) {
        return AppStrings.normal;
      } else {
        return AppStrings.underweight;
      }
    }

    String getAdvice({required int bmiIndex}) {
      if (bmiIndex >= 25) {
        return AppStrings.overweightMessage;
      } else if (bmiIndex >= 18) {
        return AppStrings.normalMessage;
      } else {
        return AppStrings.underweightMessage;
      }
    }

    ValueNotifier<Gender?> genderState = useState(null);
    var height = useState(180);
    var weight = useState(78);
    var age = useState(20);

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
              choosenGender: genderState.value,
              onCardTapped: ({required Gender gender}) {
                genderState.value = gender;
              },
            ),
            SizedBox(height: 20),
            HeightSlider(
              height: height.value,
              onHeightChanged: (value) {
                height.value = value.round().toInt();
              },
            ),
            SizedBox(height: 20),
            //? weight & age count widgets
            Row(
              children: [
                Expanded(
                  child: CountWidget(
                    title: AppStrings.weight,
                    count: weight.value,
                    onIncrease: () {
                      weight.value++;
                    },
                    onDecrease: () {
                      weight.value--;
                    },
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: CountWidget(
                    title: AppStrings.age,
                    count: age.value,
                    onIncrease: () {
                      age.value++;
                    },
                    onDecrease: () {
                      age.value--;
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
          final bmiIndex = calcBMI(
            weight: weight.value,
            height: height.value,
          );
          final interpretation = getInterpretation(bmiIndex: bmiIndex);
          final advice = getAdvice(bmiIndex: bmiIndex);
          context.goNamed(AppRoutes.resultsRoute, extra: {
            "bmiIndex": bmiIndex,
            "interpretation": interpretation,
            "advice": advice,
          });
        },
        text: AppStrings.calcBMI,
      ),
    );
  }
}
