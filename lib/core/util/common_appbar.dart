import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
///[commonAppBar] function for commonAppBar for this project

PreferredSizeWidget commonAppBar(String appbarTitile,
    [Color color = Colors.black45]) {
  return AppBar(
    automaticallyImplyLeading: false,
    toolbarHeight: ScreenUtil().setHeight(50),
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      '$appbarTitile',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: ScreenUtil().setSp(16),
        color: color,
      ),
    ),
    centerTitle: true,
  );
}
