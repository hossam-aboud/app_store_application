import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../coumpanent/alert.dart';
import '../homeworkpage/homeworkpage.dart';

class HomeWork extends StatefulWidget {
  HomeWork({Key? key}) : super(key: key);

  @override
  State<HomeWork> createState() => _HomeWorkState();
}

class _HomeWorkState extends State<HomeWork> {
  @override
  Widget build(BuildContext context) {
    // userRef.where("UserId",isEqualTo: FirebaseAuth.instance.currentUser?.uid)
    Query<Map<String, dynamic>> userRefHomeWork =
        FirebaseFirestore.instance.collection("users");
    CollectionReference userRef =
        FirebaseFirestore.instance.collection("Notes");
    var stId = FirebaseAuth.instance.currentUser?.uid;
    getUser() {
      var user = FirebaseAuth.instance.currentUser!.email;
      print(user);
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("homepage");
              },
              icon: const Icon(Icons.arrow_back))
        ],
        centerTitle: true,
        title: const Text(
          'الملاحظات',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
          child: FutureBuilder(
              future: userRefHomeWork
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
                                    fontSize: 20, fontWeight: FontWeight.bold),
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
                                    fontSize: 20, fontWeight: FontWeight.bold),
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
                                "الأكل و النوم",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
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
                                    fontSize: 20, fontWeight: FontWeight.bold),
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
                                    fontSize: 20, fontWeight: FontWeight.bold),
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
                                    fontSize: 20, fontWeight: FontWeight.bold),
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
                                    fontSize: 20, fontWeight: FontWeight.bold),
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
                                    fontSize: 20, fontWeight: FontWeight.bold),
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
      body: ListView(
        children: [
          StreamBuilder(
              stream: userRef.where("UserId", isEqualTo: "All").orderBy('Date', descending: true)
                .snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return const Text("Error");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    height: 1,
                  );
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: ((context, index) {
                        return ListHomework(
                          listhomework: snapshot.data.docs[index],
                          docid: snapshot.data.docs[index].id,
                        );
                      }));
                }
                return Text("Loading");
              }),
          StreamBuilder(
              stream: userRef
                  .where("UserId",
                      isEqualTo: FirebaseAuth.instance.currentUser?.email)
                  .orderBy('Date', descending: true)
                .snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return const Text("Error");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: ((context, index) {
                        return ListHomework(
                          listhomework: snapshot.data.docs[index],
                          docid: snapshot.data.docs[index].id,
                        );
                      }));
                }
                return Text("Loading");
              }),
        ],
      ),
    );
  }
}

class ListHomework extends StatelessWidget {
  final listhomework;
  final docid;

  const ListHomework({Key? key, this.listhomework, this.docid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Card(
          margin: const EdgeInsets.symmetric(vertical: 10),
          shadowColor: const Color.fromARGB(255, 167, 166, 164),
          elevation: 10,
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Image.asset(
                    'images/req.png',
                    height: 50,
                    width: 50,
                  )),
              Expanded(
                flex: 3,
                child: ListTile(
                  trailing: IconButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return HomeWork_Page(
                            listhomework: listhomework,
                          );
                        }));
                      },
                      icon: const Icon(Icons.remove_red_eye)),
                  title:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${listhomework['title']}"),
                    Text("${listhomework['UserId']}",style:const TextStyle(color: Color.fromARGB(255, 104, 102, 102)),),

                  ],
                ),
                  subtitle: Text(
                     formattedData(listhomework['Date']),
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          )),
    ]);
  }
}
