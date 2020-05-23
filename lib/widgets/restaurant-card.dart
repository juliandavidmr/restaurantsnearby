import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurantsnearby/models/restaurant.model.dart';

class RestaurantCard extends StatelessWidget {

	final RestaurantModel restaurantModel;

  RestaurantCard({@required this.restaurantModel});

  @override
  Widget build(BuildContext context) {
    return Container(
			child: Card(
					elevation: 5,
					shape: RoundedRectangleBorder(
							borderRadius: BorderRadius.circular(20)
					),
					child: Padding(
						padding: EdgeInsets.all(20),
						child: Container(
							child: Column(
								crossAxisAlignment: CrossAxisAlignment.start,
								children: <Widget>[
                  Text(
                    restaurantModel.name ?? '',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
									Text(
										restaurantModel.address ?? '',
										softWrap: true,
									),
                  SizedBox(height: 10,),
									Row(
										mainAxisAlignment: MainAxisAlignment.spaceBetween,
										children: <Widget>[
											Text("Rating"),
											Text("User ratings")
										],
									),
									Row(
										mainAxisAlignment: MainAxisAlignment.spaceBetween,
										children: <Widget>[
											Text(restaurantModel.rating.toString(),
												style: TextStyle(fontSize: 20),
											),
											Text(restaurantModel.userRatingsTotal.toString(),
                          style: TextStyle(fontSize: 20))
                    ],
									)
								],
							),
						),
					)
			),
		);
  }
}
