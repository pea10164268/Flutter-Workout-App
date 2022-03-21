import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool _isVisible = true;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log in to your account",
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey.shade300,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        width: (MediaQuery.of(context).size.width),
        height: MediaQuery.of(context).size.height,
        color: Colors.blueGrey.shade50,
        padding: const EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email address.';
                    }
                    return null;
                  },
                  controller: email,
                  decoration: const InputDecoration(
                    labelText: "Email",
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password.';
                    }
                    return null;
                  },
                  controller: password,
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
                      labelText: 'Password'),
                ),
                Column(children: <Widget>[
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Validating')),
                        );
                      }
                    },
                    child:
                        const Text('Sign In', style: TextStyle(fontSize: 20)),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                  ),
                  const Text("\n\nDon't have an account?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Register',
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
