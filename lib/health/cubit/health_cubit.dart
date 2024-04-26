import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../repo/health_repo.dart';

part 'health_state.dart';

class HealthCubit extends Cubit<HealthState> {
  final HealthRepository _healthRepository;

  HealthCubit(this._healthRepository) : super(HealthState(steps: -1));

  Future<void> loadSteps() async {
    int steps = await _healthRepository.fetchSteps();
    emit(HealthState(steps: steps));
  }
}
