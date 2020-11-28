import 'package:flutter/material.dart';
import 'package:note_app/inherited_widgets/note_inherited_widget.dart';
import 'package:note_app/note.dart';

class NoteList extends StatefulWidget {
  @override
  NoteListState createState() {
    return new NoteListState();
  }
}

class NoteListState extends State<NoteList> {
  List<Map<String, String>> get _notes => NoteInheritedWidget.of(context).notes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('NoteApp'),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Note(NoteMode.Edditing, index)));
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 30, bottom: 30, left: 13, right: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _NoteTitle(_notes[index]['title']),
                  Container(
                    height: 5,
                  ),
                  _NoteText(_notes[index]['text']),
                ],
              ),
            ),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Note(NoteMode.Adding, null)));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.orangeAccent,
      ),
    );
  }
}

class _NoteText extends StatelessWidget {
  final String _text;

  _NoteText(this._text);
  @override
  Widget build(BuildContext context) {
    return Text(
      'Some text',
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _NoteTitle extends StatelessWidget {
  final String _title;

  _NoteTitle(this._title);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Some title',
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
