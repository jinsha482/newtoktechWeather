import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newtoktechassignment/global/constants/styles/colors/colors.dart';

import '../styles/text_styles/text_styles.dart';
import '../ui/ui_constants.dart';

class CommonButtons {

  
Widget elevatedButton(String text, Color color,Function() ?onPressed,bool isLoading,double width){
    return SizedBox(width: width,height: 45.h,
      child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor:kBlack , shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), 
        ),),
        onPressed: onPressed, child: isLoading ?  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: UIConstants().buttonlLoader()
                    ) :
                    KStyles().med17(text:text,color: color)
    ));
  }
}