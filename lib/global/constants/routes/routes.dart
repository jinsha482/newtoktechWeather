import 'package:flutter/material.dart';
import 'package:newtoktechassignment/modules/admin/view/admin_dashboard.screen.dart';
import 'package:newtoktechassignment/modules/admin/view/success.screen.dart';
import 'package:newtoktechassignment/modules/authentication/login/view/login_screen.dart';
import 'package:newtoktechassignment/modules/authentication/signup/view/signup_screen.dart';
import 'package:newtoktechassignment/modules/authentication/splash/view/splash_screen.dart';
import 'package:newtoktechassignment/modules/user/view/user_dashboard.screen.dart';
import 'package:newtoktechassignment/modules/user/view/user_uploadexcel.screen.dart';
import 'package:newtoktechassignment/modules/user/view/user_weatherreport.screen.dart';

import '../../../modules/admin/view/admin_location.screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/' : (BuildContext context) => const SplashScreen(),
  'signUp' : (BuildContext context) => const SignUpScreen(),
  'login' :(BuildContext context) => const LoginScreen(),
  'userDashboard': (BuildContext context) => const UserDashBoardScreen(),
  'locationScreen': (BuildContext context) => const AdminLocationScreen(),
   'adminDashboard': (BuildContext context) => const AdminDashboardScreen(),
    'uploadExcel': (BuildContext context) => const UploadExcelScreen(),
    'weatherReport': (BuildContext context) => const WeatherReportScreen(),
    'success' : (BuildContext context) => const SuccessScreen(),

   };