// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String? text;
  VoidCallback? function;
  double width = double.infinity;
  Color color = Colors.blue;

  CustomButton({
    Key? key,
    this.text,
    this.function,
    required this.width,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      color: color,
      child: TextButton(
        onPressed: function,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            text.toString(),
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
