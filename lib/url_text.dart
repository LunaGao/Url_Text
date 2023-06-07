library url_text;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Url & Text mix Widget
class UrlText extends StatelessWidget {
  static const TextStyle defaultStyle = TextStyle(color: Colors.black);
  static const TextStyle defaultUrlStyle = TextStyle(color: Colors.blue);

  /// The Url and Text mix String
  final String text;

  /// The Text style
  final TextStyle style;

  /// The Url style
  final TextStyle urlStyle;

  /// Using Markdown link style
  final bool markdown;

  /// Create a UrlText widget.
  UrlText(
    this.text, {
    this.style = defaultStyle,
    this.urlStyle = defaultUrlStyle,
    this.markdown = false,
  });

  List<InlineSpan> _getUrlTextSpans() {
    List<InlineSpan> widgets = [];
    RegExp reg = RegExp(
        r"(https?|ftp|file)://[-A-Za-z0-9+&@#/%?=~_|!:,.;]+[-A-Za-z0-9+&@#/%=~_|]*");
    Iterable<Match> _matches = reg.allMatches(text);
    List<_ResultMatch> resultMatches = [];
    int start = 0;
    for (Match match in _matches) {
      if (match.group(0)!.isNotEmpty) {
        if (start != match.start) {
          _ResultMatch result1 = _ResultMatch();
          result1.isUrl = false;
          result1.text = text.substring(start, match.start);
          result1.link = '';
          resultMatches.add(result1);
        }

        _ResultMatch result2 = _ResultMatch();
        result2.isUrl = true;
        result2.text = match.group(0)!;
        result2.link = match.group(0)!;
        resultMatches.add(result2);
        start = match.end;
      }
    }
    if (start < text.length) {
      _ResultMatch result1 = _ResultMatch();
      result1.isUrl = false;
      result1.text = text.substring(start);
      result1.link = text.substring(start);
      resultMatches.add(result1);
    }
    for (var result in resultMatches) {
      if (result.isUrl) {
        widgets.add(_LinkTextSpan(
          result.text,
          result.text,
          urlStyle,
        ));
      } else {
        widgets.add(TextSpan(
          text: result.text,
          style: style,
        ));
      }
    }
    return widgets;
  }

  List<InlineSpan> _getMarkdownUrlTextSpans() {
    List<InlineSpan> widgets = [];
    RegExp reg = RegExp(
        r"\[([^\[]*)\]\(((https?|ftp|file)://[-A-Za-z0-9+&@#/%?=~_|!:,.;]+[-A-Za-z0-9+&@#/%=~_|]*)\)");
    Iterable<Match> _matches = reg.allMatches(text);
    List<_ResultMatch> resultMatches = [];
    int start = 0;
    for (Match match in _matches) {
      if (match.group(0)!.isNotEmpty) {
        if (start != match.start) {
          _ResultMatch result1 = _ResultMatch();
          result1.isUrl = false;
          result1.text = text.substring(start, match.start);
          result1.link = '';
          resultMatches.add(result1);
        }

        _ResultMatch result2 = _ResultMatch();
        result2.isUrl = true;
        result2.text = match.group(1)!;
        result2.link = match.group(2)!;
        print(result2.link);
        resultMatches.add(result2);
        start = match.end;
      }
    }
    if (start < text.length) {
      _ResultMatch result1 = _ResultMatch();
      result1.isUrl = false;
      result1.text = text.substring(start);
      result1.link = '';
      resultMatches.add(result1);
    }
    for (var result in resultMatches) {
      if (result.isUrl) {
        widgets.add(_LinkTextSpan(
          result.text,
          result.link,
          urlStyle,
        ));
      } else {
        widgets.add(TextSpan(
          text: result.text,
          style: style,
        ));
      }
    }
    return widgets;
  }

  List<InlineSpan> _getTextSpans() {
    if (markdown) {
      return _getMarkdownUrlTextSpans();
    } else {
      return _getUrlTextSpans();
    }
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: _getTextSpans()),
    );
  }
}

class _LinkTextSpan extends TextSpan {
  _LinkTextSpan(String text, String link, TextStyle style)
      : super(
            style: style,
            text: text,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                launchUrl(Uri.parse(link));
              });
}

class _ResultMatch {
  late bool isUrl;
  late String text;
  late String link;
}
