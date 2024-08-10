import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../global/constants/images/images.dart';
import '../../../global/constants/styles/colors/colors.dart';
import '../../../global/constants/styles/text_styles/text_styles.dart';
import '../service/weatherservice.dart';

class FourthLayoutScreen extends StatelessWidget {
  const FourthLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return  Consumer<WeatherService>(builder: (context, userCtrl, child) {
    return  Container(width: 170,
             
              decoration:    const BoxDecoration(gradient: LinearGradient(colors: [Color.fromARGB(255, 72, 38, 195),Color.fromARGB(255, 124, 149, 217)]),),
               child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [ SizedBox(height: 10.h,),
                 Padding(
                   padding:  EdgeInsets.symmetric(horizontal: 10.w),
                   child: Row(
                     children: [const Icon(Icons.location_on,color: kWhite,size: 17,),
                       KStyles().semiBold17(text:'${userCtrl.weatherModel.location?.region.toString()}, ${userCtrl.weatherModel.location?.country.toString() ?? '' }',color: kWhite),
                     ],
                   ),
                 ),
                  SizedBox(height: 2.h,),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 10.w),
                 child: KStyles().med12(text: userCtrl.setDate( userCtrl.weatherModel.location?.localtime.toString() ?? '',),color: kWhite),
               ),
                   SizedBox(height: 2.h,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: KStyles().bold22(text: '${userCtrl.weatherModel.current?.tempC}° C',color: kWhite),
                    ),
               
                     SizedBox(height: 1.h,),
                             Row(
                                                 children: [ SizedBox(width: 5.h,),
                                                  Image.network('https:${userCtrl.weatherModel.current?.condition?.icon.toString()}',width: 20.w,height: 20.h,),
                                                    KStyles().bold13(text: userCtrl.weatherModel.current?.condition?.text ?? '' ,color: kWhite)
                                                ],)   ,
                              SizedBox(height: 30.h,),
                              Container(width: double.infinity,decoration: BoxDecoration(color: kWhite,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.w),topRight:Radius.circular(20.w))),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children : [ 
                                 SizedBox(height: 10.h,),
                                 KStyles().semiBold13(text: 'Weather Information'),
                                   SizedBox(height: 10.h,),
                                 Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.start,
                                  children:[
                                                Column(crossAxisAlignment:CrossAxisAlignment.start,children: [ 
                                Container(
                                  decoration: BoxDecoration(color: kGrey.shade100,shape: BoxShape.circle),
                                  child: Padding(padding: const EdgeInsets.all(8),
                                    child: SvgPicture.asset(windSvg,width:30.w,),),),
                                               KStyles().semiBold12(text: '${userCtrl.weatherModel.current?.precipIn}%',color: kBlack),
                                ],),
                                Column(crossAxisAlignment:CrossAxisAlignment.start,children: [ 
                                Container(decoration: BoxDecoration(color: kGrey.shade100,shape: BoxShape.circle),
                                  child:Padding(padding: const EdgeInsets.all(8),child: SvgPicture.asset(humidtySvg,width: 30.w,),),),
                                               KStyles().semiBold12(text: '${userCtrl.weatherModel.current?.humidity}%',color: kBlack),
                                  ]),  Column(crossAxisAlignment:CrossAxisAlignment.start,children: [             
                                        Container(decoration: BoxDecoration(color: kGrey.shade100,shape: BoxShape.circle),
                                  child:Padding(padding: const EdgeInsets.all(8),child: SvgPicture.asset(cloudSvg,width: 30.w,),),),
                                               KStyles().semiBold12(text: '${userCtrl.weatherModel.current?.cloud}%',color: kBlack),
                                ],)
                                
                                               ]),
                                               SizedBox(height: 10.h,),
                                               
                                ]),
                              ),),
                                 
                 ],
                 ),);
});}
}