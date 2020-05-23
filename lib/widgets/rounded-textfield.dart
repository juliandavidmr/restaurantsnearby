import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {

	final String hintText;
	final Icon prefixIcon;
	final Function onChanged;
	final bool isPassword;

	RoundedTextField({
		this.hintText,
		this.prefixIcon,
		this.onChanged,
		this.isPassword = false
	});

  @override
  Widget build(BuildContext context) {
    return TextField(
			obscureText: isPassword,
			decoration: InputDecoration(
					border: new OutlineInputBorder(
							borderRadius: BorderRadius.circular(20)
					),
					hintText: hintText,
					prefixIcon: prefixIcon,
					contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20)
			),
			onChanged: onChanged,
		);
  }
}
