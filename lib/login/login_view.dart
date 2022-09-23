import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../bottom_nav_bar/bottom_bar_view.dart';
import '../register/register_view.dart';
import 'login_response.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height:MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff23D3A5),
              Color(0xff1CBAC9),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                  height: 100,
                  width: 200,
                  child: Image.asset("assets/images/Logo White.png")),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const Text(
                            'Sign in',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              hintText: 'Email Address',
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  !value.contains("@")) {
                                return "Enter Valid Email";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            controller: passwordController,
                            decoration: const InputDecoration(
                              hintText: 'Password',
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter Valid Password";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            width: double.infinity,
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                  color:  Color(0xff1CBAC9),),
                              textAlign: TextAlign.end,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          isLoading
                              ? CircularProgressIndicator()
                              : Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xff1CBAC9),
                                  ),
                                  width: double.infinity,
                                  child: MaterialButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                        login();
                                      }
                                    },
                                    child: const Text(
                                      'Sign in',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                          const SizedBox(
                            height: 22,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.asset('assets/icons/facebook.png')),
                      SizedBox(width: 15,),
                      SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.asset('assets/icons/google.png')),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                    child: const Text(
                      'Don\'t have an account? Sign up',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future login() async {
    setState(() {
      isLoading = true;
    });

    Response loginResponse =
        await post(Uri.parse("http://alcaptin.com/api/login"), body: {
      "email": emailController.text,
      "password": passwordController.text,
    });

    dynamic convertedJson = jsonDecode(loginResponse.body);

    if (loginResponse.statusCode == 200) {
      LoginResponse user = LoginResponse.fromJson(convertedJson);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => BottomNavBarScreen(
            token: user.data!.accessToken,
          ),
        ),
      );
    } else {
      print(convertedJson["message"]);
    }

    setState(() {
      isLoading = false;
    });
  }
}
