// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:intouch/core/init/size_config.dart';
import 'components/body.dart';

// Login Success Screen
class LoginSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: SizedBox(),
        title: Text("Login Success"),
      ),
      body: Body(),
      resizeToAvoidBottomInset: false,
    );
  }
}
