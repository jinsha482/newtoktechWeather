import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'global/constants/providers/providerslist.dart';
import 'global/constants/routes/routes.dart';
import 'global/constants/styles/colors/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized(); 
 await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MultiProvider(providers: providersList,child:const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  return  Platform.isIOS
            ? ScreenUtilInit(designSize: const Size(333,675),
              child: CupertinoApp(
                  title: 'Newtoktech',
                
                  routes: routes,
                  initialRoute: '/',
                  theme: const CupertinoThemeData(
                      barBackgroundColor: kWhite, primaryColor: Colors.black),
                
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: const [
                      DefaultWidgetsLocalizations.delegate,
                      DefaultMaterialLocalizations.delegate,
                      DefaultCupertinoLocalizations.delegate
                    ]),
            )
            : ScreenUtilInit(designSize: const Size(333,675),child: MaterialApp(
                 routes: routes,
                title: 'Newtoktech',
                initialRoute: '/',
               
                debugShowCheckedModeBanner: false,
                theme: ThemeData.light().copyWith(
                  searchBarTheme: SearchBarThemeData(
                      backgroundColor: MaterialStateProperty.all(kWhite)),
                ))
                );
  }
}

