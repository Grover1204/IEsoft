import 'package:flutter/material.dart';

showAlertDialog(
  BuildContext context,
  Function ImageFromGallery,
  Function ImageFromCamera,
) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      ImageFromGallery();
      Navigator.pop(context);
    },
  );
  Widget cancelButton = TextButton(
    child: Text(
      "cancel",
      style: TextStyle(
        fontSize: 18,
        color: Colors.green[200],
        fontFamily: 'grover',
      ),
    ),
    onPressed: () {
      // select();
      Navigator.pop(context);
    },
  );

  Widget cameraIcon() {
    return TextButton(
      onPressed: () {
        ImageFromCamera();
        Navigator.pop(context);
      },
      child: Image.asset(
        'assets/image/camera_Icon2.png',
        width: 40,
      ),
    );
  }

  Widget gallaryIcon() {
    return TextButton(
      onPressed: () {
        ImageFromGallery();
        Navigator.pop(context);
      },
      child: Image.asset(
        'assets/image/gallery_icon.png',
        width: 50,
      ),
    );
  }

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Select',
          style: TextStyle(
            color: Color.fromARGB(255, 126, 224, 131),
            fontFamily: 'grover',
          ),
        ),
      ],
    ),
    content: Container(
      height: 100,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              cameraIcon(),
              gallaryIcon(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'camera',
                style: TextStyle(
                  color: Color.fromARGB(255, 126, 224, 131),
                  fontFamily: 'grover',
                ),
              ),
              Text(
                'gallery',
                style: TextStyle(
                  color: Color.fromARGB(255, 126, 224, 131),
                  fontFamily: 'grover',
                ),
              ),
            ],
          )
        ],
      ),
    ),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [cancelButton],
      )
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
