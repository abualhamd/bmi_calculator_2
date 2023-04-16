import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/utils/app_strings.dart';
import '../../../../app/utils/colors_manager.dart';
import '../../../../app/utils/decorations_and_styles.dart';
import '../../../components/card.dart';
import '../../../provider/bmi_provider.dart';

class HeightSlider extends StatelessWidget {
  const HeightSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<BMIProvider>();
    final read = context.read<BMIProvider>();

    return Expanded(
      child: CardWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.height,
              style: kActiveTitleTextStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  watch.bmiModel.height.toString(),
                  style: kNumbersTextStyle,
                ),
                Text(
                  AppStrings.cm,
                  style: TextStyle(
                    color: ColorsManager.greyColor,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SliderTheme(
              data: SliderThemeData(
                thumbColor: ColorsManager.pinkColor,
                overlayColor: ColorsManager.sliderOverlayColor,
                thumbShape: RoundSliderThumbShape(
                    enabledThumbRadius: 10, disabledThumbRadius: 10),
                overlayShape: RoundSliderOverlayShape(
                  overlayRadius: 25,
                ),
                activeTrackColor: ColorsManager.activeTrackColor,
                inactiveTrackColor: ColorsManager.inactiveTrackColor,
              ),
              child: Slider(
                value: watch.bmiModel.height.toDouble(),
                min: 120,
                max: 220,
                onChanged: (value) {
                  read.setHeight(height: value.round().toInt());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
