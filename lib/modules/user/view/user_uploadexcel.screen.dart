import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newtoktechassignment/global/constants/styles/colors/colors.dart';
import 'package:newtoktechassignment/global/constants/styles/text_styles/text_styles.dart';
import 'package:newtoktechassignment/modules/user/service/excelservice.dart';
import 'package:provider/provider.dart';


class UploadExcelScreen extends StatelessWidget {
  const UploadExcelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(
      backgroundColor: kWhite,title: KStyles().bold20(text: 'Excel Screen',),centerTitle: true,
    ),
    backgroundColor: kWhite,
    body:Consumer<ExcelService>(builder: (context, userCtrl, child) {
        return
     Padding(
       padding: const EdgeInsets.symmetric(horizontal: 10),
       child: Column(
        children : [ 
           SizedBox(height: 50.h,),
          KStyles().semiBold22(text: 'Upload Excel Sheet'),
           SizedBox(height:60.h,),
        Center(
          child: SizedBox(height: 60.h,
            child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade100,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40),)),
              onPressed: (){
                userCtrl.pickExcelFile(context);
              }, child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  KStyles().semiBold16(text: 'Upload your excel sheet'),
                  IconButton(onPressed: (){
                     userCtrl.pickExcelFile(context);
                  }, icon: const Icon(Icons.upload,color: kBlack,))
                ],
              )))
        )
        ]
           ),
     );
    })
    );
  }
}