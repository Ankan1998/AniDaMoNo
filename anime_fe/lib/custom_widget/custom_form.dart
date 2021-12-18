import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextStyle hintStyle;
  final TextStyle inputStyle;
  final TextStyle labelStyle;
  final TextStyle textStyle;
  final Function onChange;
  final Function onTap;
  final Function onSave;
  final bool obscureText;
  final bool isEnabled;
  final bool filled;
  final Color fillColor;
  final FormFieldValidator<String> validator;
  const CustomForm({
    Key key,
    this.labelText,
    this.hintText,
    this.hintStyle,
    this.inputStyle,
    this.labelStyle,
    this.textStyle,
    this.onChange,
    this.onTap,
    this.onSave,
    this.obscureText,
    this.isEnabled,
    this.filled,
    this.fillColor,
    this.validator,
  }) : super(key: key);

  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {

  InputDecoration _inputDecoration(BuildContext context) {
    return InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.all(20.0),
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: widget.filled,
        fillColor: widget.fillColor,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)
        ),
        suffixIconConstraints: BoxConstraints(
          minHeight: 0,
          minWidth: 0,
        ),
        alignLabelWithHint: true,
    );
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText,
      enabled: widget.isEnabled,
      validator: widget.validator,
      onTap: widget.onTap,
      onChanged: widget.onChange,
      style: widget.inputStyle,
      decoration: _inputDecoration(context),
      onSaved: widget.onSave,

    );
  }
}
