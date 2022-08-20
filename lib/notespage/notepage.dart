import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotePage extends StatefulWidget {
  final notes;
  NotePage({Key? key, this.notes}) : super(key: key);

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('NotePage'),
        ),
        body: ListView(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                "${widget.notes['title']}",
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
              margin: const EdgeInsets.only(
                  top: 20, left: 20, right: 20, bottom: 20),
              child: Column(
                children: [
                  Text(
                    "${widget.notes['body']}",
                    style: const TextStyle(
                        height: 1.8,
                        fontSize: 20,
                        color: Color.fromARGB(255, 53, 50, 50)),
                  ),
                  Image.network('${widget.notes['ImageUrl']}')
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
          ]),
        ]));
  }
}
