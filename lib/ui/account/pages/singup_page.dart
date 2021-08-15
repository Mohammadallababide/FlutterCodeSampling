import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/PagesBody/singup_body.dart';

///
/// [SigupPage] page for sigin
///
class SigupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          Container(
              padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(0),
              ),
              width: double.infinity,
              height: ScreenUtil().setHeight(270),
              child: Image(
                image: AssetImage('assets/images/IntroTagPage.jpg'),
                fit: BoxFit.fill,
              )),
          DraggableScrollableSheet(
              initialChildSize: 0.65,
              minChildSize: 0.65,
              maxChildSize: 0.75,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Material(
                  elevation: 7,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                  child: SingupBody(
                    scrollController: scrollController,
                  ),
                );
              })
        ],
      ),
    );
  }
}
