// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:intouch/core/constants/core.dart';
import 'package:intouch/core/init/size_config.dart';
import 'register_form.dart';

// Sign Up Body
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Responsive
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Register Account
                SizedBox(height: SizeConfig.screenHeight * 0.02), // 4%
                Text(
                  "Register Account",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                    color: AppColors.colorPrimary,
                  ),
                ),
                Text(
                  "Complete your details",
                  textAlign: TextAlign.center,
                ),

                // Sign Up Form
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                RegisterForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
