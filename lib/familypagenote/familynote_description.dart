import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Note_Description extends StatefulWidget {
  final familycard;
  Note_Description({Key? key, this.familycard}) : super(key: key);

  @override
  State<Note_Description> createState() => _Note_DescriptionState();
}

class _Note_DescriptionState extends State<Note_Description> {
  @override
  Widget build(BuildContext context) {
    CollectionReference userRef =
        FirebaseFirestore.instance.collection("Family_Note");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('تعليق الأهل'),
      ),
      body: ListView(children: [
        Column(children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Text(
              "${widget.familycard['Title']}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color.fromARGB(255, 43, 42, 35),
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            // color: Colors.yellow[200],
            padding: const EdgeInsets.all(20),
            margin:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
            child: Column(
              children: [
                Text(
                  "${widget.familycard['Notes']}",
                  style: const TextStyle(
                      height: 1.8,
                      fontSize: 20,
                      color: Color.fromARGB(255, 53, 50, 50)),
                ),
                widget.familycard['ImageUrl'] == null
                ? Container(height: 1)
                : Image.network('${widget.familycard['ImageUrl']}'),
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.yellow[200],
                border: Border.all(
                  width: 1,
                  color: const Color.fromARGB(255, 255, 245, 157),
                ),
                borderRadius: BorderRadius.circular(20)),
          ),
     
        ])
      ]),
    );
  }
}
