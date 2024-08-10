import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../global/constants/images/images.dart';
import '../../../global/constants/styles/colors/colors.dart';
import '../../../global/constants/styles/text_styles/text_styles.dart';
import '../service/weatherservice.dart';

class FifthLayoutScreen extends StatelessWidget {
  const FifthLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return Consumer<WeatherService>(builder: (context, userCtrl, child) {

    return Center(
                child: Container(width: 200.w,
                              decoration:     BoxDecoration(gradient: LinearGradient(colors: [kBlack,kBlack.withOpacity(0.3)]),),
                             
                 child: Padding(
                   padding:  EdgeInsets.symmetric(horizontal: 10.w),
                   child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [ SizedBox(height: 20.h,),
                     Center(child: KStyles().bold17(text: '${userCtrl.weatherModel.location?.country}',color: kWhite)),
                     SizedBox(height: 7.h,),
                       Center(child: KStyles().med13(text: userCtrl.weatherModel.current?.condition?.text ?? '',color: kWhite )),
                     Stack(children:[ Center(child: Image.network('https:${userCtrl.weatherModel.current?.condition?.icon.toString()}',)),Positioned(left: 35.w,top: 0.h,
                      child:KStyles().bold20(text: '${userCtrl.weatherModel.current?.tempC}° C',color: kWhite))]),
                     SizedBox(height: 20.h,),
                    
                     
                       Container(width: 80,height: 80.h,
                          decoration: BoxDecoration(color: Colors.yellow,borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Column(
                            children: [ 
                              SizedBox(height: 6.h,),
                              Center(child:SvgPicture.asset(cloudSvg,width: 15.w,height: 15.h,)),
                                 SizedBox(height: 6.h,),
                              Center(child:KStyles().bold13(text: 'Cloud')),
                                
                              Center(child:KStyles().light10(text: userCtrl.weatherModel.current?.cloud.toString() ?? '')),
                          SizedBox(height: 3.h,),
                            ],
                          ),
                        ),),
                         SizedBox(height: 10.h,),
                     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container( width: 80,height: 80.h,
                          decoration: BoxDecoration(color: kWhite,borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Column(
                            children: [ 
                              SizedBox(height: 6.h,),
                              Center(child:SvgPicture.asset(windSvg,width: 15.w,height: 15.h,)),
                                 SizedBox(height: 6.h,),
                              Center(child:KStyles().bold13(text: 'wind')),
                                
                              Center(child:KStyles().light10(text: userCtrl.weatherModel.current?.windDegree.toString() ?? '')),
                          SizedBox(height: 3.h,),
                            ],
                          ),
                        ),),
                        Container(width: 80,height: 80.h,
                          decoration: BoxDecoration(color: kWhite,borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Column(
                            children: [ 
                              SizedBox(height: 6.h,),
                              Center(child:SvgPicture.asset(humidtySvg,width: 15.w,height: 15.h,)),
                                 SizedBox(height: 6.h,),
                              Center(child:KStyles().bold13(text: 'Humidity')),
                                
                              Center(child:KStyles().light10(text: userCtrl.weatherModel.current?.humidity.toString() ?? '')),
                          SizedBox(height: 3.h,),
                            ],
                          ),
                        ),),
                      ],
                     ), SizedBox(height: 20.h,),]))));
  });}
}