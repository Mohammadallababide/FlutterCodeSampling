import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
/// [HomePage] this page wiil navgiate to it after sucess login or signup
///
///
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'this is home page',
          style: TextStyle(fontSize: ScreenUtil().setSp(25)),
        ),
      ),
    );
  }
}
