import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurantsnearby/pages/signin.dart';
import 'package:restaurantsnearby/widgets/rounded-textfield.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<SignupPage> {

  @override
  Widget build(BuildContext context) {
  	Size size = MediaQuery.of(context).size;

  	return Scaffold(
			body:  Container(
				padding: EdgeInsets.all(20),
				child: Column(
					children: <Widget>[
						SizedBox(height: size.height * .1),
						Center(
							child: Text("Signup"),
						),
						SizedBox(height: 25),
						RoundedTextField(
							hintText: "Email",
						),
						SizedBox(height: 10),
						RoundedTextField(
							hintText: "First name",
						),
						SizedBox(height: 10),
						RoundedTextField(
							hintText: "Last name",
						),
						SizedBox(height: 10),
						RoundedTextField(
							hintText: "Password",
							isPassword: true,
						),
						SizedBox(height: 10),
						RaisedButton(
							child: Text("Sign up"),
							onPressed: () {
								Navigator.push(context, MaterialPageRoute(
									builder: (context) => SigninPage(),
								));
							},
						)
					],
				),
			),
		);
  }
}
