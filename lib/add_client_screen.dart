// File: C:\Users\nickg\Projects\second_chair\lib\add_client_screen.dart
import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../database_helper.dart';

class AddClientScreen extends StatefulWidget {
  final int? clientId;
  const AddClientScreen({super.key, this.clientId});

  @override
  State<AddClientScreen> createState() => _AddClientScreenState();
}

class _AddClientScreenState extends State<AddClientScreen> {
  final _formKey = GlobalKey<FormState>();
  String? firstName, lastName, email, phone;
  Client? client;

  @override
  void initState() {
    super.initState();
    if (widget.clientId != null) {
      final database = Provider.of<AppDatabase>(context, listen: false);
      (database.select(database.clients)..where((tbl) => tbl.id.equals(widget.clientId!)))
          .getSingle()
          .then((c) {
        setState(() {
          client = c;
          firstName = c.firstName;
          lastName = c.lastName;
          email = c.email;
          phone = c.phone;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
    return Scaffold(
      appBar: AppBar(title: Text(widget.clientId == null ? 'Add Client' : 'Edit Client')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: firstName,
                decoration: const InputDecoration(labelText: 'First Name'),
                validator: (value) => value == null || value.isEmpty ? 'First Name is required' : null,
                onSaved: (value) => firstName = value,
              ),
              TextFormField(
                initialValue: lastName,
                decoration: const InputDecoration(labelText: 'Last Name'),
                validator: (value) => value == null || value.isEmpty ? 'Last Name is required' : null,
                onSaved: (value) => lastName = value,
              ),
              TextFormField(
                initialValue: email,
                decoration: const InputDecoration(labelText: 'Email'),
                onSaved: (value) => email = value,
              ),
              TextFormField(
                initialValue: phone,
                decoration: const InputDecoration(labelText: 'Phone'),
                onSaved: (value) => phone = value,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (widget.clientId == null) {
                      await database.into(database.clients).insert(
                        ClientsCompanion(
                          firstName: Value(firstName!),
                          lastName: Value(lastName!),
                          email: Value(email),
                          phone: Value(phone),
                        ),
                      );
                    } else {
                      await database.update(database.clients).replace(
                        client!.copyWith(
                          firstName: firstName!,
                          lastName: lastName!,
                          email: Value(email),
                          phone: Value(phone),
                        ),
                      );
                    }
                    Navigator.pop(context);
                  }
                },
                child: Text(widget.clientId == null ? 'Add Client' : 'Update Client'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}