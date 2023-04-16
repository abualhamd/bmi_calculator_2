import 'package:flutter/material.dart';

import '../../app/utils/colors_manager.dart';
import '../../app/utils/decorations_and_styles.dart';

class MaterialPinkButton extends StatelessWidget {
  const MaterialPinkButton(
      {Key? key, required VoidCallback onPressed, required String text})
      : _child = text,
        _onPressed = onPressed,
        super(key: key);

  final VoidCallback _onPressed;
  final String _child;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: _onPressed,
      child: Text(
        _child,
        style: kActiveTitleTextStyle,
      ),
      height: 50,
      color: ColorsManager.pinkColor,
    );
  }
}
