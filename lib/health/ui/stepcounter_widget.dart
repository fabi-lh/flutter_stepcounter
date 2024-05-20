import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart'; // For formatting the date
import 'package:provider/provider.dart';

import '../cubit/health_cubit.dart'; // For context.read<HealthCubit>()

class StepcounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HealthCubit, HealthState>(
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
    );
  }
}
