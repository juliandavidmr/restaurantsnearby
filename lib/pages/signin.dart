import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurantsnearby/pages/dashboard.dart';
import 'package:restaurantsnearby/pages/signup.dart';

class SigninPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  	Size size = MediaQuery.of(context).size;

    return Scaffold(
			body: Center(
				child: Column(
					children: <Widget>[
						Container(
							margin: EdgeInsets.only(top: size.height * .15),
							child: Image(
								image: AssetImage("assets/login.png"),
								width: size.width * .8,
							)
						),
						Padding(
							padding: EdgeInsets.all(30),
							child: Column(
								mainAxisAlignment: MainAxisAlignment.center,
								children: <Widget>[
									TextField(),
									TextField(),
									RaisedButton(
										child: Text('Sign in'),
										onPressed: () {
											Navigator.push(context, MaterialPageRoute(
												builder: (context) => DashboardPage(),
											));
										},
									)
								],
							),
						),
						Row(
							mainAxisAlignment: MainAxisAlignment.center,
							children: <Widget>[
								Text("don't have an account?"),
								SizedBox(width: 10,),
								GestureDetector(
									onTap: () {
										Navigator.push(context, MaterialPageRoute(
											builder: (context) => SignupPage(),
										));
									},
									child: Text("Register", style: TextStyle(
										fontWeight: FontWeight.w900
									),),
								)
							],
						)
					],
				)
			)
		);
  }
}
