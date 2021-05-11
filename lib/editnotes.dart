import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Editnote extends StatefulWidget {
  final QueryDocumentSnapshot doctoedit;

  Editnote({this.doctoedit});

  @override
  _EditnoteState createState() => _EditnoteState();
}

class _EditnoteState extends State<Editnote> {
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();

  @override
  @override
  void initState() {
    super.initState();
    title = TextEditingController(text: widget.doctoedit.data()['title']);
    body = TextEditingController(text: widget.doctoedit.data()['body']);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(
          "Edit note",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          FlatButton(
            child: Text(
              "Save",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            onPressed: () {
              widget.doctoedit.reference.update({
                'title': title.text,
                'body': body.text,
              }).whenComplete(() => Navigator.pop(context));
            },
          ),
          FlatButton(
            child: Text(
              "Delete",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            onPressed: () {
              widget.doctoedit.reference
                  .delete()
                  .whenComplete(() => Navigator.pop(context));
            },
          )
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 10, color: Colors.grey[900]),
              color: Colors.pink[200],
            ),
            height: 100,
            child: TextField(
              controller: title,
              decoration: InputDecoration(
                hintText: "Title",
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 10, color: Colors.grey[900]),
                color: Colors.pink[100],
              ),
              height: 100,
              child: TextField(
                controller: body,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  hintText: "Body",
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
