import 'dart:core';
import 'dart:convert' as convert;

bool get _isInDebugMode {
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

List<String> _textToLines(String $s) {
  const $splitter = convert.LineSplitter();
  final $lines = $splitter.convert($s);
  return $lines;
}

void echo(dynamic $x, [String? $title]) {
  String $json = ($x is String) ? '`${$x}`' : '${$x}';
  if ($title == null) {
    print($json);
  } else {
    print('${$title} ==> ${$json}');
  }
}

void dump(dynamic $x, [String? $title]) {
  final $lines = _textToLines(StackTrace.current.toString());
  String $line = '';
  for (int i=0; i<$lines.length; i++) {
    if ($lines[i].contains('output/output.dart')) {
      $line = $lines[i + 1];
      break;
    }
  }
  if ($line.startsWith('#')) {
    final $reg = RegExp(r'#[0-9]+[ ]+');
    $line = $line.replaceFirst($reg, '');
  }
  final $lineInfo = '@ ${$line}';
  String $mode = _isInDebugMode ? 'DEBUG' : 'RELEASE';
  String $json = ($x is String) ? '`${$x}`' : '${$x}';
  if ($title == null) {
    print('[${$mode}] ${$lineInfo}\n${$json}');
  } else {
    print('[${$mode}] ${$lineInfo}\n${$title} ==> ${$json}');
  }
}
