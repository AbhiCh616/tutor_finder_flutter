import 'package:flutter/material.dart';
import 'package:tutor_finder_flutter/components/authentication/logic/user.dart';
import 'dart:math' as math;

import 'package:tutor_finder_flutter/components/authentication/logic/validators.dart';
import 'package:tutor_finder_flutter/components/search/screens/search_screen.dart';

class SignupPassword extends StatefulWidget {
  final String email;

  SignupPassword(this.email);

  @override
  _SignupPasswordState createState() => _SignupPasswordState();
}

class _SignupPasswordState extends State<SignupPassword> {
  final passwordController = TextEditingController();
  bool showPassword = false;
  String password = "";

  @override
  initState() {
    super.initState();

    passwordController.addListener(() {
      setState(() {
        password = passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  changePasswordVisibility() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  signUp() async {
    await createUser(widget.email, password);

    if (await isLoggedIn()) {
      Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => SearchScreen(),
        ),
        ModalRoute.withName('/'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              // Contents should expand entire screen at minimum
              minHeight: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top,
            ),
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Heading ('Set Up Password')
                  Text(
                    'SET UP PASSWORD',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Password field
                  TextFormField(
                    controller: passwordController,
                    obscureText: !showPassword,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: changePasswordVisibility,
                        child: Icon(showPassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                  ),
                  // Validation indicators
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: PasswordCorrectness(password),
                  ),
                  // Sign up button
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 500,
                      child: TextButton(
                        onPressed: validatePassword(password) ? signUp : null,
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        style: TextButton.styleFrom(
                            backgroundColor: validatePassword(password)
                                ? Colors.green
                                : Colors.grey,
                            padding: EdgeInsets.symmetric(vertical: 20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PasswordCorrectness extends StatelessWidget {
  final String password;

  PasswordCorrectness(this.password);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PasswordTask(passwordLowercase(password), 'Lower-case'),
        PasswordTask(passwordUppercase(password), 'Upper-case'),
        PasswordTask(passwordNumber(password), 'Number'),
        PasswordTask(passwordSpecialCharacter(password), 'Special character'),
        PasswordTask(passwordSize(password), 'More than 8 characters'),
      ],
    );
  }
}

class PasswordTask extends StatelessWidget {
  final bool completed;
  final String text;

  PasswordTask(this.completed, this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: completed
          ? Row(
              children: [
                Icon(
                  Icons.done,
                  color: Colors.green,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Transform.rotate(
                  angle: 45 * math.pi / 180,
                  child: Icon(
                    Icons.add,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
