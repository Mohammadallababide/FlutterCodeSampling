import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_select/smart_select.dart';

class SmartChoiseDialoag extends StatefulWidget {
  ///[title]
  ///title of the smart dialoag
  final String title;

  /// [options] : list of choises
  /// <S2Choice<String>> for item with two defination (value and name)
  /// ex:
  /// options = [
  /// S2Choice<String>(value: 'ion', title: 'Ionic'),
  /// ]
  final List<S2Choice<String>> options;

  /// [choise] the choise value
  final String initValue;

  const SmartChoiseDialoag({
    Key? key,
    required this.title,
    required this.options,
    required this.initValue,
  }) : super(key: key);

  @override
  _SmartChoiseDialoagState createState() => _SmartChoiseDialoagState();
}

class _SmartChoiseDialoagState extends State<SmartChoiseDialoag> {
  late String value;
  @override
  void initState() {
    super.initState();
  }

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
      child: GestureDetector(
        onTap: () => _showSmartDialogSingelChoise(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(5),
            vertical: ScreenUtil().setHeight(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('سشيشسي')],
          ),
        ),
      ),
    );
  }

  Widget _showSmartDialogSingelChoise() {
    return SmartSelect<String>.single(
      modalFilter: true,
      title: 'Frameworks',
      value: widget.initValue,
      choiceItems: widget.options,
      onChange: (state) => setState(() => value = state.value),
      choiceType: S2ChoiceType.radios,
      choiceGrouped: true,
      choiceStyle: S2ChoiceStyle(
        showCheckmark: true,
        highlightColor: Theme.of(context).primaryColor.withOpacity(.4),
      ),
      tileBuilder: (context, state) {
        return S2Tile.fromState(
          state,
          isTwoLine: true,
          isLoading: true,
          leading: Builder(
            builder: (context) {
              String avatarUrl = value != null
                  ? 'https://source.unsplash.com/8I-ht65iRww/100x100'
                  : 'https://source.unsplash.com/8I-ht65iRww/100x100';
              return CircleAvatar(
                backgroundImage: NetworkImage(avatarUrl),
              );
            },
          ),
        );
      },
    );
  }
}
