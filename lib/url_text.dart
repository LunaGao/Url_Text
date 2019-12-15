library url_text;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlText extends StatelessWidget {
  final String text;

  UrlText(this.text);

  List<InlineSpan> getTextSpans() {
    List<InlineSpan> widgets = List<InlineSpan>();
    RegExp reg = RegExp(r"[.]*(www)?[.]*");
    Iterable<Match> _matches = reg.allMatches(text);
    List<_ResultMatch> resultMatches = List<_ResultMatch>();
    int start = 0;
    for (Match match in _matches) {
      print('start');
      if (match.group(0).isNotEmpty) {
        if (start != match.start) {
          _ResultMatch result1 = _ResultMatch();
          result1.isUrl = false;
          result1.text = text.substring(start, match.start);
          resultMatches.add(result1);
        }

        _ResultMatch result2 = _ResultMatch();
        result2.isUrl = true;
        result2.text = match.group(0);
        resultMatches.add(result2);
        start = match.end;
      }
      print('end');
    }
    if (start < text.length) {
      _ResultMatch result1 = _ResultMatch();
      result1.isUrl = false;
      result1.text = text.substring(start);
      resultMatches.add(result1);
    }
    for (var a in resultMatches) {
      if (a.isUrl) {
        widgets.add(
            _LinkTextSpan(text: a.text, style: TextStyle(color: Colors.blue)));
      } else {
        widgets
            .add(TextSpan(text: a.text, style: TextStyle(color: Colors.black)));
      }
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: getTextSpans()),
    );
  }
}

class _LinkTextSpan extends TextSpan {
  _LinkTextSpan({TextStyle style, String text})
      : super(
            style: style,
            text: text,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                launch(text);
              });
}

class _ResultMatch {
  bool isUrl;
  String text;
}
