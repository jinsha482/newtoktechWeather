import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';

import '../../../../global/constants/functions/validations/validations.dart';
import '../../../../global/constants/styles/colors/colors.dart';
import '../../../../global/constants/styles/text_styles/text_styles.dart';
import '../../../../global/constants/widgets/textfield.dart';
import '../controller/login_controller.dart';

class LoginForm extends StatelessWidget {
final GlobalKey<FormState> formKey;
  const LoginForm({super.key,required this.formKey});
  

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginController>(builder: (context, logCtrl, child) {
 return Form(key: formKey,
   child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
            KStyles().bold13(text:'Email Address'),
            SizedBox(height: 5.h,),
            TextFieldWidget(boxHeight: 50,
              validator: (value){
               return TextFieldValidation().emailValidation(value);
            },
              hintText: 'email', readOnly: false, boxWidth: double.infinity, textAlign: TextAlign.start, textColor: kBlack, textEditingController:logCtrl.email),
            SizedBox(height: 15.h,),
             KStyles().bold13(text:'Password'),
            SizedBox(height: 5.h,),
            TextFieldWidget(boxHeight: 50,validator: (value){
               return TextFieldValidation().passwordValidation(value);
            },
              hintText: 'password', readOnly: false, boxWidth: double.infinity, textAlign: TextAlign.start, textColor: kBlack, textEditingController:logCtrl.password),
         SizedBox(height: 2.h,),
          ],
        ),
 );}
    );
  }
}