import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
///[getFlashBarNotify] this widget for error or notify bar
///and it have this arguments:
/// [text] for flash bar message
/// [cusIcons] for if you want to add customer icon like right or faluilt icon
/// [cusColor] for color of the icon
///

Widget getFlashBarNotify(BuildContext context,
    {String text = 'Check from you Connection NetWork',
    IconData cusIcons = Icons.info_outline,
    MaterialColor cusColor = Colors.red}) {
  return Flushbar(
    message: text,
    icon: Icon(
      cusIcons,
      size: ScreenUtil().setSp(30),
      color: cusColor,
    ),
    flushbarStyle: FlushbarStyle.FLOATING,
    flushbarPosition: FlushbarPosition.TOP,
    duration: Duration(seconds: 3),
    leftBarIndicatorColor: Colors.blue[300],
  )..show(context);
}
