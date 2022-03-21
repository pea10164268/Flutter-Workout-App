import 'package:flutter/material.dart';
import 'package:flutter_workout_app/screens/settings.dart';
import 'package:flutter_workout_app/screens/workout/createWorkout.dart';

import 'home.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Widget>> pages = [
    {
      'page': const CreateWorkout(),
    },
    {
      'page': const HomePage(),
    },
    {
      'page': const Settings(),
    }
  ];
  int selectedPageIndex = 0;

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        backgroundColor: Colors.blueGrey.shade300,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        currentIndex: selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.fitness_center),
            label: 'Create Workout',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
