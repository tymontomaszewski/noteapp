import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'inherited_widgets/note_inherited_widget.dart';

enum NoteMode { Edditing, Adding }

class Note extends StatefulWidget {
  final NoteMode noteMode;
  final int index;

  Note(this.noteMode, this.index);

  @override
  NoteState createState() => NoteState();
}

class NoteState extends State<Note> {
  final TextEditingController _titleControler = TextEditingController();
  final TextEditingController _textControler = TextEditingController();

  List<Map<String, String>> get _notes => NoteInheritedWidget.of(context).notes;

  @override
  void didChangeDependencies() {
    if (widget.noteMode == NoteMode.Edditing) {
      _titleControler.text = _notes[widget.index]['title'];
      _textControler.text = _notes[widget.index]['text'];
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.noteMode == NoteMode.Adding ? 'Add note' : 'Edit note '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _titleControler,
              decoration: InputDecoration(hintText: 'Note title'),
            ),
            Container(height: 10),
            TextField(
              controller: _textControler,
              decoration: InputDecoration(hintText: 'Note text'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _NoteButton('Save', Colors.orange, () {
                  final title = _titleControler.text;
                  final text = _textControler.text;

                  if (widget?.noteMode == NoteMode.Adding) {
                    _notes.add({'title': title, 'text': text});
                  } else if (widget?.noteMode == NoteMode.Edditing) {
                    _notes[widget.index] = {'title': title, 'text': text};
                  }
                  Navigator.pop(context);
                }),
                widget.noteMode == NoteMode.Adding
                    ? SizedBox(
                        width: 15,
                      )
                    : SizedBox(
                        width: 10,
                      ),
                _NoteButton('Discard', Colors.grey, () {
                  Navigator.pop(context);
                }),
                widget.noteMode == NoteMode.Adding
                    ? SizedBox(
                        width: 15,
                      )
                    : SizedBox(
                        width: 10,
                      ),
                widget.noteMode == NoteMode.Edditing
                    ? _NoteButton('Delete', Colors.redAccent, () {
                        _notes.removeAt(widget.index);
                        Navigator.pop(context);
                      })
                    : Container(),
                SizedBox(height: 15),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _NoteButton extends StatelessWidget {
  final String _text;
  final Color _color;
  final Function _onPressed;

  _NoteButton(this._text, this._color, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: _onPressed,
      child: Text(
        _text,
        style: TextStyle(color: Colors.white),
      ),
      color: _color,
      minWidth: 100,
      height: 40,
    );
  }
}
