import 'dart:io' show Platform, stdout, stdin;

class Terminal {

  const Terminal();

  String readln() {
    return stdin.readLineSync();
  }

  void println(Object input) {
    stdout.writeln(input);
  }

  void print(Object input) {
    stdout.write(input);
  }

  void clear() {
    if (Platform.isWindows) {
      stdout.write("\x1B[2J\x1B[0f");
    } else {
      stdout.write("\x1B[2J\x1B[3J\x1B[H");
    }
  }
}