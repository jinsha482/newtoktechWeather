import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../global/constants/images/images.dart';
import '../../../global/constants/styles/colors/colors.dart';
import '../../../global/constants/styles/text_styles/text_styles.dart';
import '../service/weatherservice.dart';

class FirstWeatherLayoutScreen extends StatelessWidget {
  const FirstWeatherLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Consumer<WeatherService>(builder: (context, userCtrl, child) {
        return
     Container(width: 200,
              decoration:  BoxDecoration(gradient: LinearGradient(colors: [kWhite,Colors.yellow.shade100])),
               child: Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 10.w),
                 child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ SizedBox(height: 20.h,),
                   KStyles().bold14(text: "Today's Report",color: kBlack),
                   Center(child: Image.network('https:${userCtrl.weatherModel.current?.condition?.icon.toString()}',)),
                   SizedBox(height: 10.h,),
                   Center(child: KStyles().bold14(text: '${userCtrl.weatherModel.current?.tempC}° C')),
                   SizedBox(height: 2.h,),
                    Center(child: KStyles().bold14(text: userCtrl.weatherModel.current?.condition?.text ?? '' )),
                    SizedBox(height: 5.h,),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: [ 
                          Expanded(flex:1,
                            child: Image.asset(cloud,width: 30.w,height: 30.h,)), Expanded(flex:1,child:Image.asset(wind,width: 30.w,height: 30.h)), Expanded(flex:1,child:Image.asset(humidity,width: 30.w,height: 30.h))
                        ],),
                         SizedBox(height: 5.h,),
                         Row(mainAxisAlignment: MainAxisAlignment.start,children: [ 
                      Expanded(flex:1, 
                        child: KStyles().semiBold10(text: 'Humidity')), Expanded(flex:1,child:KStyles().semiBold10(text: 'Wind')), Expanded(flex:1,child:KStyles().semiBold10(text: 'Cloud'))
                    ],),
                     SizedBox(height: 5.h,),
                     Padding(
                       padding: const EdgeInsets.only(left:8.0),
                       child: Row(mainAxisAlignment: MainAxisAlignment.start,children: [ 
                        Expanded(flex:1,
                          child: KStyles().semiBold10(text: userCtrl.weatherModel.current?.humidity.toString() ?? '')), Expanded(flex:1,child:KStyles().semiBold10(text: userCtrl.weatherModel.current?.windDegree.toString() ?? '' )), Expanded(flex:1,child:KStyles().semiBold10(text: userCtrl.weatherModel.current?.cloud.toString() ?? ''))
                                         ],),
                     )
                      ],
                    ),
                   SizedBox(height: 10.h,)
                   ],
                   ),
               ),);
  });
  }
}