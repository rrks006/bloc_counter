import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_counter/counter/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    test('initial state is 0', () {
      expect(CounterCubit().state.countValue, 0);
    });
  });

  group('increment', () {
    blocTest<CounterCubit, CounterState>(
      'emits [1] when state is 0',
      build: () => CounterCubit(),
      act: (cubit) => cubit.increment(),
      expect: () => <CounterState>[
        CounterState(countValue: 1),
      ],
    );

    blocTest<CounterCubit, CounterState>(
      'emits [1, 2] when state is 0',
      build: () => CounterCubit(),
      act: (cubit) => cubit
        ..increment()
        ..increment(),
      expect: () => <CounterState>[
        CounterState(countValue: 1),
        CounterState(countValue: 2)
      ],
    );

    blocTest<CounterCubit, CounterState>(
      'emits [42] when state is 41',
      build: () => CounterCubit(),
      seed: () => CounterState(countValue: 41),
      act: (cubit) => cubit.increment(),
      expect: () => <CounterState>[
        CounterState(countValue: 42),
      ],
    );
  });

  group('decrement', () {
    blocTest<CounterCubit, CounterState>(
      'emits [-1] when state is 0',
      build: () => CounterCubit(),
      act: (cubit) => cubit.decrement(),
      expect: () => <CounterState>[
        CounterState(countValue: -1),
      ],
    );

    blocTest<CounterCubit, CounterState>(
      'emits [-1, -2] when state is 0',
      build: () => CounterCubit(),
      act: (cubit) => cubit
        ..decrement()
        ..decrement(),
      expect: () => <CounterState>[
        CounterState(countValue: -1),
        CounterState(countValue: -2)
      ],
    );

    blocTest<CounterCubit, CounterState>(
      'emits [42] when state is 43',
      build: () => CounterCubit(),
      seed: () => CounterState(countValue: 43),
      act: (cubit) => cubit.decrement(),
      expect: () => <CounterState>[
        CounterState(countValue: 42),
      ],
    );
  });
}
