import 'package:health/health.dart';

class HealthRepository {
  final Health _health = Health();

  Future<int> fetchSteps() async {
    var now = DateTime.now();
    var midnight = DateTime(now.year, now.month, now.day - 1);
    try {
      var steps = await _health.getTotalStepsInInterval(midnight, now);
      return steps ?? 0;
    } catch (e) {
      print("Failed to fetch steps: $e");
      return 0;
    }
  }
}
