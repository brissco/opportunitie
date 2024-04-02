import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Assuming WorkerSkill is a class you've defined elsewhere
class WorkerSkill {
  final String name;
  // Other fields can be added here

  WorkerSkill({required this.name});
}

// Dummy Worker class based on your entity
class Worker {
  final int userId;
  final String cv;
  final String portfolio;
  final double averageRating;
  final double hourlyRate;
  final bool availability;
  final String languages;
  final List<WorkerSkill> skills;

  Worker({
    required this.userId,
    required this.cv,
    required this.portfolio,
    required this.averageRating,
    required this.hourlyRate,
    required this.availability,
    required this.languages,
    required this.skills,
  });
}

class WorkerProfileScreen extends StatefulWidget {
  final Worker worker;

  WorkerProfileScreen({Key? key, required this.worker}) : super(key: key);

  @override
  _WorkerProfileScreenState createState() => _WorkerProfileScreenState();
}

class _WorkerProfileScreenState extends State<WorkerProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Worker Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('CV: ${widget.worker.cv}'),
            Text('Portfolio: ${widget.worker.portfolio}'),
            Text('Average Rating: ${widget.worker.averageRating.toString()}'),
            Text('Hourly Rate: \$${NumberFormat("#,##0.00", "en_US").format(widget.worker.hourlyRate)}'),
            Text('Availability: ${widget.worker.availability ? "Available" : "Not Available"}'),
            Text('Languages: ${widget.worker.languages}'),
            Text('Skills:'),
            Expanded(
              child: ListView.builder(
                itemCount: widget.worker.skills.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(widget.worker.skills[index].name),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
