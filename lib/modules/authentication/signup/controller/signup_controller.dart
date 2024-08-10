import 'package:flutter/material.dart';

class SignUpController extends ChangeNotifier{
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  bool error = false;
init(){
  email.text = '';
  password.text = '';
  name.text = '';
}
}