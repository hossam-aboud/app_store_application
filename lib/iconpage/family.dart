import 'dart:io';
import 'dart:math';
import 'package:babyzone4/coumpanent/alert.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../familypagenote/familynote_description.dart';

class Family extends StatefulWidget {
  Family({Key? key}) : super(key: key);

  @override
  State<Family> createState() => _FamilyState();
}

class _FamilyState extends State<Family> {
  @override
  Widget build(BuildContext context) {
    CollectionReference userRefdrawwer =
        FirebaseFirestore.instance.collection("users");
    Query<Map<String, dynamic>> userRef =
        FirebaseFirestore.instance.collection("Family_Note");
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("homepage");
                },
                icon: const Icon(Icons.arrow_back)),
          ],
          centerTitle: true,
          title: const Text(
            'تعليقات الأهل',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed("family_page_note");
          },
          child: Icon(Icons.add),
        ),
        drawer: Drawer(
            child: FutureBuilder(
                future: userRefdrawwer
                    .where(
                      "email",
                      isEqualTo: FirebaseAuth.instance.currentUser?.email,
                    )
                    .get(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, i) {
                          return Column(
                            children: [
                              UserAccountsDrawerHeader(
                                  currentAccountPicture: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      "${snapshot.data.docs[i].data()["ImageUrl"]}",
                                    ),
                                    radius: 150,
                                  ),
                                  accountName: Text(
                                      "${snapshot.data.docs[i].data()["full-name"]}"),
                                  accountEmail: Text(
                                      "${snapshot.data.docs[i].data()["email"]}")),
                              ListTile(
                                onTap: () {
                                  Navigator.of(context).pushNamed("profile");
                                },
                                title: const Text(
                                  "البيانات الشخصية ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                leading: Image.asset(
                                  "images/profile.png",
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                              ListTile(
                                onTap: () {
                                  Navigator.of(context).pushNamed("camera");
                                },
                                title: const Text(
                                  "الكاميرات",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                leading: Image.asset(
                                  "images/camera.png",
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                              ListTile(
                                onTap: () {
                                  Navigator.of(context).pushNamed("notes");
                                },
                                title: const Text(
                                  "الأكل والنوم",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                leading: Image.asset(
                                  "images/boy1.png",
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                              ListTile(
                                onTap: () {
                                  Navigator.of(context).pushNamed("requirment");
                                },
                                title: const Text(
                                  "الأنشطة",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                leading: Image.asset(
                                  "images/requirement.png",
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                              ListTile(
                                onTap: () {
                                  Navigator.of(context).pushNamed("family");
                                },
                                title: const Text(
                                  "تعليقات الأهل",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                leading: Image.asset(
                                  "images/family.png",
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                              ListTile(
                                onTap: () {
                                  Navigator.of(context).pushNamed("homework");
                                },
                                title: const Text(
                                  "الملاحظات",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                leading: Image.asset(
                                  "images/note.png",
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                              ListTile(
                                onTap: () {
                                  Navigator.of(context).pushNamed("budget");
                                },
                                title: const Text(
                                  "الكشف المالي ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                leading: Image.asset(
                                  "images/budget.png",
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                              ListTile(
                                onTap: () {
                                  Navigator.of(context).pushNamed("chat");
                                },
                                title: const Text(
                                  "تواصل معنا",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                leading: Image.asset(
                                  "images/chat.png",
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                              ListTile(
                                onTap: () async {
                                  await FirebaseAuth.instance.signOut();
                                  Navigator.of(context)
                                      .pushReplacementNamed("login");
                                },
                                title: const Text(
                                  "تسجيل الخروج",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                leading: const Icon(
                                  Icons.logout,
                                  size: 40,
                                  color: Colors.red,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.facebook,
                                    size: 40,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.whatsapp,
                                    size: 40,
                                  )
                                ],
                              )
                            ],
                          );
                        });
                  }
                  if (snapshot.hasError) {
                    return Text("Error");
                  }
                  return CircularProgressIndicator();
                })),
        body: StreamBuilder<QuerySnapshot>(
            stream: userRef
                .where("UserNamed",
                    isEqualTo: FirebaseAuth.instance.currentUser?.email).orderBy('date', descending: true)
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: ((context, index) {
                      return ListFamily(
                        Familycard: snapshot.data.docs[index],
                        docid: snapshot.data.docs[index].id,
                      );
                    }));
              }

              if (snapshot.hasError) {
                return const Text("Error");
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}

class ListFamily extends StatelessWidget {
  final Familycard;
  final docid;
  const ListFamily({Key? key, this.Familycard, this.docid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.symmetric(vertical: 10),
        shadowColor: const Color.fromARGB(255, 167, 166, 164),
        elevation: 10,
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Familycard['ImageUrl'] == null
                      ? Image.asset(
                          "images/people.png",
                          height: 50,
                          width: 50,
                        )
                      : Image.network(
                          '${Familycard['ImageUrl']}',
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                )),
            Expanded(
              flex: 3,
              child: ListTile(
                trailing: IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return Note_Description(
                          familycard: Familycard,
                        );
                      }));
                    },
                    icon: const Icon(Icons.remove_red_eye)),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${Familycard['Title']}"),
                    Text("${Familycard['UserNamed']}",style:const TextStyle(color: Color.fromARGB(255, 104, 102, 102)),),

                  ],
                ),
                subtitle: Text(
                  // "${Familycard['date']}",
                  formattedData(Familycard['date']),
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ));
  }
}
