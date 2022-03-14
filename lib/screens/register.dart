import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'main.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isVisible = true;
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController password2 = TextEditingController();


  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create your Account here",
        style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey.shade300,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.blueGrey.shade50,
        padding: const EdgeInsets.all(32),
        child: SingleChildScrollView(
            child: Form(
              child: Column(
                children: <Widget> [
                  TextFormField(
                    controller: firstName,
                    decoration: const InputDecoration(labelText: 'First Name *'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "* Required";
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    controller: lastName,
                    decoration: const InputDecoration(labelText: 'Last Name *'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "* Required";
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    controller: email,
                    decoration: const InputDecoration(
                        labelText: 'Email Address *'),
                    validator:MultiValidator([
                      RequiredValidator(errorText: "* Required"),
                      EmailValidator(errorText: "Enter valid email id"),
                    ]),
                  ),
                  TextFormField(
                    controller: password,
                    obscureText: _isVisible,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                              _isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off
                          ),
                          onPressed: () {
                            setState(() {
                              _isVisible = !_isVisible;
                            });
                          },
                        ),
                        labelText: 'Password *'),
                        validator:(value) {
                          if (value!.isEmpty) {
                            return "* Required";
                          } else if (value.length < 6) {
                            return "Password must be at least 6 characters";
                          } else if (value.length > 15) {
                            return "Password must be at least 15 characters";
                          } else {
                            return null;
                          }
                        }
                  ),
                  TextFormField(
                    controller: password2,
                    obscureText: _isVisible,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                              _isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off
                          ),
                          onPressed: () {
                            setState(() {
                              _isVisible = !_isVisible;
                            });
                          },
                        ),
                        labelText: 'Confirm Password *'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "* Required";
                      } else if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      } else if (value.length > 15) {
                        return "Password must be at least 15 characters";
                      } else
                      {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                    ),
                  ),
                  const Text('\nAlready have an account?',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                  ),),
                  ElevatedButton(
                    child: const Text(
                      'Sign In',
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                    },
                  ),
                ],
              ),
            ),
        ),
      ),
    );
  }
}