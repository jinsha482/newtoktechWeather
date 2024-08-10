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
      backgroundColor: kWhite.withOpacity(0.9),title: KStyles().bold20(text: 'Excel Screen',),centerTitle: true,
    ),
    backgroundColor: kWhite.withOpacity(0.9),
    body:Consumer<ExcelService>(builder: (context, userCtrl, child) {
        return
     Padding(
       padding: const EdgeInsets.symmetric(horizontal: 10),
       child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children : [ 
          
        Center(
          child: SizedBox(width: 200.w,height: 60.h,
            child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: kWhite.withOpacity(0.9),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40),side: const BorderSide(color: kBlack))),
              onPressed: (){
                userCtrl.pickExcelFile(context);
              }, child: Center(child: KStyles().semiBold16(text: 'Upload your excel sheet'),)))
        )
        ]
           ),
     );
    })
    );
  }
}