import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Chat extends StatefulWidget {
  Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
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
          'معلومات التواصل',
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
                  return const Text("Error");
                }
                return const CircularProgressIndicator();
              })),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(
                left: 20, right: 20, top: 10, bottom: 2.5),
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 182, 214, 240),
                border: Border.all(
                  width: 1,
                  color: const Color.fromARGB(255, 182, 214, 240),
                ),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "images/facebook.png",
                  width: 70,
                  height: 70,
                ),
                const SizedBox(
                  width: 50,
                ),
                Column(
                  children: [
                    const Text(
                      "BABY ZONE nursery",
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 62, 121),
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                           const url = 'https://www.facebook.com/zonebaby10';
                          // ignore: deprecated_member_use
                          if (!await canLaunch(url)) {
                            // ignore: deprecated_member_use
                            await launch(url, forceSafariVC: false);}
                        },
                        child: const Text("Go To Facebook"),
                        style: ElevatedButton.styleFrom(
                            onPrimary: Color.fromARGB(255, 255, 255, 255),
                            primary: Colors.blue[800],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))))
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(
                left: 20, right: 20, top: 2.5, bottom: 2.5),
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 182, 214, 240),
                border: Border.all(
                  width: 1,
                  color: const Color.fromARGB(255, 182, 214, 240),
                ),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "images/whatsup.png",
                  width: 70,
                  height: 70,
                ),
                const SizedBox(
                  width: 50,
                ),
                Column(
                  children: [
                    const Text(
                      "+970-595765785",
                      style: TextStyle(
                          color: Color.fromARGB(255, 2, 97, 41),
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                           const url = 'https://api.whatsapp.com/send?phone=970595765785';
                          // ignore: deprecated_member_use
                          if (!await canLaunch(url)) {
                            // ignore: deprecated_member_use
                            await launch(url, forceSafariVC: false);
                          }
                        },
                        child: const Text("Go To WhatsUp"),
                        style: ElevatedButton.styleFrom(
                            onPrimary: const Color.fromARGB(255, 255, 255, 255),
                            primary: Colors.green[800],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))))
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 2.5),
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 182, 214, 240),
                border: Border.all(
                  width: 1,
                  color: const Color.fromARGB(255, 182, 214, 240),
                ),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "images/smartphone.png",
                  width: 70,
                  height: 70,
                ),
                const SizedBox(
                  width: 80,
                ),
                Column(
                  children: const [
                    Text(
                      "059-5765785",
                      style: TextStyle(
                          color: Colors.pink, fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 2.5),
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 182, 214, 240),
                border: Border.all(
                  width: 1,
                  color: const Color.fromARGB(255, 182, 214, 240),
                ),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "images/call.png",
                  width: 70,
                  height: 70,
                ),
                const SizedBox(
                  width: 80,
                ),
                Column(
                  children: const [
                    Text(
                      "09-2354702",
                      style: TextStyle(
                          color: Colors.pink, fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
