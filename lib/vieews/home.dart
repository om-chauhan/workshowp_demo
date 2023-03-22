import 'package:demo/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController userName = TextEditingController();
  TextEditingController pass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool showPass = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello.',
                    style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                  SizedBox(height: 7),
                  Text(
                    'Welcome Back',
                    style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                  SizedBox(height: 100),
                  TextFormField(
                    controller: userName,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      } else if (value.length < 6) {
                        return 'Username must be at least 6 characters';
                      }
                      return null;
                    },
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      label: Text('USERNAME'),
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        letterSpacing: 2,
                      ),
                      border: customBorder(),
                      focusedBorder: customBorder(),
                      enabledBorder: customBorder(),
                    ),
                  ),
                  SizedBox(height: 60),
                  TextFormField(
                    controller: pass,
                    obscureText: showPass,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      label: Text('PASSWORD'),
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        letterSpacing: 2,
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {});
                          showPass = !showPass;
                        },
                        child: Text(
                          'SHOW',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      border: customBorder(),
                      focusedBorder: customBorder(),
                      enabledBorder: customBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                  CustomButton(
                    text: 'LOGIN',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  customBorder() {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 0.8),
    );
  }
}
