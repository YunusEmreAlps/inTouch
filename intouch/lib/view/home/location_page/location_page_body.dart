// Dart imports:
import 'dart:convert';
import 'dart:ui' as ui;

// Flutter imports:
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:url_launcher/url_launcher.dart';

// Project imports:
import 'package:intouch/core/constants/core.dart';
import 'package:intouch/core/init/app_widget.dart';
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
                  /*Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Material(
                      borderRadius: BorderRadius.circular(8),
                      shadowColor: Colors.black38,
                      elevation: 4,
                      child: AppWidget.getSearchBox(isKeyboardVisible, context,
                          AppStrings.searchEventText),
                    ),
                  ),*/
                  SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 25),
                    child: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[],
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
