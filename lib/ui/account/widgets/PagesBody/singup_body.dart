import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Forms/singup_form.dart';

class SingupBody extends StatelessWidget {
  final ScrollController? scrollController;

  const SingupBody({Key? key, @required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        controller: scrollController,
        padding: EdgeInsets.only(top: 0),
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(40),
                bottom: ScreenUtil().setHeight(20),
                left: ScreenUtil().setWidth(15),
                right: ScreenUtil().setWidth(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // todo the arrow back will change with the changing the language if we add the changeble language on the app
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xffD69E2E),
                      size: ScreenUtil().setSp(30),
                    ),
                  ),
                  Text(
                    'يسيرنا الأنضمام إلينا',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(35),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SingupForm()
        ]);
  }
}
