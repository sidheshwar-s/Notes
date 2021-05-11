import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Addnote extends StatelessWidget {
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();
  CollectionReference ref = FirebaseFirestore.instance.collection('notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(
          "Add note",
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
              ref.add({
                'title': title.text,
                'body': body.text,
              }).whenComplete(() => Navigator.pop(context));
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
              color: Colors.purple[300],
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
                color: Colors.purple[200],
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
