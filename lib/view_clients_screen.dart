// File: C:\Users\nickg\Projects\second_chair\lib\view_clients_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../database_helper.dart';
import 'client_detail_screen.dart';

class ViewClientsScreen extends StatelessWidget {
  const ViewClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('View Clients')),
      body: StreamBuilder<List<Client>>(
        stream: database.select(database.clients).watch(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          final clients = snapshot.data!;
          return ListView.builder(
            itemCount: clients.length,
            itemBuilder: (context, index) {
              final client = clients[index];
              return ListTile(
                title: Text('${client.firstName} ${client.lastName}'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClientDetailScreen(clientId: client.id)),
                ),
              );
            },
          );
        },
      ),
    );
  }
}