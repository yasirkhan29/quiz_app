//

import 'package:flutter/material.dart';

class ReusableBotton extends StatelessWidget {
  String ButtonText;
  Function()? onpress;
  ReusableBotton({super.key, required this.ButtonText, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        width: 90,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.orange, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            ButtonText,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
