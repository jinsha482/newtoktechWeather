import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../global/constants/styles/colors/colors.dart';
import '../../../global/constants/styles/text_styles/text_styles.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key, required this.title, required this.items});
  final String title;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        KStyles().semiBold16(text: '$title List'),
        SizedBox(height: 10.h),
        GridView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 4.0,
            childAspectRatio: 3 / 2, 
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              decoration: BoxDecoration(
                border: Border.all(color: kBlack.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: 
                KStyles().reg14(
                  text: items[index] != 'null'? items[index] : '' ,
                )  ,
              ),
            );
          },
        ),
      ],
    );
  }
}
