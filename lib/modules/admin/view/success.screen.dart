import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:newtoktechassignment/global/constants/images/images.dart';
import 'package:provider/provider.dart';

import '../../../global/constants/styles/text_styles/text_styles.dart';
import '../controller/admin_location.controller.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () async {
        Navigator.pushNamedAndRemoveUntil(context, 'locationScreen', (route) => false);
    });
    
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AdminLocationController>(context, listen: false).onInit();
    
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [ 
           Center(child:Lottie.asset(success,width: 150.w,height: 150.h,animate: true))  ,
           SizedBox(height: 10.h,),
           Center(child: KStyles().bold17(text: 'Submitted SuccessFully'),)
        ],
      ),
    );
  }
}