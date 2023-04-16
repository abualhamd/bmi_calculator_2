import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/utils/app_strings.dart';
import '../../../../app/utils/colors_manager.dart';
import '../../../../app/utils/enums/enums.dart';
import '../../../components/gender_card.dart';
import '../../../provider/bmi_provider.dart';

class GenderRowWidget extends StatelessWidget {
  const GenderRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<BMIProvider>();
    final read = context.read<BMIProvider>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              read.setGender(gender: Gender.male);
            },
            child: GenderCard(
              gender: AppStrings.male,
              genderIconData: Icons.male,
              color: watch.bmiModel.gender == Gender.male
                  ? ColorsManager.white
                  : ColorsManager.greyColor,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              read.setGender(gender: Gender.female);
            },
            child: GenderCard(
              gender: AppStrings.female,
              genderIconData: Icons.female,
              color: watch.bmiModel.gender == Gender.female
                  ? ColorsManager.white
                  : ColorsManager.greyColor,
            ),
          ),
        ),
      ],
    );
  }
}
