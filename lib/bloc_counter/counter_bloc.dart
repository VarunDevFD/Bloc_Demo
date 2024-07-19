import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(InitialState()) {
    on<Increment>(
      (event, emit) {
        final currentValue = state.count;
        final incrementValue = currentValue + 1;
        return emit(CounterState(count: incrementValue));
      },
    );

    on<Decrement>(
      (event, emit) {
        final currentValue = state.count;
        final decrementValue = currentValue - 1;
        return emit(CounterState(count: decrementValue));
      },
    );
  }
}
