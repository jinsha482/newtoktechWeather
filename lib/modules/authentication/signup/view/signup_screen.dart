import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newtoktechassignment/global/constants/widgets/buttons.dart';

import '../../../../global/constants/styles/colors/colors.dart';
import '../../../../global/constants/styles/text_styles/text_styles.dart';
import '../../service/authentication_service.dart';
import '../controller/signup_controller.dart';
import 'package:provider/provider.dart';

import '../widget/registration_form.widget.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
   @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SignUpController>(context, listen: false).init();
    });
  }
  bool isProcessing = false;
 var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold( backgroundColor: kWhite,
    resizeToAvoidBottomInset: true,
      body:   Consumer<SignUpController>(builder: (context, signUpCtrl, child) {
    return   Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15.w),
        child: SingleChildScrollView(physics: const BouncingScrollPhysics(),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: [ 
              SizedBox(height: 100.h,),
               KStyles().bold23(text: 'Create an Account'),
             
               SizedBox(height: 20.h,),
               RegistrationForm(formKey: formKey,),
            
            SizedBox(height: 30.h,),
             CommonButtons().elevatedButton(
                'Sign Up', kWhite,
              ()async{
                
                if(formKey.currentState!.validate()){
                  setState(() {
                                  isProcessing = true;
                                
                                });
                  User? user = await AuthenticationService().signUpUser(
                                     signUpCtrl.email.text,
                                   signUpCtrl.password.text,context
                                    
                                  );
                 if (user != null) {
                   
                                
                                   setState(() {
                                  isProcessing = false;
                                 
                                });
                                  }
                                  else{
                                         setState(() {
                                 isProcessing = false;
                                
                                });
                                  }
          
                }
                else{
                    setState(() {
                                  isProcessing = false;
                                  
                                });
                }
              },isProcessing,double.infinity),
              SizedBox(height: 30.h,),
              
                       Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [ KStyles().med14(text: 'Already have an account ?',),
                TextButton(onPressed: (){
                  Navigator.pushNamed(context, 'login');
                }, child: KStyles().bold14(text: 'Login'))
               ],),]),
        ));}));
  }
}