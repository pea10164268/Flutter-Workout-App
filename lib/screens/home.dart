import 'package:flutter/material.dart';
import 'package:flutter_workout_app/screens/settings.dart';
import 'package:flutter_workout_app/screens/workout/createWorkout.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text("Welcome...",
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
    ),
  );
}
}

