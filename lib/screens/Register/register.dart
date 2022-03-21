import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../main.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key, required String uid}) : super(key: key);



  @override
  State<RegisterPage> createState() => _RegisterPageState();

}

class _RegisterPageState extends State<RegisterPage> {


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isVisible = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  late String email, password;

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text ('(Logged' + (user == null ? 'out' : 'in') + ')'),
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
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Email Address *'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email address.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password.';
                    }
                    return null;
                  },
                  obscureText: _isVisible,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(_isVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                      ),
                      labelText: 'Password *'),
                ),
                TextFormField(
                  obscureText: _isVisible,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(_isVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                      ),
                      labelText: 'Confirm Password *'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please repeat your password.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Validating')),
                      );
                    }
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
                    setState(() {});
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
                const Text(
                  '\nAlready have an account?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
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
