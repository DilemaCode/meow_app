import 'package:flutter/material.dart';
import 'package:meow_app/core/utils/sizer.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'No data available',
          style: TextStyle(fontSize: 16.sp),
        ),
        Text(
          'Swipe to load data',
          style: TextStyle(fontSize: 12.sp),
        ),
      ],
    );
  }
}
