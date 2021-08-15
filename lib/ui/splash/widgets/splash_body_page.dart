import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts_arabic/fonts.dart';
import '../../../core/util/generate_screen.dart';

///
///[SplashBodyPage] this staless widget have the content of the [SplashPage]
///for simplcity and refactoring the code
///

class SplashBodyPage extends StatelessWidget {
  final ScrollController scrollController;

  const SplashBodyPage({
    Key? key,
    required this.scrollController,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      padding: EdgeInsets.only(top: 0),
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(50),
            ),
            child: Column(
              children: [
                Container(
                  height: ScreenUtil().setHeight(100),
                  width: ScreenUtil().setWidth(100),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(
                      ScreenUtil().radius(15),
                    ),
                  ),
                  child: Center(
                    child: Image(
                        image: AssetImage('assets/images/logo.png'),
                        height: ScreenUtil().setHeight(100)),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(20),
                ),
                Container(
                  width: ScreenUtil().setWidth(300),
                  // height: ScreenUtil().setHeight(150),
                  child: Text(
                    'مرحبا بكم في تطبيق سيمفونيا سكول,منصتنا تقدم لمستخدميها فرص العمل في المؤسسات التعليميةووكما يمكن المستخدمين من تنظيم مقابلاتهم و جدول أوقاتهم ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                      fontFamily: ArabicFonts.El_Messiri,
                      package: 'google_fonts_arabic',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(20),
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          NameScreen.SiginScreen,
                        );
                      },
                      child: Container(
                        width: ScreenUtil().setWidth(300),
                        height: ScreenUtil().setHeight(60),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(
                            ScreenUtil().radius(15),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'تسجيل الدخول',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(18),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(20),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          NameScreen.SigupScreen,
                        );
                      },
                      child: Container(
                        width: ScreenUtil().setWidth(300),
                        height: ScreenUtil().setHeight(60),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            ScreenUtil().radius(15),
                          ),
                          border: Border.all(
                            width: 3,
                            color: Colors.black,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'أنشاء حساب',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: ScreenUtil().setSp(18),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(20),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
