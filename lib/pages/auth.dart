import 'package:cryptocurrency_app/pages/components/navbar.dart';
import 'package:cryptocurrency_app/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  var _isSignup = true;
  var _enteredEmail = '';
  var _enteredUsername = '';
  var _enteredPassword = '';
  var _isAuthentication = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  height: 60,
                  width: 80,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 14, 41, 124),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                  ),
                  child: TextButton(
                      onPressed: () {
                        Get.to(Navbar());
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).secondaryHeaderColor),
                      )),
                ),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Card(
                        color: Color.fromARGB(255, 14, 41, 124),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Form(
                            // key: _form,
                            child: Column(
                              children: [
                                Center(
                                  child: Container(
                                    child: Image.asset(
                                      'assets/images/bitcoin.png',
                                      color: Colors.white,
                                      height: 230,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 28),
                                // Email.....
                                TextFormField(
                                  validator: (value) {
                                    if (value == null ||
                                        value.trim().isEmpty ||
                                        !value.contains('@')) {
                                      return 'Please Enter Valid Email Address';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: const InputDecoration(
                                    hintText: 'Email Address',
                                  ),
                                  onSaved: (newValue) {
                                    _enteredEmail = newValue!;
                                  },
                                ),
                                if (!_isSignup) const SizedBox(height: 6),
                                // Username....
                                if (!_isSignup)
                                  TextFormField(
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Please Enter Your Username';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: const InputDecoration(
                                      hintText: 'Username',
                                    ),
                                    onSaved: (newValue) {
                                      _enteredUsername = newValue!;
                                    },
                                  ),
                                const SizedBox(height: 6),
                                // Password.....
                                TextFormField(
                                  validator: (value) {
                                    if (value == null ||
                                        value.trim().isEmpty ||
                                        value.trim().length < 4) {
                                      return "Password must contain 4 character atleast";
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    hintText: 'Password',
                                  ),
                                  onSaved: (newValue) {
                                    _enteredPassword = newValue!;
                                  },
                                ),
                                const SizedBox(height: 15),
                                if (_isAuthentication)
                                  const CircularProgressIndicator(),
                                if (!_isAuthentication)
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: _isSignup
                                        ? Text(
                                            'Login',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .secondaryHeaderColor),
                                          )
                                        : Text('SignUp',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .secondaryHeaderColor)),
                                  ),
                                // const SizedBox(height: 10),
                                if (!_isAuthentication)
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        _isSignup = !_isSignup;
                                      });
                                    },
                                    child: _isSignup
                                        ? Text('Create a new account',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .secondaryHeaderColor))
                                        : Text('I already have Account',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .secondaryHeaderColor)),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
