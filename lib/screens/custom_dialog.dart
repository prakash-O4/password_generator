import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: dialogBox(context),
      // child: Center(
      //   child: Text(
      //     "Prakash Basnet",
      //   ),
      // ),
    );
  }

  dialogBox(context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 45,
            left: 20,
            right: 20,
            bottom: 20,
          ),
          margin: EdgeInsets.only(top: 45),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "No Internet Connection",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                'Please check your internet connection\nLet fix this!!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text('Retry'),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('Close'),
                    ),
                  ],
                ),
              ),
              // Positioned(
              //   left: 20,
              //   right: 20,
              //   child: CircleAvatar(
              //     backgroundImage: AssetImage("images/best.jpg"),
              //     radius: 45,
              //   ),
              // )
            ],
          ),
        ),
      ],
    );
  }
}
