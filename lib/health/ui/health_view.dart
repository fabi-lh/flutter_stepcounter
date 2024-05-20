import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health/health.dart';
import 'package:stepcounter_test/health/ui/stepcounter_widget.dart';
import 'package:stepcounter_test/health/ui/workout_widget.dart';

import '../cubit/health_cubit.dart';

class HealthView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    setupHealth();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_walk)),
              Tab(icon: Icon(Icons.sports_gymnastics)),
            ],
          ),
          title: const Text('Health Tracker'),
        ),
        body: TabBarView(children: [StepcounterWidget(), WorkoutCard()]),
      ),
    );
  }

  Future<void> setupHealth() async {
    Health().configure(useHealthConnectIfAvailable: true);

    // define the types to get
    var types = [
      HealthDataType.STEPS,
      HealthDataType.WORKOUT,
    ];

    List<HealthDataAccess> permissions = types
        .map((e) => e == HealthDataType.STEPS
            ? HealthDataAccess.READ
            : HealthDataAccess.READ_WRITE)
        .toList();

    // requesting access to the data types before reading them
    bool requested =
        await Health().requestAuthorization(types, permissions: permissions);
  }
}
