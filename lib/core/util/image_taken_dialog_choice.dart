import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

///
///[ImageTakenDialogChoice] this staful widget for showing dialog for
///catching image from gulary or from camer it gave the widget that
///will wrap it the action to open this dialog
///it take one argument:
/// [child] the widget that will wrap it
///

class ImageTakenDialogChoice extends StatefulWidget {
  const ImageTakenDialogChoice({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _ImageTakenDialogChoiceState createState() => _ImageTakenDialogChoiceState();
}

class _ImageTakenDialogChoiceState extends State<ImageTakenDialogChoice> {
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: () => _showChoiceDialog(), child: widget.child);
  }

  Future<void> _showChoiceDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('اختيار صورة الملف الشخصي'),
            content: SingleChildScrollView(
                child: ListBody(
              children: [
                ListTile(
                  title: Text('إلتقاط صورة'),
                  leading: Icon(
                    Icons.camera_alt,
                    color: Theme.of(context).primaryColor,
                  ),
                  onTap: () {
                    _openCamera();
                  },
                ),
                ListTile(
                  title: Text('صورة من المعرض'),
                  leading: Icon(
                    Icons.photo_library,
                    color: Theme.of(context).primaryColor,
                  ),
                  onTap: () {
                    _openGallary();
                  },
                ),
              ],
            )),
          );
        });
  }

  _openGallary() async {
    // ignore: deprecated_member_use
    var picture = await _picker.getImage(
      source: ImageSource.gallery,
      //  maxWidth: maxWidth,
      //       maxHeight: maxHeight,
      imageQuality: 50,
    );
    Navigator.of(context).pop();
    // if (picture != null) {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (BuildContext context) => SimpleCropRoute(
    //           image: imageFile, editprofileBloc: editprofileBloc),
    //     ),
    //   );
    //   setState(() {
    //     imageFile = picture;
    //   });
    // }
  }

  _openCamera() async {
    // ignore: deprecated_member_use
    var picture = await _picker.getImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    Navigator.of(context).pop();
    // if (picture != null) {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (BuildContext context) => SimpleCropRoute(
    //           image: imageFile, editprofileBloc: editprofileBloc),
    //     ),
    //   );
    //   setState(() {
    //     imageFile = picture;
    //   });
    // }
  }
}
