// Dart imports:
import 'dart:convert';
import 'dart:ui' as ui;

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:intouch/core/model/user_location.dart';
import 'package:provider/provider.dart';
import 'package:intouch/core/service/location_service.dart';

// Package imports:
import 'package:url_launcher/url_launcher.dart';

// Project imports:
import 'package:intouch/core/constants/core.dart';
import 'package:intouch/core/init/size_config.dart';

class LocationPageBody extends StatefulWidget {
  @override
  _LocationPageBodyState createState() => _LocationPageBodyState();
}

class _LocationPageBodyState extends State<LocationPageBody> {
  bool isKeyboardVisible;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    isKeyboardVisible = MediaQuery.of(context).viewInsets.vertical > 0;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 25),
                    child: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          MyLocation(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Get User Location
class MyLocation extends StatelessWidget {
  bool locationPermisson = LocationService().locationStream.isBroadcast;
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserLocation>(
      create: (context) => LocationService().locationStream,
      child: ((locationPermisson) ? LocationView() : Text("Permisson Denied")),
  );
  }
}


class LocationView extends StatelessWidget {
  const LocationView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<UserLocation>(context);
    print("Location: Lat:${userLocation.latitude}, Long: ${userLocation.longitude}");
    return Scaffold(
      body: Center(
        child: Text('Location: Lat:${userLocation.latitude}, Long: ${userLocation.longitude}',  style: TextStyle(color: AppColors.colorHeading, fontWeight: FontWeight.w500)),
      ),
    );
  }
}