import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//  var fbm = FirebaseMessaging.instance;

  List users = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fbm.getToken().then((token) {
    //   print("============   token   ==========");
    //   print(token);
    //   print("==================================");
    //
    //   FirebaseMessaging.onMessage.listen((event) {
    //     // print("========= data Notification =================");
    //     // print("${event.notification?.body}");
    //     // print("=======================================");
    //     //   AwesomeDialog(
    //     //           context: context,
    //     //           title: "title",
    //     //           body: Text("${event.notification?.body}"))
    //     //       .show();
    //
    //     Navigator.of(context).pushNamed("camera1");
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference userRef =
        FirebaseFirestore.instance.collection("users");
    getUser() {
      var user = FirebaseAuth.instance.currentUser;
      print("=====================");
      print(user);
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Baby Zone'),
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
                                Navigator.of(context)
                                    .pushNamed("camera_management");
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
                                "الاكل و النوم",
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
      body: FutureBuilder(
        future: userRef
            .where("email", isEqualTo: FirebaseAuth.instance.currentUser?.email)
            .get(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return HomeList(
                  homelist: snapshot.data.docs[index],
                  docid: snapshot.data.docs[index].id,
                );
              },
            );
          }
          if (snapshot.hasError) {
            return const Text("Error");
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class HomeList extends StatelessWidget {
  final homelist;
  final docid;
  HomeList({Key? key, this.homelist, this.docid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 146, 216, 201),
                  border: Border.all(
                    width: 1,
                    color: const Color.fromARGB(255, 146, 216, 201),
                  ),
                  borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              width: double.infinity,
              height: 180,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "مرحبا بكم ",
                    style: TextStyle(fontSize: 35),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        " : ولي أمر الطفل ",
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(
                        "${homelist["full-name"]}",
                        style:
                            const TextStyle(fontSize: 30, color: Colors.pink),
                      ),
                    ],
                  )
                ],
              )),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 227, 247, 228),
                  border: Border.all(
                    width: 1,
                    color: Color.fromARGB(255, 227, 247, 228),
                  ),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(children: [
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    // color: Colors.blue[100],
                    height: 120,
                    width: 120,
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("camera_management");
                        },
                        icon: Image.asset("images/camera.png"))),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("camera_management");
                  },
                  child: const Text(
                    "الكاميرات",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                )
              ]),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 227, 247, 228),
                  border: Border.all(
                    width: 1,
                    color: const Color.fromARGB(255, 227, 247, 228),
                  ),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("profile");
                      },
                      icon: Image.asset("images/profile.png")),
                  // color: Colors.blue[100],
                  height: 120,
                  width: 120,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("profile");
                  },
                  child: const Text(
                    "البيانات الشخصية",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ]),
            ),
          ]),
          const SizedBox(
            height: 5,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 227, 247, 228),
                  border: Border.all(
                    width: 1,
                    color: const Color.fromARGB(255, 227, 247, 228),
                  ),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(children: [
                Container(
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("requirment");
                      },
                      icon: Image.asset("images/requirement.png")),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  // color: Colors.blue[100],
                  height: 120,
                  width: 120,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("requirment");
                  },
                  child: const Text(
                    "الأنشطة",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                )
              ]),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 227, 247, 228),
                  border: Border.all(
                    width: 1,
                    color: const Color.fromARGB(255, 227, 247, 228),
                  ),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(children: [
                Container(
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("notes");
                      },
                      icon: Image.asset("images/boy1.png")),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  // color: Colors.blue[100],
                  height: 120,
                  width: 120,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("notes");
                  },
                  child: const Text(
                    "الأكل و النوم",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                )
              ]),
            ),
          ]),
          const SizedBox(
            height: 5,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 227, 247, 228),
                  border: Border.all(
                    width: 1,
                    color: const Color.fromARGB(255, 227, 247, 228),
                  ),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(children: [
                Container(
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("homework");
                      },
                      icon: Image.asset("images/note.png")),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  // color: Colors.blue[100],
                  height: 120,
                  width: 120,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("homework");
                  },
                  child: const Text(
                    "الملاحظات",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                )
              ]),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 227, 247, 228),
                  border: Border.all(
                    width: 1,
                    color: const Color.fromARGB(255, 227, 247, 228),
                  ),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(children: [
                Container(
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("family");
                      },
                      icon: Image.asset("images/family.png")),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  // color: Colors.blue[100],
                  height: 120,
                  width: 120,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("family");
                  },
                  child: const Text(
                    "تعليقات الاهل",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                )
              ]),
            ),
          ]),
          const SizedBox(
            height: 5,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 227, 247, 228),
                  border: Border.all(
                    width: 1,
                    color: const Color.fromARGB(255, 227, 247, 228),
                  ),
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 227, 247, 228),
                    border: Border.all(
                      width: 1,
                      color: const Color.fromARGB(255, 227, 247, 228),
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(children: [
                  Container(
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("budget");
                        },
                        icon: Image.asset("images/budget.png")),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    // color: Colors.blue[100],
                    height: 120,
                    width: 120,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("budget");
                    },
                    child: const Text(
                      "الكشف المالي",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                  )
                ]),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 227, 247, 228),
                  border: Border.all(
                    width: 1,
                    color: const Color.fromARGB(255, 227, 247, 228),
                  ),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(children: [
                Container(
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("events");
                      },
                      icon: Image.asset("images/events.png")),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  // color: Colors.blue[100],
                  height: 120,
                  width: 120,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("events");
                  },
                  child: const Text(
                    "الفعاليات",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                )
              ]),
            ),
          ]),
          const SizedBox(
            height: 5,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 227, 247, 228),
                  border: Border.all(
                    width: 1,
                    color: const Color.fromARGB(255, 227, 247, 228),
                  ),
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 227, 247, 228),
                    border: Border.all(
                      width: 1,
                      color: const Color.fromARGB(255, 227, 247, 228),
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(children: [
                  Container(
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("aboutus");
                        },
                        icon: Image.asset("images/info.png")),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    // color: Colors.blue[100],
                    height: 120,
                    width: 120,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("aboutus");
                    },
                    child: const Text(
                      "من نحن",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                  )
                ]),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 227, 247, 228),
                  border: Border.all(
                    width: 1,
                    color: const Color.fromARGB(255, 227, 247, 228),
                  ),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(children: [
                Container(
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("chat");
                      },
                      icon: Image.asset("images/chat.png")),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  // color: Colors.blue[100],
                  height: 120,
                  width: 120,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("chat");
                  },
                  child: const Text(
                    "تواصل معنا",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                )
              ]),
            ),
          ]),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
