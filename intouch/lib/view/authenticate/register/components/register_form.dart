// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:intouch/core/constants/core.dart';
import 'package:intouch/core/init/form_error.dart';
import 'package:intouch/core/init/size_config.dart';
import 'package:intouch/core/navigation/navigation_constants.dart';
import 'package:intouch/widget/default_button.dart';

// Sin Up Form
class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>(); // control

  // Variables
  String username;
  String password;
  String comfirmPassword;
  bool rememberMe = false;
  bool _showPassword = false;
  bool _showComfirmPassword = false;
  String pattern = r'(^[a-zA-Z ]*$)';
  var _controllerusername = TextEditingController();
  var _controllerpassword = TextEditingController();
  var _controllercomfirmpassword = TextEditingController();
  

  // Error (Multiple Error)
  final List<String> formErrors = [];

  // Add Error
  void addError(String error) {
    if (!formErrors.contains(error)) {
      setState(() {
        formErrors.add(error);
      });
    }
  }

  // Remove Error
  void removeError(String error) {
    if (formErrors.contains(error)) {
      setState(() {
        formErrors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Full Name
          buildUsernameFormField(),
          SizedBox(height: getProportionateScreenHeight(15)),
          // Password 
          buildPasswordField(),
          SizedBox(height: getProportionateScreenHeight(15)),
          // Comfirm Password
          buildComfirmPasswordField(),
          SizedBox(height: getProportionateScreenHeight(30)),


          // Sign up button
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
            text: AppStrings.SIGN_UP,
            buttonColor: AppColors.colorPrimary,
            textColor: Colors.white,
            press: () {
              if ((_formKey.currentState.validate()) &&
                  (formErrors.isEmpty == true)) {
                _formKey.currentState.save();
                // Access to Login success page
                Navigator.pushNamed(context, NavigationConstants.LOGIN);
              }
            },
          ),

          // Form Error
          SizedBox(height: getProportionateScreenHeight(15)),
          FormError(errors: formErrors),

        ],
      ),
    );
  }


  // Username TextField
  // Username TextField
  TextFormField buildUsernameFormField() {
    return TextFormField(
      controller: _controllerusername,
      cursorColor: AppColors.colorPrimary,
      onSaved: (newValue) => username = newValue,
      onChanged: (value) {
        RegExp regExp = new RegExp(pattern);
        if (value.isEmpty) {
          removeError(AppStrings.NAME_NULL_ERROR);
        } else if (value.length < 8) {
          removeError(AppStrings.SHORT_USERNAME_ERROR);
        }
        else if (!regExp.hasMatch(value)) {
          removeError(AppStrings.INVALID_NAME_ERROR);
        }
        return null;
      },
      validator: (value) {
        RegExp regExp = new RegExp(pattern);
        if (value.isEmpty) {
          addError(AppStrings.NAME_NULL_ERROR);
          return "";
        } else if (value.length < 8) {
          addError(AppStrings.SHORT_USERNAME_ERROR);
          return "";
        }
        else if (!regExp.hasMatch(value)) {
          addError(AppStrings.INVALID_NAME_ERROR);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: AppStrings.USERNAME,
        labelStyle: TextStyle(
          color: AppColors.colorSecondary,
        ),
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        errorStyle: TextStyle(height: 0),
        border: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(30),
            vertical: getProportionateScreenWidth(9)),

        suffixIcon: _controllerusername.text.isEmpty
            ? null
            : IconButton(
                onPressed: () => _controllerusername.clear(),
                icon: Icon(Icons.clear),
              ),

        prefixIcon: Padding(
          padding: EdgeInsets.fromLTRB(
            getProportionateScreenWidth(22.5),
            getProportionateScreenWidth(20),
            getProportionateScreenWidth(22.5),
            getProportionateScreenWidth(20),
          ),
          child: SvgPicture.asset(
            AppImages.iconUser,
            height: getProportionateScreenWidth(18),
          ),
        ),
      ),
    );
  }

  // Password TextField
  TextFormField buildPasswordField() {
    return TextFormField(
      controller: _controllerpassword,
      cursorColor: AppColors.colorPrimary,
      obscureText: !_showPassword,
      enableSuggestions: false,
      autocorrect: false,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(AppStrings.NULL_PASSWORD_ERROR);
        } else if (value.isNotEmpty && password == comfirmPassword) {
          removeError(AppStrings.PASSWORD_MISMATCH);
        }
        password = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(AppStrings.NULL_PASSWORD_ERROR);
          return "";
        } else if (value.length < 8) {
          addError(AppStrings.SHORT_PASSWORD_ERROR);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: AppStrings.PASSWORD,
        labelStyle: TextStyle(
          color: AppColors.colorSecondary,
        ),
        //floatingLabelBehavior: FloatingLabelBehavior.always,
        errorStyle: TextStyle(height: 0),
        border: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),

        contentPadding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(30),
            vertical: getProportionateScreenWidth(9)),

        // Show Password
        suffixIcon: _controllerpassword.text.isEmpty
            ? null
            : GestureDetector(
                onTap: () {
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
                child: Icon(
                  _showPassword ? Icons.visibility : Icons.visibility_off,
                ),
              ),

        // Icon
        prefixIcon: Padding(
          padding: EdgeInsets.fromLTRB(
            getProportionateScreenWidth(25),
            getProportionateScreenWidth(20),
            getProportionateScreenWidth(25),
            getProportionateScreenWidth(20),
          ),
          child: SvgPicture.asset(
            AppImages.iconLock,
            height: getProportionateScreenWidth(18),
          ),
        ),
      ),
    );
  }

  // Comfirm Password TextField
  TextFormField buildComfirmPasswordField() {
    return TextFormField(
      controller: _controllercomfirmpassword,
      cursorColor: AppColors.colorPrimary,
      obscureText: !_showComfirmPassword,
      enableSuggestions: false,
      autocorrect: false,
      onSaved: (newValue) => comfirmPassword = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(AppStrings.NULL_PASSWORD_ERROR);
        } else if (value.isNotEmpty && password == comfirmPassword) {
          removeError(AppStrings.PASSWORD_MISMATCH);
        }
        comfirmPassword = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(AppStrings.NULL_PASSWORD_ERROR);
          return "";
        } else if ((password != value)) {
          addError(AppStrings.PASSWORD_MISMATCH);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: AppStrings.CONFIRM_PASSWORD,
        labelStyle: TextStyle(
          color: AppColors.colorSecondary,
        ),
        //floatingLabelBehavior: FloatingLabelBehavior.always,
        errorStyle: TextStyle(height: 0),
        border: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),

        contentPadding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(30),
            vertical: getProportionateScreenWidth(9)),

        // Show Password
        suffixIcon: _controllercomfirmpassword.text.isEmpty
            ? null
            : GestureDetector(
                onTap: () {
                  setState(() {
                    _showComfirmPassword = !_showComfirmPassword;
                  });
                },
                child: Icon(
                  _showComfirmPassword ? Icons.visibility : Icons.visibility_off,
                ),
              ),

        // Icon
        prefixIcon: Padding(
          padding: EdgeInsets.fromLTRB(
            getProportionateScreenWidth(25),
            getProportionateScreenWidth(20),
            getProportionateScreenWidth(25),
            getProportionateScreenWidth(20),
          ),
          child: SvgPicture.asset(
            AppImages.iconLock,
            height: getProportionateScreenWidth(18),
          ),
        ),
      ),
    );
  }

  // Show Alert (Sign Up Failed)
  showAlertDialog(BuildContext context) {
    Widget cancelButton = FlatButton(
      child: Text(
        AppStrings.CANCEL,
      ),
      onPressed: () {},
    );
    Widget continueButton = FlatButton(
      child: Text(AppStrings.CONTINUE),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: FormError(errors: formErrors),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
