import 'package:flutter/material.dart';

import '../../app/utils/colors_manager.dart';

class CircularPushButton extends StatelessWidget {
  final IconData iconData;
  final String count;
  final VoidCallback onPressed;

  CircularPushButton({
    required this.iconData,
    required this.count,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 10,
      fillColor: ColorsManager.greyColor,
      //RoundedRectangleBorder(borderRadius: BorderRadius.circular(60))
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(width: 45, height: 45),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          iconData,
          color: Colors.white,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
