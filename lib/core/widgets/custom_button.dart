import 'package:flutter/material.dart';
import '/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
   CustomButton({required this.text,required this.onTaps});
String text;
VoidCallback onTaps;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,

          decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: new LinearGradient(
                colors: [
                  Color.fromARGB(255, 148, 231, 225),
                  Color.fromARGB(255, 62, 182, 226)
                ],
              )
          ),
          child: ElevatedButton(onPressed: onTaps,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent),
              child: Text('$text',style: Styles.style22w,))),
    );
  }
}
