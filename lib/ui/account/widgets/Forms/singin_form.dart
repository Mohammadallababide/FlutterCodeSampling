import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:p2_mobile/core/util/flash_notify.dart';
import 'package:p2_mobile/core/util/text_field_content.dart';
import 'package:p2_mobile/ui/account/bloc/acount_bloc.dart';
import '../../../../core/util/generate_screen.dart';
import '../../../../core/validations/email_validation.dart';
import '../../../../core/validations/password_validation.dart';

///
///[SingInForm] form of the [SiginPage]
///

class SingInForm extends StatefulWidget {
  @override
  _SingInFormState createState() => _SingInFormState();
}

///
///[acountBloc]the base bloc for this feature (acounting feature)
///[submitForm]this fuction for submit the form
///

class _SingInFormState extends State<SingInForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AcountBloc acountBloc = AcountBloc();
  late String password;
  late String email;
  @override
  Widget build(BuildContext context) {
    bool checkedSaveInfoValue = false;
    return BlocListener(
      listener: (context, state) {
        if (state is ErrorSingIn) {
          getFlashBarNotify(context);
        }
        if (state is SucessSingIn) {
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
              isPasswordField: true,
              onSavedFunction: (value) {
                setState(() {
                  password = value!;
                });
              },
              validationFunc: (value) => passwordValidation(value!),
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
              onTap: () {
                Navigator.pushNamed(
                  context,
                  NameScreen.HomeScreen,
                );
              },
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
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: ScreenUtil().setWidth(15)),
                child: Text(
                  'نسيت كلمة المرور',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(15),
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
          ],
        ),
      ),
    );
  }

  void submitForm() {
    formKey.currentState!.save();
    if (formKey.currentState!.validate()) {
      acountBloc.add(SingIn(email: email, password: password));
    } else {
      getFlashBarNotify(context, text: 'معلومات الأدخل غير كاملة');
    }
  }
}
