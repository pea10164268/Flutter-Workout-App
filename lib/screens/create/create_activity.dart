import 'package:flutter/material.dart';

class CreateActivity extends StatefulWidget {
  const CreateActivity({Key? key}) : super(key: key);

  @override
  State<CreateActivity> createState() => _CreateActivityState();
}

class _CreateActivityState extends State<CreateActivity> {
  final TextEditingController name = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController type = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Create your activity",
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
            child: Column(
              children: <Widget> [
                TextFormField(
                  controller: name,
                  decoration: const InputDecoration(
                    labelText: 'Name'
                  ),
                ),
                TextFormField(
                  controller: description,
                  decoration: const InputDecoration(
                      labelText: 'Description'
                  ),
                ),
                TextFormField(
                  controller: type,
                  decoration: const InputDecoration(
                      labelText: 'Type'
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Create',
                    style: TextStyle( fontSize: 20),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
