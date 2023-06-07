import 'package:flutter/material.dart';
import 'package:url_text/url_text.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              UrlText(
                'This is the demo image of Url_text, Which you can click https://www.google.com to jump to Google.',
              ),
              SizedBox(
                height: 20,
              ),
              UrlText(
                'You can change the TextStyle for Url. It looks like this: https://www.google.com .',
                urlStyle: TextStyle(color: Colors.red, fontSize: 20.0),
              ),
              SizedBox(
                height: 20,
              ),
              UrlText(
                'Or you can change the TextStyle for normal text. It looks like this: https://www.google.com .',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              UrlText(
                'Sure, Of course you can change all of them. Looks like this: https://www.google.com .',
                urlStyle: TextStyle(
                    color: Colors.purple,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w800),
                style: TextStyle(color: Colors.pink),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "You can use markdown link to setup the link tilte, such as :  [This is Google Web](https://www.google.com)",
              ),
              UrlText(
                'It will look like this when the markdown sign is false: [This is Google Web](https://www.google.com)',
                urlStyle: TextStyle(
                    color: Colors.purple,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w800),
                style: TextStyle(color: Colors.pink),
                markdown: false,
              ),
              UrlText(
                'Then, the markdown sign is true, it will look like this: [This is Google Web](https://www.google.com).',
                urlStyle: TextStyle(
                    color: Colors.purple,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w800),
                style: TextStyle(color: Colors.pink),
                markdown: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
