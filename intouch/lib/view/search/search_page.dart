// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:intouch/core/init/fade_animation.dart';
import 'package:intouch/widget/searchpage/history_body_list.dart';
import 'package:intouch/widget/searchpage/vowels.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isKeyboardVisible = false;

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      0.3,
      Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              Vowels(),
              HistoryBodyList(
                historyWord: 'Network',
              )
            ],
          )
        ],
      ),
    );
  }
}
