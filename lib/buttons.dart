import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
 final String child;
 final buttonColor;
 final textColor;
 final function;

 MyButtons({
   required this.child,
   required this.buttonColor,
   required this.textColor,
   required this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(borderRadius: BorderRadius.circular(20),
          child: Container(height: 100,
            width: 100,
            color: buttonColor,
            child: Center(child: Text(child, style: TextStyle(color: textColor, fontWeight: FontWeight.bold),)),),
        ),
      ),
    );
  }
}
