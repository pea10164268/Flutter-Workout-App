import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'First Name'),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Last Name'),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Email Address'),
                  ),
                  TextFormField(
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
                        labelText: 'Password'),
                  ),
                  TextFormField(
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
                        labelText: 'Confirm Password'),
                  ),
                ]),
              ),
              Column(
                children: <Widget>[
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
                  const Text('\nAlready have an account?'),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
