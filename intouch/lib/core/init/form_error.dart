// Libraries

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:intouch/core/constants/core.dart';
import 'size_config.dart';

// Form Errors
class FormError extends StatelessWidget {
  const FormError({
    Key key,
    @required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formErrorText(error: errors[index])),
    );
  }

  Row formErrorText({String error}) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
      // crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
      children: [
        // Must be center
        SizedBox(
          width: getProportionateScreenWidth(75),
        ),
        SvgPicture.asset(
          AppImages.iconError,
          height: getProportionateScreenWidth(14),
          width: getProportionateScreenWidth(14),
        ),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        Text(
          error,
          style: TextStyle(
            color: Color(0xFFD9534F),
          ),
        ),
      ],
    );
  }
}
