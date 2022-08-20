import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeWork_Page extends StatefulWidget {
  final listhomework;
  HomeWork_Page({Key? key, this.listhomework}) : super(key: key);

  @override
  State<HomeWork_Page> createState() => _HomeWork_PageState();
}

class _HomeWork_PageState extends State<HomeWork_Page> {
  @override
  Widget build(BuildContext context) {
    CollectionReference userRef =
        FirebaseFirestore.instance.collection("Homework");
    return Scaffold(
        appBar: AppBar(
          title: const Text("الملاحظات"),
        ),
        body: ListView(children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Text(
                  "${widget.listhomework['title']}",
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
                padding: EdgeInsets.all(20),
                margin: const EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: 20),
                child: Text(
                  "${widget.listhomework['body']}",
                  style: const TextStyle(
                      height: 1.8,
                      fontSize: 20,
                      color: Color.fromARGB(255, 53, 50, 50)),
                ),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 154, 242, 253),
                    border: Border.all(
                      width: 1,
                      color: const Color.fromARGB(255, 154, 242, 253),
                    ),
                    borderRadius: BorderRadius.circular(20)),
              ),
              Container(
                // color: Colors.yellow[200],
                margin: const EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: 20),
                child: widget.listhomework['ImageUrl'] == "null"
                    ? Container(
                        height: 1,
                      )
                    : Image.network('${widget.listhomework['ImageUrl']}'),
              ),
            ],
          ),
        ]));
  }
}
