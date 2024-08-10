import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';

import '../../../../global/constants/functions/validations/validations.dart';
import '../../../../global/constants/styles/colors/colors.dart';
import '../../../../global/constants/styles/text_styles/text_styles.dart';
import '../../../../global/constants/widgets/textfield.dart';
import '../controller/signup_controller.dart';


class RegistrationForm extends StatelessWidget {
  
   final GlobalKey<FormState> formKey;
  const RegistrationForm({super.key,required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpController>(builder: (context, signUpCtrl, child) {
 return Form(key: formKey,
   child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
              KStyles().bold13(text:'User Name',),
            SizedBox(height: 5.h,),
            TextFieldWidget(boxHeight: 50,
              keyboardType: TextInputType.name,
            validator: (value){
              return TextFieldValidation().userNameValidation(value);
            },
              hintText: 'name', readOnly: false, boxWidth: double.infinity, textAlign: TextAlign.start, textColor: kBlack, textEditingController:signUpCtrl.name),
            SizedBox(height: 15.h,),
            KStyles().bold13(text:'Email Address',),
            SizedBox(height: 5.h,),
            TextFieldWidget(  boxHeight: 50,validator: (value){
              return TextFieldValidation().emailValidation(value);
            },
              hintText: 'email', readOnly: false, boxWidth: double.infinity, textAlign: TextAlign.start, textColor: kBlack, textEditingController:signUpCtrl.email),
            SizedBox(height: 15.h,),
             KStyles().bold13(text:'Password',),
            SizedBox(height: 5.h,),
            TextFieldWidget(boxHeight: 50,  validator: (value){
              return TextFieldValidation().passwordValidation(value);
            },
              hintText: 'password', readOnly: false, boxWidth: double.infinity, textAlign: TextAlign.start, textColor: kBlack, textEditingController:signUpCtrl.password),
         SizedBox(height: 2.h,),
        signUpCtrl.error == true ? KStyles().reg11(text: 'Already this account exists',color: Colors.red) : const SizedBox(),
          ],
        ),
 );}
    );
  }
}