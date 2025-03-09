// File: C:\Users\nickg\Projects\second_chair\lib\add_case_screen.dart
import 'dart:convert';
import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../database_helper.dart';

class AddCaseScreen extends StatefulWidget {
  final int? clientId;
  final int? caseId;

  const AddCaseScreen({super.key, this.clientId, this.caseId});

  @override
  _AddCaseScreenState createState() => _AddCaseScreenState();
}

class _AddCaseScreenState extends State<AddCaseScreen> {
  final _formKey = GlobalKey<FormState>();
  String? jurisdictionType, state, county, caseNumber, charge, assignedProsecutor;
  int? nextHearingTypeId;
  DateTime? nextHearingDate;
  TimeOfDay? nextHearingTime;
  Case? caseItem;
  List<Map<String, dynamic>> states = [];

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/states_counties.json').then((jsonString) {
      setState(() {
        states = jsonDecode(jsonString)['states'];
      });
    });
    if (widget.caseId != null) {
      final database = Provider.of<AppDatabase>(context, listen: false);
      database.select(database.cases).where((tbl) => tbl.id.equals(widget.caseId!)).getSingle().then((c) {
        setState(() {
          caseItem = c;
          jurisdictionType = c.jurisdictionType;
          state = c.state;
          county = c.county;
          caseNumber = c.caseNumber;
          charge = c.charge;
          assignedProsecutor = c.assignedProsecutor;
          nextHearingTypeId = c.nextHearingTypeId;
          nextHearingDate = c.nextHearing;
          nextHearingTime = TimeOfDay.fromDateTime(c.nextHearing);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
    return Scaffold(
      appBar: AppBar(title: Text(widget.caseId == null ? 'Add Case' : 'Edit Case')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              DropdownButtonFormField<String>(
                value: jurisdictionType,
                items: ['Federal', 'State', 'Municipal']
                    .map<DropdownMenuItem<String>>((String type) => DropdownMenuItem<String>(value: type, child: Text(type)))
                    .toList(),
                onChanged: (value) => setState(() {
                  jurisdictionType = value;
                  if (value != 'State') {
                    state = null;
                    county = null;
                  }
                }),
                decoration: const InputDecoration(labelText: 'Jurisdiction'),
                validator: (value) => value == null ? 'Required' : null,
              ),
              if (jurisdictionType == 'State') ...[
                DropdownButtonFormField<String>(
                  value: state,
                  items: states.map<DropdownMenuItem<String>>((s) => DropdownMenuItem<String>(value: s['name'], child: Text(s['name']))).toList(),
                  onChanged: (value) => setState(() {
                    state = value;
                    county = null;
                  }),
                  decoration: const InputDecoration(labelText: 'State'),
                ),
                if (state != null)
                  DropdownButtonFormField<String>(
                    value: county,
                    items: (states.firstWhere((s) => s['name'] == state)['counties'] as List<dynamic>)
                        .map<DropdownMenuItem<String>>((c) => DropdownMenuItem<String>(value: c, child: Text(c)))
                        .toList(),
                    onChanged: (value) => setState(() => county = value),
                    decoration: const InputDecoration(labelText: 'County'),
                  ),
              ],
              TextFormField(
                initialValue: caseNumber,
                decoration: const InputDecoration(labelText: 'Case Number'),
                validator: (value) => value == null || value.isEmpty ? 'Required' : null,
                onSaved: (value) => caseNumber = value,
              ),
              TextFormField(
                initialValue: charge,
                decoration: const InputDecoration(labelText: 'Charge'),
                validator: (value) => value == null || value.isEmpty ? 'Required' : null,
                onSaved: (value) => charge = value,
              ),
              TextFormField(
                initialValue: assignedProsecutor,
                decoration: const InputDecoration(labelText: 'Assigned Prosecutor'),
                onSaved: (value) => assignedProsecutor = value,
              ),
              StreamBuilder<List<HearingType>>(
                stream: database.select(database.hearingTypes).watch(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return const CircularProgressIndicator();
                  return Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<int>(
                          value: nextHearingTypeId,
                          items: snapshot.data!.map((type) => DropdownMenuItem(value: type.id, child: Text(type.type))).toList(),
                          onChanged: (value) => setState(() => nextHearingTypeId = value),
                          decoration: const InputDecoration(labelText: 'Hearing Type'),
                          validator: (value) => value == null ? 'Required' : null,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () async {
                          final newType = await showDialog<String>(
                            context: context,
                            builder: (context) {
                              String? type;
                              return AlertDialog(
                                title: const Text('Add Hearing Type'),
                                content: TextField(onChanged: (value) => type = value),
                                actions: [
                                  TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, type),
                                    child: const Text('Add'),
                                  ),
                                ],
                              );
                            },
                          );
                          if (newType != null && newType.isNotEmpty) {
                            final id = await database.into(database.hearingTypes).insert(HearingTypesCompanion(type: Value(newType)));
                            setState(() => nextHearingTypeId = id);
                          }
                        },
                      ),
                    ],
                  );
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: nextHearingDate ?? DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (date != null) setState(() => nextHearingDate = date);
                },
                child: Text(nextHearingDate == null ? 'Select Date' : nextHearingDate.toString().split(' ')[0]),
              ),
              ElevatedButton(
                onPressed: () async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: nextHearingTime ?? TimeOfDay.now(),
                  );
                  if (time != null) setState(() => nextHearingTime = time);
                },
                child: Text(nextHearingTime == null ? 'Select Time' : nextHearingTime!.format(context)),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate() &&
                      (jurisdictionType != 'State' || (state != null && county != null)) &&
                      nextHearingDate != null &&
                      nextHearingTime != null) {
                    _formKey.currentState!.save();
                    final nextHearing = DateTime(
                      nextHearingDate!.year,
                      nextHearingDate!.month,
                      nextHearingDate!.day,
                      nextHearingTime!.hour,
                      nextHearingTime!.minute,
                    );
                    if (widget.caseId == null) {
                      await database.into(database.cases).insert(
                        CasesCompanion(
                          clientId: Value(widget.clientId!),
                          jurisdictionType: Value(jurisdictionType!),
                          state: Value(state),
                          county: Value(county),
                          caseNumber: Value(caseNumber!),
                          charge: Value(charge!),
                          assignedProsecutor: Value(assignedProsecutor),
                          nextHearingTypeId: Value(nextHearingTypeId!),
                          nextHearing: Value(nextHearing),
                        ),
                      );
                    } else {
                      await database.update(database.cases).replace(
                        caseItem!.copyWith(
                          jurisdictionType: jurisdictionType!,
                          state: Value(state),
                          county: Value(county),
                          caseNumber: caseNumber!,
                          charge: charge!,
                          assignedProsecutor: Value(assignedProsecutor),
                          nextHearingTypeId: nextHearingTypeId!,
                          nextHearing: nextHearing,
                        ),
                      );
                    }
                    Navigator.pop(context);
                  }
                },
                child: Text(widget.caseId == null ? 'Add Case' : 'Update Case'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}