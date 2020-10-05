import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum NoteMode { Edditing, Adding }

class Note extends StatelessWidget {
  final NoteMode _noteMode;
  Note(this._noteMode);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_noteMode == NoteMode.Adding ? 'Add note' : 'Edit note '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Note title'),
            ),
            Container(height: 10),
            TextField(
              decoration: InputDecoration(hintText: 'Note text'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _NoteButton('Save', Colors.orange, () {
                  Navigator.pop(context);
                }),
                _noteMode == NoteMode.Adding
                    ? SizedBox(
                        width: 15,
                      )
                    : SizedBox(
                        width: 10,
                      ),
                _NoteButton('Discard', Colors.grey, () {
                  Navigator.pop(context);
                }),
                _noteMode == NoteMode.Adding
                    ? SizedBox(
                        width: 15,
                      )
                    : SizedBox(
                        width: 10,
                      ),
                _noteMode == NoteMode.Edditing
                    ? _NoteButton('Delete', Colors.redAccent, () {
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
