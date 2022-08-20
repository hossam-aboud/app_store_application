import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference userRef =
        FirebaseFirestore.instance.collection("users");
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
            'البيانات الشخصية',
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
        body: FutureBuilder(
          future: userRef
              .where("email",
                  isEqualTo: FirebaseAuth.instance.currentUser?.email)
              .get(),
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
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          "${snapshot.data.docs[index].data()['ImageUrl']}",
                        ),
                        radius: 150,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Card(
                          shadowColor: const Color.fromARGB(255, 167, 166, 164),
                          elevation: 10,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Image.asset(
                                    'images/name.png',
                                    height: 50,
                                    width: 50,
                                  )),
                              Expanded(
                                flex: 3,
                                child: ListTile(
                                  title: const Text("Full Name"),
                                  subtitle: Text(
                                    "${snapshot.data.docs[index].data()['full-name']}",
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      Card(
                          shadowColor: const Color.fromARGB(255, 167, 166, 164),
                          elevation: 10,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Image.asset(
                                    'images/birthday.png',
                                    height: 50,
                                    width: 50,
                                  )),
                              Expanded(
                                flex: 3,
                                child: ListTile(
                                  title: const Text("Date of Birth"),
                                  subtitle: Text(
                                    "${snapshot.data.docs[index].data()['date-of-birth']}",
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      Card(
                          shadowColor: const Color.fromARGB(255, 167, 166, 164),
                          elevation: 10,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Image.asset(
                                    'images/calendar.png',
                                    height: 50,
                                    width: 50,
                                  )),
                              Expanded(
                                flex: 3,
                                child: ListTile(
                                  title: const Text("Joining Date"),
                                  subtitle: Text(
                                    "${snapshot.data.docs[index].data()['joining_date']}",
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      Card(
                          shadowColor: const Color.fromARGB(255, 167, 166, 164),
                          elevation: 10,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Image.asset(
                                    'images/map.png',
                                    height: 50,
                                    width: 50,
                                  )),
                              Expanded(
                                flex: 3,
                                child: ListTile(
                                  title: const Text("Address"),
                                  subtitle: Text(
                                    "${snapshot.data.docs[index].data()['address']}",
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      Card(
                          shadowColor: const Color.fromARGB(255, 167, 166, 164),
                          elevation: 10,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Image.asset(
                                    'images/phone.png',
                                    height: 50,
                                    width: 50,
                                  )),
                              Expanded(
                                flex: 3,
                                child: ListTile(
                                  title: const Text("Phone Number"),
                                  subtitle: Text(
                                    "${snapshot.data.docs[index].data()['phone']}",
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  );
                  ;
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
