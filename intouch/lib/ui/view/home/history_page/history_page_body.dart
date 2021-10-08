// Dart imports:
import 'dart:ui' as ui;

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:intouch/core/constants/core.dart';
import 'package:intouch/core/init/app_widget.dart';
import 'package:intouch/core/init/size_config.dart';
import 'package:intouch/core/init/utility.dart';

class HistoryPageBody extends StatefulWidget {
  @override
  _HistoryPageBodyState createState() => _HistoryPageBodyState();
}

class _HistoryPageBodyState extends State<HistoryPageBody> {
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Material(
                      borderRadius: BorderRadius.circular(8),
                      shadowColor: Colors.black38,
                      elevation: 4,
                      child: AppWidget.getSearchBox(isKeyboardVisible, context,
                          AppStrings.LOCATION_HISTORY),
                    ),
                  ),
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
