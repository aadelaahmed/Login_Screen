import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget defaultTextForm({
  required TextEditingController controller,
  required TextInputType textInputType,
  bool isPassword = false,
  //required Function(String) validate,
  required Function onSubmit,
  required Function onChange,
  required String labelText,
  required IconData prefixIcon,
  required Function onSuffixIconPressed,
  IconData? suffixIcon,
  bool obSecureFlag = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: textInputType,
      obscureText: obSecureFlag,
      onFieldSubmitted:onSubmit(),
      onChanged: onChange(),

      validator: (value) {
        if(value == null || value.isEmpty){
          return isPassword ? 'Password can\'t be empty' : 'Email can\'t be empty';
        }
      },
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(
          prefixIcon,
        ),
        suffixIcon: (suffixIcon != null) ? IconButton(
          icon: Icon(suffixIcon),
          onPressed: onSuffixIconPressed(),
        ) : null,
        border: OutlineInputBorder(),
      ),
    );