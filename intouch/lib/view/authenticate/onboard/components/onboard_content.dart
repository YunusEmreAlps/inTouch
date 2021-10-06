// Libraries

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:intouch/core/constants/core.dart';
import 'package:intouch/core/init/size_config.dart';

class OnBoardContent extends StatelessWidget {
  const OnBoardContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);
  final String text, image;

  // Don't forget Renderflex Error
  @override
  Widget build(BuildContext context) {
   return Column(
      children: <Widget>[
        Spacer(),
        Text(
          AppStrings.APP_NAME,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: AppColors.colorPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: AppColors.colorDarkGrey,
          ),
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 2),
        Image.asset(
          image,
          height: getProportionateScreenHeight(320), // 265 
          width: getProportionateScreenWidth(350),   // 235 
        ),
      ],
    );

  }
}
