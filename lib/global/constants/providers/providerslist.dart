import 'package:newtoktechassignment/modules/admin/controller/admin_location.controller.dart';
import 'package:newtoktechassignment/modules/authentication/login/controller/login_controller.dart';
import 'package:newtoktechassignment/modules/authentication/signup/controller/signup_controller.dart';
import 'package:newtoktechassignment/modules/user/service/excelservice.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget>providersList = [
   ChangeNotifierProvider(create: (_) => AdminLocationController()),
   ChangeNotifierProvider(create: (_) => ExcelService()),
     ChangeNotifierProvider(create: (_) => SignUpController()),
      ChangeNotifierProvider(create: (_) => LoginController()),
   ];