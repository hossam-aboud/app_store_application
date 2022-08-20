import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    getUser() {
      var user = FirebaseAuth.instance.currentUser;
      print(User);
    }

    @override
    void initState() {
      getUser();
      super.initState();
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Baby Zone'),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    child: Image.asset("images/profile.png"),
                  ),
                  accountName: const Text("Student Name"),
                  accountEmail: const Text("StudentEmail@babyzone.com")),
              ListTile(
                  title: const Text(
                    "البيانات الشخصية ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  leading: IconButton(
                    icon: Image.asset("images/profile.png"),
                    onPressed: () {
                      Navigator.of(context).pushNamed("profile");
                    },
                  )),
              ListTile(
                  title: const Text(
                    "الكاميرات",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  leading: IconButton(
                    icon: Image.asset("images/camera.png"),
                    onPressed: () {
                      Navigator.of(context).pushNamed("camera");
                    },
                  )),
              ListTile(
                  title: const Text(
                    "الأكل والنوم",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  leading: IconButton(
                    icon: Image.asset("images/boy1.png"),
                    onPressed: () {
                      Navigator.of(context).pushNamed("notes");
                    },
                  )),
              ListTile(
                  title: const Text(
                    "المهام",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  leading: IconButton(
                    icon: Image.asset("images/requirement.png"),
                    onPressed: () {
                      Navigator.of(context).pushNamed("requirment");
                    },
                  )),
              ListTile(
                  title: const Text(
                    "تعليقات الأهل",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  leading: IconButton(
                    icon: Image.asset("images/family.png"),
                    onPressed: () {
                      Navigator.of(context).pushNamed("family");
                    },
                  )),
              ListTile(
                  title: const Text(
                    "الملاحظات",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  leading: IconButton(
                    icon: Image.asset("images/note.png"),
                    onPressed: () {
                      Navigator.of(context).pushNamed("homework");
                    },
                  )),
              ListTile(
                  title: const Text(
                    "الكشف المالي ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  leading: IconButton(
                    icon: Image.asset("images/budget.png"),
                    onPressed: () {
                      Navigator.of(context).pushNamed("budget");
                    },
                  )),
              ListTile(
                  title: const Text(
                    "تواصل معنا",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  leading: IconButton(
                    icon: Image.asset("images/chat.png"),
                    onPressed: () {
                      print("chat");
                    },
                  )),
              ListTile(
                  title: const Text(
                    "تسجيل الخروج",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  leading: IconButton(
                    icon: const Icon(
                      Icons.logout,
                      size: 30,
                      color: Colors.red,
                    ),
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.of(context).pushReplacementNamed("login");
                    },
                  )),
            ],
          ),
        ),
        body: ListView(children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 130, 224, 133),
                        border: Border.all(
                          width: 1,
                          color: const Color.fromARGB(255, 130, 224, 133),
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    width: double.infinity,
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "مرحبا بكم ",
                          style: TextStyle(fontSize: 35),
                        ),
                        Text(
                          "ولي أمر الطفل : محمد محمد",
                          style: TextStyle(fontSize: 30),
                        ),
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
                                Navigator.of(context).pushNamed("camera");
                              },
                              icon: Image.asset("images/camera.png"))),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("camera");
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
                          "المهام",
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
                          Navigator.of(context).pushNamed("notes");
                        },
                        child: const Text(
                          "الملاحظات",
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
                            icon: Image.asset("images/homework.png")),
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
                          "الواجبات",
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
                          "الفعاليات",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25, color: Colors.black),
                        ),
                      )
                    ]),
                  ),
                ]),
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
          ),
        ]));
  }
}
