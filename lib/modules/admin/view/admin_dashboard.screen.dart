import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newtoktechassignment/global/constants/widgets/buttons.dart';
import 'package:newtoktechassignment/global/constants/images/images.dart';
import '../../../global/constants/styles/colors/colors.dart';
import '../../../global/constants/styles/text_styles/text_styles.dart';
import 'package:lottie/lottie.dart';


class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: kWhite.withOpacity(0.5),
      body: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 70.h),
            Lottie.asset(welcome,animate: true,width: 200.w,height: 200.h),
            KStyles().bold17(text: 'Welcome to the Admin Dashboard !',color: Colors.black),
            SizedBox(height: 30.h),
            Card(color: kWhite.withOpacity(0.5),
              elevation: 4.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      KStyles().semiBold15(text: 'Add new locations'),
                    SizedBox(height: 10.h),
                    Center(
                      child: CommonButtons().elevatedButton(
                        'Manage Locations',
                        kWhite,
                        () {
                          Navigator.pushNamed(context, 'locationScreen');
                        },
                        false,
                        double.infinity,
                      ),
                    ),
                  ],
                ),
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
