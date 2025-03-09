import 'package:flutter/material.dart';
import 'add_client_screen.dart';
import 'view_clients_screen.dart';
import 'calendar_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AddClientScreen())),
              child: const Text('Add Client'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewClientsScreen())),
              child: const Text('View Clients'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CalendarScreen())),
              child: const Text('Calendar'),
            ),
          ],
        ),
      ),
    );
  }
}