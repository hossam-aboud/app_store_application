import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

var refstorge = FirebaseStorage.instance.ref("Multiple_images");
CollectionReference imageRef =
    FirebaseFirestore.instance.collection('imageURLs');

class Events extends StatefulWidget {
  Events({Key? key}) : super(key: key);

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  CollectionReference imageRef =
      FirebaseFirestore.instance.collection("imageURLs");
  CollectionReference userRef = FirebaseFirestore.instance.collection("users");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("homepage");
                },
                icon: const Icon(Icons.arrow_back))
          ],
          title: const Text(
            'الفعاليات',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        drawer: Drawer(
            child: FutureBuilder(
                future: userRef
                    .where("email",
                        isEqualTo: FirebaseAuth.instance.currentUser?.email)
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
                                  Navigator.of(context).pushNamed("events");
                                },
                                title: const Text(
                                  "الفعاليات",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                leading: Image.asset(
                                  "images/events.png",
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
        body: StreamBuilder(
          stream: imageRef.snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return const Text("Error");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading.....");
            }
            if (snapshot.hasData) {
              return GridView.builder(
                itemCount: snapshot.data.docs.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.all(3),
                    child: FadeInImage.memoryNetwork(
                        fit: BoxFit.cover,
                        placeholder: kTransparentImage,
                        image: snapshot.data.docs[index].get('url')),
                  );
                },
              );
            }
            return const Text("Loading");
          },
        ));
  }
}
