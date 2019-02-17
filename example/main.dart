import 'package:prompter/prompter.dart';
import 'package:prompter/src/option.dart';

main(List<String> arguments) {
  // print('Hello world: ${prompter.calculate()}!');
  final prompter = Prompter();
  var value = prompter.choice("What's you're favorite color?", [
    Option("It's red!", "#f00"),
    Option("It's blue!", "00f")
  ]);

  print(value);

  var value2 = prompter.binary("Do you like Dart?");
  print(value2);
}