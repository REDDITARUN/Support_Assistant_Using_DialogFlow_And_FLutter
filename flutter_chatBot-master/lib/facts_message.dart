import 'package:flutter/material.dart';
import 'package:linkwell/linkwell.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:url_launcher/url_launcher.dart' show canLaunch, launch;

class Facts extends StatelessWidget {
  Facts({this.text, this.name, this.type});


  final String text;
  final String name;
  final bool type;

  List<Widget> botMessage(context) {
    return <Widget>[
      Container(
        margin: const EdgeInsets.only(right: 10.0),
       // child: CircleAvatar(child: Padding(
        //  padding: const EdgeInsets.all(5),
         // child: FlutterLogo(),
        //),
    child: CircleAvatar(child: new Text('M', style: TextStyle(color: Colors.white)), backgroundColor: Colors.black54, radius: 12,),
         // backgroundColor: Colors.grey[200], radius: 12,),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
//            Text(this.name,
//                style: TextStyle(fontWeight: FontWeight.bold)),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                    child: ParsedText(
                      selectable: true,
                      alignment: TextAlign.start,
                      text: text,
                        parse: <MatchText>[
                    MatchText(
                    type: ParsedType.EMAIL,
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 18,
                        ),
                        onTap: (url) {
                          launch("mailto:" + url);
                        }),
                  MatchText(
                      type: ParsedType.URL,
                      style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontSize: 18,
                      ),
                      onTap: (url) async {
                        var a = await canLaunch(url);

                        if (a) {
                          launch(url);
                        }
                      }),
  ],

            ),
                ),
    ),],
        ),
      ),
  ];
  }

  List<Widget> userMessage(context) {
    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
//            Text(this.name, style: Theme.of(context).textTheme.subhead),
            Card(
              color: Colors.teal[400],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(text, style: TextStyle(color: Colors.white),),
                )
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 10.0),
        child: CircleAvatar(child: new Text('You', style: TextStyle(color: Colors.white)), backgroundColor: Colors.blueGrey, radius: 19,),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type ? userMessage(context) : botMessage(context),
      ),
    );
  }
}