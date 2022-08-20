import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Requirment_page extends StatefulWidget {
  final requirment;
  Requirment_page({Key? key, this.requirment}) : super(key: key);

  @override
  State<Requirment_page> createState() => _Requirment_pageState();
}

class _Requirment_pageState extends State<Requirment_page> {
  @override
  Widget build(BuildContext context) {
    CollectionReference userRef =
        FirebaseFirestore.instance.collection("Requirments");
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'صفحة المهمة',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Text(
                  "${widget.requirment['title']}",
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
                  "${widget.requirment['body']}",
                  style: const TextStyle(
                      height: 1.8,
                      fontSize: 20,
                      color: Color.fromARGB(255, 53, 50, 50)),
                ),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 245, 153, 229),
                    border: Border.all(
                      width: 1,
                      color: const Color.fromARGB(255, 245, 153, 229),
                    ),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ],
          ),
        ]));
  }
}
