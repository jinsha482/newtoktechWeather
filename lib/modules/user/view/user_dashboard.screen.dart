import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newtoktechassignment/global/constants/styles/colors/colors.dart';
import 'package:newtoktechassignment/global/constants/styles/text_styles/text_styles.dart';
import 'package:newtoktechassignment/modules/admin/controller/admin_location.controller.dart';
import 'package:newtoktechassignment/modules/admin/service/location_service.dart';
import 'package:newtoktechassignment/modules/user/widget/grid_view.widget.dart';
import 'package:provider/provider.dart';

class UserDashBoardScreen extends StatefulWidget {
  const UserDashBoardScreen({super.key});

  @override
  State<UserDashBoardScreen> createState() => _UserDashBoardScreenState();
}

class _UserDashBoardScreenState extends State<UserDashBoardScreen> {
  @override
  void initState() {
    super.initState();
    LocationService().getCountries(context);
    LocationService().getStates(context);
    LocationService().getCities(context);
    LocationService().getDistricts(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhite,
        title: KStyles().bold20(text: 'User Dashboard'),
        centerTitle: true,
      ),
      backgroundColor: kWhite,
      body: Consumer<AdminLocationController>(builder: (context, locCtrl, child) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h,),
              Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [Container(padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color:Colors.green.shade200,),
                child: KStyles().semiBold13(text: 'Upload your Excel Sheet')),
              IconButton(onPressed: (){
                Navigator.pushNamed(context, 'uploadExcel');
              }, icon: const Icon( Icons.forward,color: Colors.green,))],),
                SizedBox(height: 20.h),
               GridViewWidget(title :'Countries', items:locCtrl.countries),
               GridViewWidget(title :'Cities', items:locCtrl.cities),
                 GridViewWidget(title :'States',items: locCtrl.states),
                GridViewWidget(title :'Districts',items:  locCtrl.districts),
              ],
            ),
          ),
        );
      }),
    );
  }
}


