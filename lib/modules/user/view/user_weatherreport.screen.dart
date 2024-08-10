import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newtoktechassignment/global/constants/images/images.dart';
import 'package:newtoktechassignment/global/constants/styles/colors/colors.dart';
import 'package:newtoktechassignment/global/constants/styles/text_styles/text_styles.dart';

import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../service/weatherservice.dart';

class WeatherReportScreen extends StatelessWidget {
  const WeatherReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kWhite.withOpacity(0.7),
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
              Container(width: 170,
             
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
                    Column(
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: [ 
                          Expanded(flex:1,
                            child: Image.asset(cloud,width: 30.w,height: 30.h,)), Expanded(flex:1,child:Image.asset(wind,width: 30.w,height: 30.h)), Expanded(flex:1,child:Image.asset(humidity,width: 30.w,height: 30.h))
                        ],),
                         SizedBox(height: 5.h,),
                         Row(mainAxisAlignment: MainAxisAlignment.start,children: [ 
                      Expanded(flex:1,
                        child: KStyles().semiBold10(text: 'Cloud')), Expanded(flex:1,child:KStyles().semiBold10(text: 'Wind')), Expanded(flex:1,child:KStyles().semiBold10(text: 'Humidity'))
                    ],),
                     SizedBox(height: 5.h,),
                     Padding(
                       padding: const EdgeInsets.only(left:8.0),
                       child: Row(mainAxisAlignment: MainAxisAlignment.start,children: [ 
                        Expanded(flex:1,
                          child: KStyles().semiBold10(text: userCtrl.weatherModel.current?.cloud.toString() ?? '')), Expanded(flex:1,child:KStyles().semiBold10(text: userCtrl.weatherModel.current?.windDegree.toString() ?? '' )), Expanded(flex:1,child:KStyles().semiBold10(text: userCtrl.weatherModel.current?.humidity.toString() ?? ''))
                                         ],),
                     )
                      ],
                    ),
                   SizedBox(height: 5.h,)
                   ],
                   ),
               ),),
                SizedBox(height: 5.h,),
                Container(width: 170,
             
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
               ),),
               SizedBox(height:5.h),
                 Container(width: 170,
             
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
              Container(height: 30,decoration:BoxDecoration(color: kGrey,borderRadius: BorderRadius.circular(20)),child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: KStyles().semiBold10(text: 'Precipitation'),
              ),),
                 KStyles().semiBold12(text: '${userCtrl.weatherModel.current?.precipIn}%',color: kWhite),
               ],),Column(crossAxisAlignment:CrossAxisAlignment.start,children: [ 
               Container(height: 30,decoration:BoxDecoration(color: kGrey,borderRadius: BorderRadius.circular(20)),child: Padding(
                 padding: const EdgeInsets.all(5.0),
                 child: KStyles().semiBold10(text: 'Humidity'),
               ),)
                 ,KStyles().semiBold12(text: '${userCtrl.weatherModel.current?.humidity}%',color: kWhite),
               ],)],),
             
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ Column(crossAxisAlignment:CrossAxisAlignment.start,children: [ 
              Container(height: 30,decoration:BoxDecoration(color: kGrey,borderRadius: BorderRadius.circular(20)),child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: KStyles().semiBold10(text: 'Wind'),
              ),),
                 KStyles().semiBold12(text: '${userCtrl.weatherModel.current?.windDegree}%',color: kWhite),
               ],),Column(crossAxisAlignment:CrossAxisAlignment.start,children: [ 
              Container(height: 30,decoration:BoxDecoration(color: kGrey,borderRadius: BorderRadius.circular(20)),child: Padding(
                padding: const EdgeInsets.all( 5),
                child: KStyles().semiBold10(text: 'Cloud'),
              ),),
                 KStyles().semiBold12(text: '${userCtrl.weatherModel.current?.cloud}%',color: kWhite),
               ],)],),
               SizedBox(height: 5.h,)
                   ],
                   ),
               ),),
               SizedBox(height: 5.h,),
                  Container(width: 170,
             
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
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 10.w),
                 child: KStyles().med12(text: userCtrl.setDate( userCtrl.weatherModel.location?.localtime.toString() ?? '',),color: kWhite),
               ),
                  
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: KStyles().bold22(text: '${userCtrl.weatherModel.current?.tempC}° C',color: kWhite),
                    ),
                //  RotatedBox(quarterTurns: 210,
                //    child: Row(mainAxisAlignment: MainAxisAlignment.end,
                //     children: [ 
                //      Image.network('https:${userCtrl.weatherModel.current?.condition?.icon.toString()}',width: 20.w,height: 20.h,),
                //        KStyles().bold14(text: userCtrl.weatherModel.current?.condition?.text ?? '' ,color: kWhite)
                //    ],),
                //  ),
                  
                              
                              SizedBox(height: 5.h,),
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
                 ),),
                 SizedBox(height: 10.h,),
              Center(
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
                     ),
                      SizedBox(height: 7.h,),
                     ],
                     ),
                 ),),
              ),
            ],
            
          ),
        ),
      );
      })
    );
  }
}