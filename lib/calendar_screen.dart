import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../database_helper.dart';
import 'case_detail_screen.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Calendar')),
      body: StreamBuilder<List<Case>>(
        stream: database.watchUpcomingCases(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          final cases = snapshot.data!;
          Map<DateTime, List<Case>> events = {};
          for (final caseItem in cases) {
            final date = DateTime(caseItem.nextHearing.year, caseItem.nextHearing.month, caseItem.nextHearing.day);
            events.putIfAbsent(date, () => []).add(caseItem);
          }
          return Column(
            children: [
              TableCalendar(
                firstDay: DateTime.now(),
                lastDay: DateTime(2100),
                focusedDay: focusedDay,
                selectedDayPredicate: (day) => isSameDay(selectedDay, day),
                onDaySelected: (selected, focused) => setState(() {
                  selectedDay = selected;
                  focusedDay = focused;
                }),
                eventLoader: (day) => events[DateTime(day.year, day.month, day.day)] ?? [],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: events[selectedDay]?.length ?? 0,
                  itemBuilder: (context, index) {
                    final caseItem = events[selectedDay]![index];
                    return ListTile(
                      title: Text('${caseItem.charge} - ${caseItem.nextHearing}'),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CaseDetailScreen(caseId: caseItem.id)),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}