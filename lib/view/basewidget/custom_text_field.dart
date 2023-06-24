import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintTxt;
  final TextInputAction textInputAction;
  final void Function(String) onChange;

  CustomTextField({required this.controller, required this.hintTxt, required this.textInputAction, required this.onChange});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Theme.of(context).primaryColor,
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      onChanged: widget.onChange,
      validator: (value) {
        return null;
      },
      decoration: InputDecoration(
          hintText: widget.hintTxt,
          contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15),
        ),
    );
  }
}
