// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomtextFormField extends StatelessWidget {
  TextEditingController controller;
  String text;
  IconData iconData;
  TextInputType textInputType;
  FormFieldValidator<String>? validation;
  GestureTapCallback? onTap;
  ValueChanged<String>? onChange;
  bool isSecure = false;
  bool enabled = true;
  IconData? suffix;
  VoidCallback? suffixFunction;

  CustomtextFormField({
    Key? key,
    required this.controller,
    required this.text,
    required this.iconData,
    required this.textInputType,
    this.validation,
    this.onTap,
    this.onChange,
    required this.isSecure,
    required this.enabled,
    this.suffix,
    this.suffixFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      scrollController: ScrollController(
        initialScrollOffset: 50.0,
      ),
      decoration: InputDecoration(
        labelText: text,
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixFunction,
                icon: Icon(suffix),
              )
            : null,
        border:
            OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid)
                // borderRadius: BorderRadius.all(
                //   Radius.circular(50),
                // ),
                ),
        prefixIcon: Icon(iconData),
      ),
      onChanged: onChange,
      onTap: onTap,
      enabled: enabled,
      keyboardType: textInputType,
      validator: validation,
      obscureText: isSecure,
    );
  }
}
