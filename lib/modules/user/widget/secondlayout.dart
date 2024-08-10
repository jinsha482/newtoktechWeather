import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../global/constants/styles/colors/colors.dart';
import '../../../global/constants/styles/text_styles/text_styles.dart';
import '../service/weatherservice.dart';

class SecondLayOutScreen extends StatelessWidget {
  const SecondLayOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return  Consumer<WeatherService>(builder: (context, userCtrl, child) {
    return  Container(width: 200,
              decoration:  const BoxDecoration(gradient: LinearGradient(colors: [Color.fromARGB(255, 87, 39, 176),kBlack])),
               child: Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 10.w),
                 child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ SizedBox(height: 20.h,),
                   KStyles().bold14(text: userCtrl.setGreeting(userCtrl.weatherModel.location?.localtime.toString() ?? ''),color: kWhite),
                   SizedBox(height: 3.h,),
                    Center(child: Image.network('https:${userCtrl.weatherModel.current?.condition?.icon.toString()}',)),
                 Center(child: KStyles().bold14(text: '${userCtrl.weatherModel.current?.tempC}° C',color: kWhite)),
                    Center(child: KStyles().bold14(text: userCtrl.weatherModel.current?.condition?.text ?? '' ,color: kWhite)),
                      Center(child: KStyles().med12(text: userCtrl.setDate( userCtrl.weatherModel.location?.localtime.toString() ?? ''),color: kWhite)),
                   SizedBox(height: 7.h,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ Column(crossAxisAlignment:CrossAxisAlignment.start,children: [ 
                KStyles().semiBold12(text: 'Precipitation',color: kWhite.withOpacity(0.3)),
                 KStyles().semiBold12(text: '${userCtrl.weatherModel.current?.precipIn}%',color: kWhite),
               ],),Column(crossAxisAlignment:CrossAxisAlignment.start,children: [ 
                KStyles().semiBold12(text: 'Humidity',color: kWhite.withOpacity(0.3)),
                 KStyles().semiBold12(text: '${userCtrl.weatherModel.current?.humidity}%',color: kWhite),
               ],)],),
               Divider(endIndent: 0,indent: 0,color: kGrey.shade100,thickness: 0.2,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ Column(crossAxisAlignment:CrossAxisAlignment.start,children: [ 
                KStyles().semiBold12(text: 'Wind',color: kWhite.withOpacity(0.3)),
                 KStyles().semiBold12(text: '${userCtrl.weatherModel.current?.windDegree}%',color: kWhite),
               ],),Column(crossAxisAlignment:CrossAxisAlignment.start,children: [ 
                KStyles().semiBold12(text: 'Cloud',color: kWhite.withOpacity(0.3)),
                 KStyles().semiBold12(text: '${userCtrl.weatherModel.current?.cloud}%',color: kWhite),
               ],)],),
               SizedBox(height: 5.h,)
                   ],
                   
                   ),
               ),);
  });
  }
}