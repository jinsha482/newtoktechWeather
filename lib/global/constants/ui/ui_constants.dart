import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../styles/colors/colors.dart';



class UIConstants {

   Widget buttonlLoader({double size = 60, Color color = kWhite}) {
    return LoadingAnimationWidget.threeArchedCircle(
      size: size,
      color: color,
    );
  }
}