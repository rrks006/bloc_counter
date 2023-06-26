part of 'counter_cubit.dart';

class CounterState {
  int countValue;

  CounterState({required this.countValue});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CounterState &&
              runtimeType == other.runtimeType &&
              countValue == other.countValue;

  @override
  int get hashCode => countValue.hashCode;

}
