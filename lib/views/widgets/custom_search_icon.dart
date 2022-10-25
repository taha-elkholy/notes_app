import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45.w,
      height: 45.h,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.white.withOpacity(0.05),
        ),
        child: Center(
          child: Icon(
            Icons.search,
            size: 28.sp,
          ),
        ),
      ),
    );
  }
}
