import 'dart:core';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String res = await task2();
  task3(res);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async {
  Duration duration = Duration(seconds: 3);
  String res;
  await Future.delayed(duration, () {
    res = 'safasd';
  });
  return res;
}

void task3(String data) async {
  String result = 'task 3 data';
  print('Task 3 complete');
  print(data);
}
