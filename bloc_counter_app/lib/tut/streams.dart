Stream<int> generateNumbers(int count) async* {
  for (int i = 0; i < count; i++) {
    await Future.delayed(const Duration(seconds: 2));
    yield i;
  }
}

void main() {
  Stream<int> numbers = generateNumbers(5);

  numbers.listen((event) {
    print('Recieved value of $event');
  });
}
