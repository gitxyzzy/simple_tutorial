class Counter {
  int value = 0;

  final listeners = [];

  void addListener(void Function() l) {
    listeners.add(l);
    print('a listener was added');
    print(listeners);
  }

  void notifyListeners() {
    print('notifyListenrs was called');
    print(listeners);
    for (final listener in listeners) {
      listener();
    }
  }

  void removeListener(void Function() l) {
    int index = listeners.indexWhere((listener) => listener == l);
    if (index >= 0) {
      listeners.removeAt(index);
    }
  }

  void increment() {
    value++;
    notifyListeners();
  }
}
