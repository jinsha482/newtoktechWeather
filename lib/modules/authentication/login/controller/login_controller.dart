import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier{

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
 ValueNotifier userCredential = ValueNotifier('');

 init(){
  email.text = '';
  password.text = '';

 }
}