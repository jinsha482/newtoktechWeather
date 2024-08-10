import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../global/constants/styles/colors/colors.dart';
import '../../../global/constants/styles/text_styles/text_styles.dart';
import '../service/weatherservice.dart';

class ThirdLayOutScreen extends StatelessWidget {
  const ThirdLayOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return  Consumer<WeatherService>(builder: (context, userCtrl, child) {
    return  Container(width: 170,
             
              decoration:    BoxDecoration(gradient: LinearGradient(colors: [const Color.fromARGB(255, 129, 158, 168),Colors.grey.shade200]),),
               child: Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 10.w),
                 child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ SizedBox(height: 10.h,),
                  KStyles().med17(color: kWhite,text:userCtrl.splitDate(userCtrl.weatherModel.location?.localtime.toString() ?? '',)),
                   KStyles().med17(text:userCtrl.weatherModel.location?.country.toString() ?? '' ,color: kWhite),
                   SizedBox(width: 70.w, child: const Divider(color: kWhite,thickness: 0.3)),
                 KStyles().light14(text: userCtrl.weatherModel.current?.condition?.text ?? '',color: kWhite ),  
                   Row(
                     children: [
                       Image.network('https:${userCtrl.weatherModel.current?.condition?.icon.toString()}',),
                       KStyles().bold17(text: '${userCtrl.weatherModel.current?.tempC}° C',color: kWhite)
                     ],
                   ),
                   KStyles().bold10(text: 'Details',color: kWhite),
                   const Divider(color: kWhite,thickness: 0.3),
                     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ Column(crossAxisAlignment:CrossAxisAlignment.start,children: [ 
              Container(height: 30,
              decoration:BoxDecoration(color: kGrey,borderRadius: BorderRadius.circular(20)),child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: KStyles().semiBold10(text: 'Precipitation'),
              ),),SizedBox(height: 5.h,),
                 KStyles().semiBold12(text: '${userCtrl.weatherModel.current?.precipIn}%',color: kWhite),
               ],),Column(crossAxisAlignment:CrossAxisAlignment.start,children: [ 
               Container(height: 30,decoration:BoxDecoration(color: kGrey,borderRadius: BorderRadius.circular(20)),child: Padding(
                 padding: const EdgeInsets.all(5.0),
                 child: KStyles().semiBold10(text: 'Humidity'),
               ),),
               SizedBox(height: 5.h,)
                 ,KStyles().semiBold12(text: '${userCtrl.weatherModel.current?.humidity}%',color: kWhite),
               ],)],),
               const Divider(color: kWhite,thickness: 0.3),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ Column(crossAxisAlignment:CrossAxisAlignment.start,children: [ 
              Container(height: 30,decoration:BoxDecoration(color: kGrey,borderRadius: BorderRadius.circular(20)),child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: KStyles().semiBold10(text: 'Wind'),
              ),),SizedBox(height: 5.h,),
                 KStyles().semiBold12(text: '${userCtrl.weatherModel.current?.windDegree}%',color: kWhite),
               ],),Column(crossAxisAlignment:CrossAxisAlignment.start,children: [ 
              Container(height: 30,decoration:BoxDecoration(color: kGrey,borderRadius: BorderRadius.circular(20)),child: Padding(
                padding: const EdgeInsets.all( 5),
                child: KStyles().semiBold10(text: 'Cloud'),
              ),),SizedBox(height: 5.h,),
                 KStyles().semiBold12(text: '${userCtrl.weatherModel.current?.cloud}%',color: kWhite),
               ],)],),
               SizedBox(height: 5.h,)
                   ],
                   ),
               ),);
  });}
}