import 'package:flutter/cupertino.dart';

class RestaurantModel {
  final String name;
  final String address;
  final double rating;
  final int userRatingsTotal;

  RestaurantModel(
      {@required this.name,
        this.address,
        this.rating,
        this.userRatingsTotal
      });

  factory RestaurantModel.fromJSON(Map<String, dynamic> json) {
    return RestaurantModel(
        name: json['name'].toString(),
        address: json['formatted_address'],
        rating: double.parse(json['rating'].toString()),
        userRatingsTotal: int.parse(json['user_ratings_total'].toString())
    );
  }
}
