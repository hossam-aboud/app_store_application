import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Event_page extends StatefulWidget {
  Event_page({Key? key}) : super(key: key);

  @override
  State<Event_page> createState() => _Event_pageState();
}

class _Event_pageState extends State<Event_page> {
  getImagesAndFolderName() async {
    var ref = await FirebaseStorage.instance
        .ref("images/child")
        .list(ListOptions(maxResults: 20));
    ref.items.forEach((element) {
      print("=======================");
      print(element.name);
      print(element.fullPath);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'صفحة الفعالية',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        height: double.infinity,
        child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              Container(
                  height: 220,
                  width: double.infinity,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, i) {
                        return Container(
                          margin: EdgeInsets.all(10),
                          height: 200,
                          width: 300,
                          decoration: const BoxDecoration(
                              color: Colors.black12,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        );
                      })),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, i) {
                    return Row(
                      children: [
                        Container(
                          height: 165,
                          width: 165,
                          margin: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              color: Colors.black12,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                        Container(
                          height: 165,
                          width: 165,
                          margin: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              color: Colors.black12,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        )
                      ],
                    );
                  }),
            ]),
      ),
    );
  }
}
