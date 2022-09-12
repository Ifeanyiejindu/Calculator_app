import 'package:flutter/material.dart';

class NeuButtons extends StatelessWidget {
  final String child;
  final buttonColor;
  final textColor;
  final function;

  NeuButtons({
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
        child: Container(height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: buttonColor,
            shape: BoxShape.circle,
            boxShadow: [
              //for the darker shadows
              BoxShadow(
                color: Colors.deepPurple.shade700,
                offset: Offset(4,4),
                blurRadius: 15,
                spreadRadius: 1,
              ),
              //for the lighter shadows
              BoxShadow(
                color: Colors.deepPurple.shade200,
                offset: Offset(-4,-4),
                blurRadius: 15,
                spreadRadius: 1,
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.deepPurple.shade200,
                Colors.deepPurple.shade400
              ],
              stops: [
                0.1,
                0.9
              ],
            ),
          ),
          child: Center(child: Text(child, style: TextStyle(color: textColor, fontWeight: FontWeight.bold),)),),
      ),
    );
  }
}
