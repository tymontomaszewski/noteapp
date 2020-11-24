import 'package:flutter/material.dart';
import 'package:note_app/inherited_widgets/note_inherited_widget.dart';
import 'notelist.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return NoteInheritedWidget(
          MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Notes',
        home: NoteList(),
      ),
    );
  }
}
