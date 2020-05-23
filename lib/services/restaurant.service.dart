import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:restaurantsnearby/models/restaurant.model.dart';

class RestaurantService {
	final String key = 'AIzaSyDKdUeCu2W5UUZDkho7zwTsLHzji979aSM'; // TODO: Migrar key a setting
	http.Client client;

	RestaurantService() {
		client = http.Client();
	}

	Future<List<RestaurantModel>> getRestaurants(String cityName, int limit) async {
		final response = await client.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=restaurants+in+$cityName+city&key=$key");

		if (response.statusCode == 200) {
			var result = json.decode(response.body) as Map<String, dynamic>;
			List<RestaurantModel> list = new List<RestaurantModel>();
			int counter = 0;
			// log(result["results"].toString());
			result["results"].forEach((element) {
				if(counter < limit) {
					list.add(RestaurantModel.fromJSON(element));
				}
				++counter;
			});

			return list;
		} else {
			return new List();
		}
	}
}