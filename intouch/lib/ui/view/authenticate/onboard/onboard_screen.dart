// Libraries

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:intouch/core/init/size_config.dart';
import 'components/body.dart';

// Components


class OnboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
      resizeToAvoidBottomInset: false, // RenderFlex error solution
    );
  }
}
