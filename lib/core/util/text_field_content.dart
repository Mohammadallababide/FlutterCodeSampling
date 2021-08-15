import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
/// [TextFieldContent] this staless widget for common text filed with spcific form
/// it have the the bollowing arguments:
/// [fieldName] the filed name of the text field
/// [initValue] init value of the text field
/// [textInputType] the type of the keybord like (email, number,or ...)
/// [isPasswordField] this boolean select if this field is passwor field for obscureText or not
/// [controller] this for text editing controller for match the password field  with repassword field
///

class TextFieldContent extends StatelessWidget {
  final String? fieldName;
  final String? initValue;
  final TextInputType? textInputType;
  final bool? isPasswordField;
  final TextEditingController? controller;

  final void Function(String?)? onSavedFunction;
  final String? Function(String?)? validationFunc;
  // final bool rightAlign;
  const TextFieldContent({
    Key? key,
    required this.fieldName,
    required this.onSavedFunction,
    required this.validationFunc,
    this.initValue,
    this.textInputType,
    this.isPasswordField,
    this.controller,
    // @required  this.rightAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: ScreenUtil().setHeight(10),
      ),
      child: Container(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller,
              initialValue: initValue,
              autofocus: false,
              textAlign: TextAlign.right,
              validator: validationFunc,
              onSaved: onSavedFunction,
              keyboardType: textInputType,
              obscureText: isPasswordField == null ? false : isPasswordField!,
              decoration: InputDecoration(
                isDense: true,
                hintText: fieldName,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(5),
                  vertical: ScreenUtil().setHeight(5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
