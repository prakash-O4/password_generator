// import 'package:flutter/material.dart';
// import 'package:password_generator/constants.dart';

// class Tile extends StatefulWidget {
//   final String text;
//   final bool values;
//   // final bool boolValue;
//   final Object boolValue;
//   const Tile(
//       {required this.text, required this.values, required this.boolValue});

//   @override
//   _TileState createState() => _TileState();
// }

// class _TileState extends State<Tile> {
//   var bool; 
//   @override
//   void initState() {
//     super.initState();
//     bool = widget.boolValue;
//     // print(bool);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(
//         widget.text,
//       ),
//       trailing: Checkbox(
//         value: BoolValue.upperCase,
//         onChanged: (value) {
//           setState(() {
//             bool = value!;
//             print(object)
//           });
//         },
//         activeColor: Colors.green,
//       ),
//     );
//   }
// }
