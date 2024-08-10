import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:newtoktechassignment/global/constants/styles/colors/colors.dart';
import 'package:newtoktechassignment/global/constants/styles/text_styles/text_styles.dart';
import 'package:newtoktechassignment/modules/user/widget/fifthlayout.dart';
import 'package:newtoktechassignment/modules/user/widget/firstlayout.dart';
import 'package:newtoktechassignment/modules/user/widget/fourthlayout.dart';
import 'package:newtoktechassignment/modules/user/widget/secondlayout.dart';
import 'package:newtoktechassignment/modules/user/widget/thirdlayout.dart';

import 'package:provider/provider.dart';


import '../service/weatherservice.dart';

class WeatherReportScreen extends StatelessWidget {
  const WeatherReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: kWhite,
        title: KStyles().bold20(text: 'Weather Layouts'),centerTitle: true,
      ),
      body: Consumer<WeatherService>(builder: (context, userCtrl, child) {
        return
       Padding(
        padding:  EdgeInsets.symmetric(horizontal:10.w),
        child: SingleChildScrollView(physics: const BouncingScrollPhysics(),
          child: Column(
            children: [ 
              SizedBox(height: 20.h,),
             const FirstWeatherLayoutScreen(),
             SizedBox(height: 10.h,),
             const SecondLayOutScreen(),
                SizedBox(height: 10.h,),
                const ThirdLayOutScreen(),
               SizedBox(height: 5.h,),
                  const FourthLayoutScreen(),
                 SizedBox(height: 10.h,),
                   const FifthLayoutScreen(),
                      SizedBox(height: 7.h,),
                  
                     
                
            ]
            
          ),
        ),
      );
      })
    );
  }
}