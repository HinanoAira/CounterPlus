import 'counter.dart';
import 'counters_state.dart';
import 'package:state_notifier/state_notifier.dart';

class CountersViewModel extends StateNotifier<CountersState> {
  CountersViewModel() : super(CountersState.load());

  void save() {
    state.save();
  }

  void createCouter(String title) {
    final id = state.countersList.length + 1;
    final newList = [...state.countersList, Counter(id, title, 0)];
    state = state.copyWith(countersList: newList);
  }

  void increment(int id) {
    final newList = state.countersList
        .map((e) => e.id == id ? Counter(e.id, e.title, e.count + 1) : e)
        .toList();
    state = state.copyWith(countersList: newList);
  }

  void decrement(int id) {
    final newList = state.countersList
        .map((e) => e.id == id ? Counter(e.id, e.title, e.count - 1) : e)
        .toList();
    state = state.copyWith(countersList: newList);
  }

  void reset(int id) {
    final newList = state.countersList
        .map((e) => e.id == id ? Counter(e.id, e.title, 0) : e)
        .toList();
    state = state.copyWith(countersList: newList);
  }

  void set(int id, int count) {
    final newList = state.countersList
        .map((e) => e.id == id ? Counter(e.id, e.title, count) : e)
        .toList();
    state = state.copyWith(countersList: newList);
  }

  void changeTitle(int id, String title) {
    final newList = state.countersList
        .map((e) => e.id == id ? Counter(e.id, title, e.count) : e)
        .toList();
    state = state.copyWith(countersList: newList);
  }

  void deleteCounter(int id) {
    final newList = state.countersList.where((e) => e.id != id).toList();
    state = state.copyWith(countersList: newList);
  }
}
