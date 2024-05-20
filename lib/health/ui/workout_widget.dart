import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health/health.dart';
import 'package:intl/intl.dart'; // For formatting the date
import 'package:provider/provider.dart';

import '../cubit/health_cubit.dart'; // For context.read<HealthCubit>()

class WorkoutCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime start = DateTime.now().subtract(const Duration(minutes: 30));
    DateTime end = DateTime.now();
    int totalEnergyBurned = 500;
    String title = "GYMKY WORKOUT - Sascha Huber - 30min HIIT";

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colors.lightBlueAccent.withOpacity(0.4),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      "Activity Type: High Intensity Interval Training",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      "Start: ${DateFormat('yyyy-MM-dd – kk:mm').format(start)}",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      "End: ${DateFormat('yyyy-MM-dd – kk:mm').format(end)}",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      "Total Energy Burned: $totalEnergyBurned kcal",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () =>
                          context.read<HealthCubit>().saveWorkout(),
                      child: const Text('Save Workout'),
                    ),
                  ],
                ),
              ),
            ),
            BlocBuilder<HealthCubit, HealthState>(
              builder: (context, state) {
                return Text(state.workoutSaved == null
                    ? ""
                    : state.workoutSaved!
                        ? "SAVED successfully!"
                        : "SAVING failed!");
              },
            ),
          ],
        ),
      ),
    );
  }
}
