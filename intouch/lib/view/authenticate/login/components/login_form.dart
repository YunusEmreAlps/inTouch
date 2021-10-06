// Libraries

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:intouch/core/constants/core.dart';
import 'package:intouch/core/init/form_error.dart';
import 'package:intouch/core/init/size_config.dart';
import 'package:intouch/widget/default_button.dart';
import 'package:intouch/core/service/user_operations.dart';
import 'package:intouch/core/navigation/navigation_constants.dart';

// Components

// Sign In/Login Form
class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>(); // control

  // Variables
  String username;
  String password;
  bool isLoading = false;
  bool rememberMe = false;
  bool _showPassword = false;
  String pattern = r'(^[a-zA-Z ]*$)';
  final List<String> formErrors = [];
  var _controllerusername = TextEditingController();
  var _controllerpassword = TextEditingController();

  UserOperations userOperations = new UserOperations();  

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
        children: <Widget>[
          // Username
          buildUsernameFormField(),
          // Sizedbox for Responsive Design
          SizedBox(height: getProportionateScreenHeight(15)),
          // Password
          buildPasswordField(),
          SizedBox(height: getProportionateScreenHeight(5)),

          // Remember Me checkbox (?) & Forgot Password
          Row(
            children: [
              Checkbox(
                value: rememberMe,
                activeColor: AppColors.colorPrimary,
                onChanged: (value) {
                  setState(() {
                    rememberMe = value;
                  });
                },
              ),
              Text("Remember me"),
              Spacer(),
            ],
          ),

          // Sign in button
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
            text: AppStrings.SIGN_IN,
            buttonColor: AppColors.colorPrimary,
            textColor: Colors.white,
            press: () {
              if ((_formKey.currentState.validate()) &&
                  (formErrors.isEmpty == true)) {
                _formKey.currentState.save();
                // Access to Login success page
                setState(() {
                  isLoading = true;
                });
                _loginOperation(username, password);
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
        } else if (value.length >= 8) {
          removeError(AppStrings.SHORT_PASSWORD_ERROR);
        }
        return null;
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

  void _loginOperation(String username, String password) {
    if (_formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      userOperations.loginUser(username, password).then((value) => {
        print(value),
        if (value.length >= 1)
        {
          Navigator.popAndPushNamed(
            context,
            NavigationConstants.LOGIN_SUCCESS
          )
        }
        else
          {showAlertDialog(context)}
        });
    }else{
      setState(() {
        isLoading = false;
      });
    }
  }

  // Show Alert (Sign In Failed)
  showAlertDialog(BuildContext context) {
    // set up the buttons
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
