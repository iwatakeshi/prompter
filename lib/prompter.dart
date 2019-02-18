import 'package:prompter/src/option.dart';
import 'package:prompter/src/terminal.dart';
export 'package:prompter/src/option.dart';

class Prompter {
  final _terminal = const Terminal();
  
  void _prompt() => _terminal.print("> ");

  void _prompt_question(String question, bool binary) {
    _terminal.clear();
    _terminal.println(binary ? "${question} [Y/n]" :question);
  }

  void _prompt_options(List<Option> options) {
    options
    .asMap()
    .forEach(
      (index, option) => 
        _terminal.println("${index + 1}) ${option.label}")
    );
  }

  String _ask(String question, List<Option> options, bool binary) {
    _prompt_question(question, binary);
    _prompt_options(options);
    _prompt();
    return _terminal.readln();
  }

  bool binary(String question) {
    final response = _ask(question, [], true);
    return response.toLowerCase().contains("y");
  }

  dynamic choice(String question, List<Option> options) {
    final response = _ask(question, options, false);
    try {
      return options[int.parse(response) - 1].value;
    } catch (_) {
      return choice(question, options);
    }
  }  
}