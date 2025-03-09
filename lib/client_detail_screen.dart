// File: C:\Users\nickg\Projects\second_chair\lib\client_detail_screen.dart
import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../database_helper.dart';
import 'add_client_screen.dart';
import 'add_case_screen.dart';
import 'case_detail_screen.dart';

class ClientDetailScreen extends StatelessWidget {
  final int clientId;
  const ClientDetailScreen({super.key, required this.clientId});

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Client Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddClientScreen(clientId: clientId)),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _confirmDeleteClient(context, database),
          ),
        ],
      ),
      body: Column(
        children: [
          StreamBuilder<Client>(
            stream: (database.select(database.clients)..where((tbl) => tbl.id.equals(clientId))).watchSingle(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const CircularProgressIndicator();
              final client = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name: ${client.firstName} ${client.lastName}'),
                    if (client.email != null) Text('Email: ${client.email}'),
                    if (client.phone != null) Text('Phone: ${client.phone}'),
                  ],
                ),
              );
            },
          ),
          Expanded(
            child: StreamBuilder<List<Case>>(
              stream: (database.select(database.cases)..where((tbl) => tbl.clientId.equals(clientId))).watch(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
                final cases = snapshot.data!;
                return ListView.builder(
                  itemCount: cases.length,
                  itemBuilder: (context, index) {
                    final caseItem = cases[index];
                    return ListTile(
                      title: Text(caseItem.charge),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CaseDetailScreen(caseId: caseItem.id)),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddCaseScreen(clientId: clientId)),
              ),
              child: const Text('Add Case'),
            ),
          ),
        ],
      ),
    );
  }

  void _confirmDeleteClient(BuildContext context, AppDatabase database) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Client'),
        content: const Text('Are you sure? This will delete the client and all cases permanently.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(
            onPressed: () async {
              await database.delete(database.cases).where((tbl) => tbl.clientId.equals(clientId)).go();
              await database.delete(database.clients).where((tbl) => tbl.id.equals(clientId)).go();
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}