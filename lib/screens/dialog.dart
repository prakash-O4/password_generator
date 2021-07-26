import 'package:flutter/material.dart';
import 'package:password_generator/components/strings.dart';
import 'package:password_generator/screens/custom_dialog.dart';

class DialogScreen extends StatelessWidget {
  const DialogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(
          Strings.appHeading,
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomDialog();
              },
            );
          },
          child: Text('Show Diaalog'),
        ),
      ),
    );
  }
}
