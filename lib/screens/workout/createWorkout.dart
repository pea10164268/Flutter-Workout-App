import 'package:flutter/material.dart';

class CreateWorkout extends StatefulWidget {
  const CreateWorkout({Key? key}) : super(key: key);

  @override
  State<CreateWorkout> createState() => _CreateWorkoutState();
}

class _CreateWorkoutState extends State<CreateWorkout> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController activity = TextEditingController();
  final TextEditingController duration = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Create Workout",
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
              children: <Widget> [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an activity.';
                    }
                    return null;
                  },
                  controller: activity,
                  decoration: const InputDecoration(
                    labelText: 'Activity',
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a duration.';
                    }
                    return null;
                  },
                  controller: duration,
                  decoration: const InputDecoration(
                    labelText: 'Duration',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Create Workout',
                    style: TextStyle(fontSize: 20)),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
                ),
              ],
            ),
          ),
        ),
    ),
    );
  }
}
