import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_generator/components/strings.dart';
import 'package:password_generator/components/style.dart';
import 'package:password_generator/logic.dart';
import 'package:password_generator/screens/dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _upperCase = true;
  bool _lowerCase = false;
  bool _numbers = false;
  bool _symbol = false;
  var answer = "Your password is here";
  late TextEditingController _controller;
  late Logic logic;
  late FocusNode _focusNode;
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _controller = TextEditingController();
    logic = Logic();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    getPassword() {
      setState(
        () {
          if (int.parse(_controller.text) <= 0) {
            return print('Mg number halna aaudaina??');
          }
          this.answer = logic.generatePassword(
            int.parse(_controller.text),
            _numbers,
            _symbol,
            _lowerCase,
            _upperCase,
          );
          print(this.answer);
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        title: Text(
          Strings.appHeading,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DialogScreen(),
                  ),
                );
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: MediaQuery.of(context).size.width * 1.20,
              width: MediaQuery.of(context).size.width - 0.2,
              child: Card(
                color: Colors.green[100],
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        Strings.cardHeading,
                        style: CardStyle.cardHeadingStyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 12,
                          top: 4,
                          right: 4,
                          bottom: 4,
                        ),
                        width: 265,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.grey,
                        ),
                        child: Text(
                          answer,
                          style: CardStyle.answerTextStyle,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      ListTile(
                        title: Text(Strings.passwordTile),
                        trailing: SizedBox(
                          height: 120,
                          width: 40,
                          child: TextField(
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.number,
                            focusNode: _focusNode,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              // height: 1.8,
                            ),
                            maxLength: 2,
                            decoration: InputDecoration(
                              //disables the counter text property under the border of text field.
                              counterText: "",
                            ),
                            controller: _controller,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      ListTile(
                        title: Text(
                          Strings.upperTile,
                        ),
                        trailing: Checkbox(
                          value: _upperCase,
                          onChanged: (value) {
                            setState(() {
                              _upperCase = value!;
                            });
                          },
                          activeColor: Colors.green,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          Strings.lowerTile,
                        ),
                        trailing: Checkbox(
                          value: _lowerCase,
                          onChanged: (value) {
                            setState(() {
                              _lowerCase = value!;
                            });
                          },
                          activeColor: Colors.green,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          Strings.symbolTile,
                        ),
                        trailing: Checkbox(
                          value: _symbol,
                          onChanged: (value) {
                            setState(() {
                              _symbol = value!;
                            });
                          },
                          activeColor: Colors.green,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          Strings.numbersTile,
                        ),
                        trailing: Checkbox(
                          value: _numbers,
                          onChanged: (value) {
                            setState(() {
                              _numbers = value!;
                            });
                          },
                          activeColor: Colors.green,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (_controller.text.isEmpty) {
                                  print('fuck you');
                                } else {
                                  getPassword();
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.all(7),
                                child: Text(
                                  Strings.generatePassword,
                                  style: CardStyle.generatedPassword,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            IconButton(
                              icon: CardStyle.copyIcon,
                              onPressed: () {
                                Clipboard.setData(
                                  ClipboardData(
                                    text: answer.toString(),
                                  ),
                                ).then((result) {
                                  final snackBar = SnackBar(
                                    content: Text(Strings.copied),
                                    action: SnackBarAction(
                                      label: Strings.undo,
                                      onPressed: () {},
                                    ),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
