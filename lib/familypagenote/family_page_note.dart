import 'dart:io';
import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import "package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';

import '../coumpanent/alert.dart';

class family_page_note extends StatefulWidget {
  family_page_note({Key? key}) : super(key: key);

  @override
  State<family_page_note> createState() => _family_page_noteState();
}

class _family_page_noteState extends State<family_page_note> {
  CollectionReference familynoteRef =
      FirebaseFirestore.instance.collection("Family_Note");

  File? file;
  Reference? ref;
  var title, note, imageurl, date;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  addnotes(context) async {
    if (file == null) {
      var formdata = formstate.currentState;
      if (formdata!.validate()) {
        showLoading(context);
        formdata.save();
        await ref?.putFile(file!);
        await familynoteRef.add({
          "Title": title,
          "Notes": note,
          "ImageUrl": null,
          "date": DateTime.now(),
          "UserId": FirebaseAuth.instance.currentUser?.uid,
          "UserNamed": FirebaseAuth.instance.currentUser?.email,
        }).then((value) {
          Navigator.of(context).pushNamed("family");
        }).catchError((e) {
          print("$e");
        });
      }
    } else {
      var formdata = formstate.currentState;
      if (formdata!.validate()) {
        formdata.save();
        showLoading(context);
        await ref?.putFile(file!);
        imageurl = await ref?.getDownloadURL();

        await familynoteRef.add({
          "Title": title,
          "Notes": note,
          "ImageUrl": imageurl,
          "date": DateTime.now(),
          "UserId": FirebaseAuth.instance.currentUser?.uid,
          "UserNamed": FirebaseAuth.instance.currentUser?.email,
        }).then((value) {
          Navigator.of(context).pushNamed("family");
        }).catchError((e) {
          print("$e");
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'إضافة تعليق',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(children: [
          Form(
            key: formstate,
            child: Column(
              children: [
                TextFormField(
                  validator: (val) {
                    if (val!.length > 30) {
                      return "Title can't be larger than 30";
                    }
                    if (val.length < 2) {
                      return "Title can't be Shorter than 2 ";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    title = val;
                  },
                  maxLength: 40,
                  decoration: const InputDecoration(
                      labelText: "Note Title",
                      prefixIcon: Icon(Icons.note_add_outlined),
                      filled: true,
                      fillColor: Colors.white),
                ),
                TextFormField(
                  validator: (val) {
                    if (val!.length > 255) {
                      return "Note can't be larger than 255";
                    }
                    if (val.length < 5) {
                      return "Note can't be Shorter than 5";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    note = val;
                  },
                  minLines: 1,
                  maxLines: 10,
                  maxLength: 200,
                  decoration: const InputDecoration(
                      labelText: "Notes",
                      prefixIcon: Icon(Icons.note_add_outlined),
                      filled: true,
                      fillColor: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        ShowBottomSheet(context);
                      },
                      icon: const Icon(Icons.add_photo_alternate_outlined),
                      iconSize: 40,
                      color: Colors.pink,
                    ),
                    IconButton(
                      //add note
                      onPressed: () async {
                        await addnotes(context);
                      },
                      icon: const Icon(Icons.send),
                      iconSize: 40,
                      color: Colors.pink,
                    ),
                  ],
                )
              ],
            ),
          )
        ]));
  }

  ShowBottomSheet(context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(10),
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Chosse The place of Image",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.pink,
                      fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () async {
                    var picked = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (picked != null) {
                      file = File(picked.path);
                      var rand = Random().nextInt(1000000);
                      var imagesName = "$rand" + basename(picked.path);
                      ref = FirebaseStorage.instance
                          .ref("images")
                          .child("$imagesName");
                      Navigator.of(context).pop();
                    }
                  },
                  child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.image_outlined,
                            size: 30,
                            color: Colors.pink,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "From Gallery",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                ),
                InkWell(
                  onTap: () async {
                    var picked = await ImagePicker()
                        .pickImage(source: ImageSource.camera);
                    if (picked != null) {
                      file = File(picked.path);
                      var rand = Random().nextInt(1000000);
                      var imagesName = "$rand" + basename(picked.path);
                      ref = FirebaseStorage.instance
                          .ref("images")
                          .child("$imagesName");
                      Navigator.of(context).pop();
                    }
                  },
                  child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.camera,
                            size: 30,
                            color: Colors.pink,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "From Camera",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          );
        });
  }
}
