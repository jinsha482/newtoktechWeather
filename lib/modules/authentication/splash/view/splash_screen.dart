
import 'package:flutter/material.dart';
import 'package:newtoktechassignment/global/constants/images/images.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newtoktechassignment/global/constants/styles/text_styles/text_styles.dart';

import '../../../../global/constants/styles/colors/colors.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () async {
        Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kWhite,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [ 
           Center(child: Image.asset(splash,width: 150.w,height: 150.h,))  ,
           SizedBox(height: 10.h,),
           Center(child: KStyles().bold17(text: 'Weather App'),)
        ],
      ),
    );
  }
}