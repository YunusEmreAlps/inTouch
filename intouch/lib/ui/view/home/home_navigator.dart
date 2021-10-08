// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

// Project imports:
import 'package:intouch/core/constants/core.dart';
import 'package:intouch/core/init/app_localizations.dart';
import 'package:intouch/ui/view/home/history_page/history_page.dart';
import 'package:intouch/ui/view/home/home_page.dart';
import 'package:intouch/ui/view/home/location_page/location_page.dart';

class HomeNavigator extends StatefulWidget {
  @override
  _HomeNavigatorState createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigator> {
  int _currentPage = 1;

  List<Widget> _pages = [LocationPage(), HomePage(), HistoryPage()];
  @override
  Widget build(BuildContext context) {
    AppLocalizations.of(context);
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        color: AppColors.colorParagraph2,
        backgroundColor: Colors.white,
        activeColor: AppColors.colorPrimary,
        elevation: 0.5,
        //height causes layout overflow on some devies
        //height: 56,
        onTap: (int val) {
          if (val == _currentPage) return;
          setState(() {
            _currentPage = val;
          });
        },
        initialActiveIndex: _currentPage,
        style: TabStyle.fixedCircle,
        items: <TabItem>[
          TabItem(icon: Icons.location_on_outlined, title: ''),
          TabItem(icon: Icons.home_outlined, title: ''),
          TabItem(icon: Icons.location_history_outlined, title: ''),
        ],
      ),
      body: _pages[_currentPage],
    );
  }
}
