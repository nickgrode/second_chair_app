// File: C:\Users\nickg\Projects\second_chair\lib\case_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../database_helper.dart';
import 'add_case_screen.dart';

class CaseDetailScreen extends StatelessWidget {
  final int caseId;
  const CaseDetailScreen({super.key, required this.caseId});

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Case Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
              final caseItem = await (database.select(database.cases)..where((tbl) => tbl.id.equals(caseId))).getSingle();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddCaseScreen(clientId: caseItem.clientId, caseId: caseId)),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _confirmDeleteCase(context, database),
          ),
        ],
      ),
      body: StreamBuilder<Case>(
        stream: (database.select(database.cases)..where((tbl) => tbl.id.equals(caseId))).watchSingle(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          final caseItem = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Charge: ${caseItem.charge}'),
                Text('Case Number: ${caseItem.caseNumber}'),
                Text('Jurisdiction: ${caseItem.jurisdictionType}'),
                if (caseItem.state != null) Text('State: ${caseItem.state}'),
                if (caseItem.county != null) Text('County: ${caseItem.county}'),
                Text('Assigned Prosecutor: ${caseItem.assignedProsecutor ?? 'N/A'}'),
                Text('Next Hearing: ${caseItem.nextHearing}'),
              ],
            ),
          );
        },
      ),
    );
  }

  void _confirmDeleteCase(BuildContext context, AppDatabase database) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Case'),
        content: const Text('Are you sure? This will delete the case permanently.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(
            onPressed: () async {
              await database.delete(database.cases).where((tbl) => tbl.id.equals(caseId)).go();
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