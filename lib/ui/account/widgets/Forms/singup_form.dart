import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:p2_mobile/core/util/constants.dart';
import 'package:p2_mobile/core/util/custom_smart_choise.dart';
import 'package:p2_mobile/core/util/flash_notify.dart';
import 'package:p2_mobile/core/util/image_taken_dialog_choice.dart';
import 'package:p2_mobile/core/util/text_field_content.dart';
import 'package:p2_mobile/core/validations/phone_number_validation.dart';
import 'package:p2_mobile/core/validations/saveNulity_form_validation.dart';
import 'package:p2_mobile/core/validations/username_validation.dart';
import 'package:p2_mobile/ui/account/bloc/acount_bloc.dart';

import '../../../../core/util/generate_screen.dart';
import '../../../../core/validations/confirm_matching_password_validation.dart';
import '../../../../core/validations/email_validation.dart';
import '../../../../core/validations/password_validation.dart';

///
///[SingupForm]form of the [SigupPage]
///

class SingupForm extends StatefulWidget {
  @override
  _SingupFormState createState() => _SingupFormState();
}

///
///[acountBloc]the base bloc for this feature (acounting feature)
///[submitForm]this fuction for submit the form
///

class _SingupFormState extends State<SingupForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController pass = TextEditingController();
  late String tGovernorate;
  late String tImageProfile = '';
  late String tName;
  late String password;
  late String repassword;
  late String tPhone;

  late String email;
  final AcountBloc acountBloc = AcountBloc();

  @override
  Widget build(BuildContext context) {
    bool checkedSaveInfoValue = false;
    return BlocListener(
      listener: (context, state) {
        if (state is ErrorSingUp) {
          getFlashBarNotify(context);
        }
        if (state is SucessSingUp) {
          Navigator.pushNamed(
            context,
            NameScreen.HomeScreen,
          );
        }
      },
      bloc: acountBloc,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Stack(children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    child: ImageTakenDialogChoice(
                      child: CircleAvatar(
                        radius: ScreenUtil().radius(90),
                        backgroundColor: Theme.of(context).primaryColor,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: ScreenUtil().radius(15),
                              child: Icon(
                                Icons.camera_alt,
                                size: ScreenUtil().setSp(20),
                                color: Color(0xFF404040),
                              ),
                            ),
                          ),
                          radius: ScreenUtil().radius(65),
                          backgroundImage:
                              AssetImage('assets/images/profileImage.png'),
                        ),
                      ),
                    ),
                  )),
            ]),
            TextFieldContent(
              fieldName: 'اسم المستخدم كاملاََ',
              textInputType: TextInputType.name,
              onSavedFunction: (value) {
                setState(() {
                  this.tName = value!;
                });
              },
              validationFunc: (value) => userNameValidation(value!),
            ),
            TextFieldContent(
              fieldName: 'رقم الجوال',
              textInputType: TextInputType.number,
              onSavedFunction: (value) {
                setState(() {
                  this.tPhone = value!;
                });
              },
              validationFunc: (value) => phoneNumberValidation(value!),
            ),
            TextFieldContent(
              fieldName: 'البريد الإكتروني',
              textInputType: TextInputType.emailAddress,
              onSavedFunction: (value) {
                setState(() {
                  email = value!;
                });
              },
              validationFunc: (value) => emailValidation(value!),
            ),
            TextFieldContent(
              fieldName: 'كلمة المرور',
              controller: pass,
              isPasswordField: true,
              onSavedFunction: (value) {
                setState(() {
                  password = value!;
                });
              },
              validationFunc: (value) => passwordValidation(value!),
            ),
            TextFieldContent(
              fieldName: 'تكرار كلمة المرور',
              isPasswordField: true,
              onSavedFunction: (value) {
                setState(() {
                  repassword = value!;
                });
              },
              validationFunc: (value) =>
                  confirmPasswordValidation(value!, pass),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            CustomSmartChoisePobUp(
              optionList: governorates,
              titleSmartChoise: 'المحافظة الحالية',
              onChanged: (selectedValue) {
                setState(() {
                  this.tGovernorate = selectedValue.value;
                });
              },
              validationFunc: (value) =>
                  saveNuiltyFormValidation(value, 'يجب اختيار محافظتك الحالية'),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            CheckboxListTile(
              title: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: ScreenUtil().setWidth(15)),
                  child: Text("حفظ معلومات الإدخال"),
                ),
              ),
              value: checkedSaveInfoValue,
              onChanged: (newValue) {
                setState(() {
                  checkedSaveInfoValue = newValue!;
                });
              },
              activeColor: Theme.of(context).primaryColor,
              controlAffinity: ListTileControlAffinity.leading,
            ),
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
            BlocBuilder(
              bloc: acountBloc,
              builder: (context, state) {
                if (state is RegistrationProcessing) {
                  return Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                          strokeWidth: ScreenUtil().setWidth(3),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(10),
                        ),
                      ],
                    ),
                  );
                }
                return InkWell(
                  onTap: () => submitForm(),
                  child: Container(
                    width: ScreenUtil().screenWidth - ScreenUtil().setWidth(20),
                    height: ScreenUtil().setHeight(60),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'تأكيد',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: ScreenUtil().screenWidth - ScreenUtil().setWidth(20),
                height: ScreenUtil().setHeight(60),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Center(
                  child: SizedBox(
                    height: ScreenUtil().setHeight(40),
                    child: Image(
                      image: AssetImage('assets/images/google-logo.png'),
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
      ),
    );
  }

  void submitForm() {
    formKey.currentState!.save();
    if (formKey.currentState!.validate()) {
      acountBloc.add(SingUp(
        email: email,
        password: password,
        address: tGovernorate,
        imageUrl: 'tImageProfile',
        name: tName,
        phone: tPhone,
      ));
    } else {
      getFlashBarNotify(context, text: 'معلومات الأدخل غير كاملة');
    }
  }
}
