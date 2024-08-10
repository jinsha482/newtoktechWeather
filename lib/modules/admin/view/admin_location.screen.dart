
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newtoktechassignment/global/constants/widgets/buttons.dart';
import 'package:newtoktechassignment/modules/admin/controller/admin_location.controller.dart';
import 'package:provider/provider.dart';
import '../../../global/constants/styles/colors/colors.dart';
import '../../../global/constants/styles/text_styles/text_styles.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../service/location_service.dart';


class AdminLocationScreen extends StatefulWidget {
  const AdminLocationScreen({super.key});

  @override
  State<AdminLocationScreen> createState() => _AdminLocationScreenState();
}

class _AdminLocationScreenState extends State<AdminLocationScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AdminLocationController>(context, listen: false).onInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhite,
        title: KStyles().semiBold20(text: 'Location Screen'),
        centerTitle: true,
      ),
      backgroundColor: kWhite,
      body: Consumer<AdminLocationController>(builder: (context, locCtrl, child) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  CSCPicker(
                    dropdownDecoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    disabledDropdownDecoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Colors.grey.shade300,
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    selectedItemStyle: TextStyle(fontSize: 15.sp, color: Colors.black),
                    onCountryChanged: (value) {
                      setState(() {
                        locCtrl.countryValue = value;
                      });
                    },
                    onStateChanged: (value) {
                      setState(() {
                        locCtrl.stateValue = value.toString();
                      });
                    },
                    onCityChanged: (value) {
                      setState(() {
                        locCtrl.cityValue = value.toString();
                      });
                    },
                  ),
                  SizedBox(height: 10.h,),
                  TextFormField(controller:locCtrl.districtCtrl ,showCursor: true,
                  decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 3.h,horizontal: 10.w),
              hintText: 'District',hintStyle: const TextStyle(color: kBlack),
              focusedBorder: OutlineInputBorder(   borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.grey.shade300)) ,
                    enabledBorder: OutlineInputBorder(   borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.grey.shade300))
                    , disabledBorder: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.grey.shade300))
                  ),
                  ),
                   SizedBox(height: 60.h,),
                   Center(child: CommonButtons().elevatedButton('Submit', kWhite, () async{
                    if(locCtrl.cityValue.isNotEmpty && locCtrl.countryValue.isNotEmpty && locCtrl.districtCtrl.text.isNotEmpty && locCtrl.stateValue.isNotEmpty){
                      locCtrl.setlocationStatus(true);
                   LocationService().addLocation(country: locCtrl.countryValue, state: locCtrl.stateValue, district:locCtrl.districtCtrl.text, city: locCtrl.cityValue).then((value) {
                    if (value == 200){
                      locCtrl.setlocationStatus(false);
                     Navigator.pushNamed(context, 'success');
                    }
                    else{
                     locCtrl.setlocationStatus(false);
                    }
                   });
                
                    }
                    else{
                          locCtrl.setlocationStatus(false);
                       Fluttertoast.showToast(textColor: kWhite,
                       gravity: ToastGravity.TOP,
              msg: 'Fill all the details',
              backgroundColor:Colors.red.shade500,
            );
                    }
                   }, locCtrl.locationAdded, double.infinity))
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}


