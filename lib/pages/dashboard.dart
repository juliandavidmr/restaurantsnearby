import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurantsnearby/models/restaurant.model.dart';
import 'package:restaurantsnearby/pages/history.dart';
import 'file:///C:/Users/USER/AndroidStudioProjects/restaurants_nearby/lib/widgets/restaurant-card.dart';
import 'package:restaurantsnearby/services/restaurant.service.dart';
import 'package:restaurantsnearby/widgets/rounded-textfield.dart';

class DashboardPage extends StatefulWidget {

  final String username;

  const DashboardPage({Key key, this.username}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool searching = false;
  RestaurantService restaurantService;
  String search;

  @override
  void initState() {
    super.initState();

    restaurantService = new RestaurantService();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScrollController _controller = new ScrollController();
    final _searchQuery = new TextEditingController();
    Timer _debounce;

    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                top: size.height * .06,
                bottom: 20,
                left: 20,
                right: 20
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Home",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w900
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        "Logout",
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15),
                RoundedTextField(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search restaurants",
                  onChanged: (value) {
                    if (_debounce?.isActive ?? false) _debounce.cancel();
                    _debounce = Timer(const Duration(milliseconds: 1000), () {
                      log(value);
                      setState(() {
                        search = (value ?? '').trim();
                      });
                    });
                  },
                ),
                SizedBox(height: 20),
                FutureBuilder<List<RestaurantModel>>(
                  builder: (context, snapshot) {
                    if(snapshot.connectionState == ConnectionState.none || snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if(snapshot.data == null || snapshot.data.length == 0) {
                      return Center(
                        child: Text("No results"),
                      );
                    }

                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      controller: _controller,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          child: RestaurantCard(
                            restaurantModel: snapshot.data[index],
                          ),
                        );
                      },
                    );
                  },
                  future: restaurantService.getRestaurants(search, 20),
                )
              ],
            ),
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => HistoryPage(),
          ));
        },
        child: Icon(Icons.history),
        backgroundColor: Colors.green,
      ),
    );
  }
}