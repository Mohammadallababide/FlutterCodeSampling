import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_select/smart_select.dart';

///
///[CustomSmartChoisePobUp]this statless widget response to show the pobub dialog
/// with multi choise for chosing using smart_select package
///

// ignore: must_be_immutable
class CustomSmartChoisePobUp extends StatelessWidget {
  final List<S2Choice<String>> optionList;
  final String titleSmartChoise;
  final IconData? icon;
  final onChanged;
  final String? Function(String?)? validationFunc;

  CustomSmartChoisePobUp({
    Key? key,
    required this.optionList,
    required this.titleSmartChoise,
    this.icon,
    required this.onChanged,
    required this.validationFunc,
  }) : super(key: key);

  late String value = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(60),
      width: ScreenUtil().screenWidth - ScreenUtil().setWidth(20),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Color(0xffD69E2E),
        ),
        color: Colors.white60,
        borderRadius: BorderRadius.all(
          Radius.circular(
            ScreenUtil().radius(15),
          ),
        ),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SmartSelect<String>.single(
          modalValidation: this.validationFunc,
          title: titleSmartChoise,
          value: value,
          // modalFilter: true,
          modalConfirm: false,
          // modalFilterAuto: true,
          modalType: S2ModalType.popupDialog,
          modalStyle: S2ModalStyle(
            elevation: 4.0,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                ScreenUtil().radius(15),
              ),
            ),
          ),
          modalHeaderStyle: S2ModalHeaderStyle(
            backgroundColor: Theme.of(context).primaryColor,
            textStyle: TextStyle(color: Colors.white),
            centerTitle: true,
          ),
          choiceItems: optionList,
          choiceGrouped: false,
          choiceType: S2ChoiceType.radios,
          onChange: onChanged,
          tileBuilder: (context, state) {
            return S2Tile.fromState(
              state,
              isTwoLine: true,
              isLoading: false,
              // leading: SizedBox(
              //   width: ScreenUtil().setWidth(8),
              //   height: ScreenUtil().setHeight(12),
              //   child: widget.icon != null ? Icon(widget.icon) : Container(),
              // ),
            );
          },
        ),
      ),
    );
  }
}
