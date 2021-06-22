import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  var hint;
  var icon;
  var validator;
  var inputType;
  var controller;

  CustomTextFormField(
      {Key? key, this.hint, this.icon, this.validator, this.inputType,this.controller})
      : super(
          key: key,
        );

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: widget.inputType,
      decoration: new InputDecoration(
        prefixIcon: Icon(
          widget.icon,
          color:  Colors.indigo[900],
        ),
        hintText: widget.hint,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(0),
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class CustomLabelName extends StatefulWidget {
  var text;

  CustomLabelName({Key? key, this.text}) : super(key: key);

  @override
  _CustomLabelNameState createState() => _CustomLabelNameState();
}

class _CustomLabelNameState extends State<CustomLabelName> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}
