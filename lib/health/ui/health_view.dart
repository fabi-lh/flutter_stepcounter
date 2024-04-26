import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health/health.dart';

import '../cubit/health_cubit.dart';

class HealthView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    setupHealth();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Tracker'),
      ),
      body: BlocBuilder<HealthCubit, HealthState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  'Steps today: ${state.steps}',
                  style: const TextStyle(fontSize: 24),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => context.read<HealthCubit>().loadSteps(),
                child: const Text('Load Steps'),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> setupHealth() async {
    Health().configure(useHealthConnectIfAvailable: true);

    // define the types to get
    var types = [
      HealthDataType.STEPS,
    ];

    // requesting access to the data types before reading them
    bool requested = await Health().requestAuthorization(types);
  }
}
