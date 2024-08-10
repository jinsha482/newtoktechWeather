import 'package:flutter/material.dart';


import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:newtoktechassignment/global/constants/widgets/buttons.dart';
import 'package:newtoktechassignment/modules/authentication/service/authentication_service.dart';


import '../../../../global/constants/styles/colors/colors.dart';
import '../../../../global/constants/styles/text_styles/text_styles.dart';
import '../controller/login_controller.dart';
import 'package:provider/provider.dart';

import '../widget/login_form.widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<LoginController>(context, listen: false).init();
    });
  }

  bool isProcessing = false;
 var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(resizeToAvoidBottomInset: true,
      backgroundColor: kWhite,
      body:  Consumer<LoginController>(builder: (context, logCtrl, child) {
 return 
       Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15.w),
        child: SingleChildScrollView(physics: const BouncingScrollPhysics(),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: [ 
              SizedBox(height: 100.h,),
            
               KStyles().bold23(text: 'Hi 👋',color: kBlack),
               SizedBox(height:5.h),
             
          LoginForm(formKey: formKey,),
                 
        
                SizedBox(height: 30.h,),
              CommonButtons().elevatedButton('Sign In', kWhite,() async{
                if(formKey.currentState!.validate()){
                   setState(() {
                  isProcessing = true;  
                });
                    User? user = await AuthenticationService().loginUser(logCtrl.email.text,
                                            logCtrl.password.text,context
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
                                  },isProcessing,double.infinity
                
              ),
              SizedBox(height: 20.h,), 
                       Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [ KStyles().med14(text: 'New User ?',),
              
            TextButton(onPressed: (){
                  Navigator.pushNamed(context, 'signUp');
                }, child: KStyles().bold14(text: 'Register'))
            
               ],),
            ],
          ),
        ),
      
    );}));
  }
}