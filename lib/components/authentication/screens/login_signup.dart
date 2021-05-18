import 'package:flutter/material.dart';
import 'package:tutor_finder_flutter/animations/fade_position_animation.dart';
import 'package:tutor_finder_flutter/components/authentication/logic/user.dart';
import 'package:tutor_finder_flutter/components/authentication/logic/validators.dart';
import 'package:tutor_finder_flutter/components/authentication/screens/signup_password.dart';
import 'package:tutor_finder_flutter/components/search/screens/search_screen.dart';

class LoginScreen extends StatefulWidget {
  final String screenType;

  LoginScreen(this.screenType);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool showPassword = false;

  bool isEmailCorrect = false;
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    emailController.addListener(validate);
    passwordController.addListener(validate);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  validate() {
    if (isEmailCorrect != validateEmail(emailController.text)) {
      setState(() {
        isEmailCorrect = !isEmailCorrect;
      });
    }

    setState(() {
      isButtonEnabled = isEmailCorrect;
    });
  }

  goToNextScreen() async {
    // Log in
    if (this.widget.screenType == 'LOG IN') {
      await logIn(emailController.text, passwordController.text);

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
    // Go to signup password screen
    if (this.widget.screenType == 'SIGN UP') {
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(seconds: 2),
          pageBuilder: (_, __, ___) => SignupPassword(emailController.text),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: double.infinity,
                minHeight: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top,
                maxHeight: double.infinity),
            child: Padding(
              padding: EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Heading
                  Text(
                    this.widget.screenType,
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Form
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Email heading
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: FadePositionAnimation(
                          delay: 1,
                          child: Text(
                            'YOUR EMAIL',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      // Email field
                      FadePositionAnimation(
                        delay: 1,
                        startY: 20,
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      // Password heading
                      if (this.widget.screenType == 'LOG IN')
                        Padding(
                          padding: const EdgeInsets.only(top: 30, bottom: 20),
                          child: FadePositionAnimation(
                            delay: 1,
                            child: Text(
                              'YOUR PASSWORD',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      // Optional password field
                      if (this.widget.screenType == 'LOG IN')
                        FadePositionAnimation(
                          delay: 1,
                          startY: 20,
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: !showPassword,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showPassword = !showPassword;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Icon(showPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                ),
                              ),
                            ),
                          ),
                        ),
                      // Button
                      SizedBox(
                        width: double.maxFinite,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 50.0, bottom: 20.0),
                          child: Hero(
                            tag: this.widget.screenType,
                            child: TextButton(
                              onPressed:
                                  isButtonEnabled ? goToNextScreen : null,
                              child: Text(
                                () {
                                  if (this.widget.screenType == 'LOG IN')
                                    return 'LOG IN';
                                  return 'SIGN UP';
                                }(),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                backgroundColor: isButtonEnabled
                                    ? Colors.green
                                    : Colors.grey,
                                padding: EdgeInsets.symmetric(vertical: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Fogot Password
                      if (this.widget.screenType == 'LOG IN')
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () => {},
                            child: FadePositionAnimation(
                              delay: 2,
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  // Switch to other (signup/login) screen
                  FadePositionAnimation(
                    delay: 2,
                    child: Row(
                      children: [
                        // Switch text
                        Text(
                          (() {
                            if (this.widget.screenType == 'LOG IN') {
                              return 'Don\'t have an account?  ';
                            }
                            return 'Already have an account?  ';
                          })(),
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Take to 'Login or Signup' page button
                        TextButton(
                          onPressed: () => {
                            Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                transitionDuration: Duration(seconds: 2),
                                pageBuilder: (_, __, ___) => LoginScreen(() {
                                  if (this.widget.screenType == 'LOG IN')
                                    return 'SIGN UP';
                                  return 'LOG IN';
                                }()),
                              ),
                            )
                          },
                          child: Text(
                            (() {
                              if (this.widget.screenType == 'LOG IN') {
                                return "Sign Up";
                              }
                              return "Log In";
                            })(),
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
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
