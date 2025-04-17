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
  final $lineInfo = '@${$lines[1].replaceAll('#1      ', '')}';
  String $mode = _isInDebugMode ? 'DEBUG' : 'RELEASE';
  String $json = ($x is String) ? '`${$x}`' : '${$x}';
  if ($title == null) {
    print('[${$mode}] ${$lineInfo}\n${$json}');
  } else {
    print('[${$mode}] ${$lineInfo}\n${$title} ==> ${$json}');
  }
}
