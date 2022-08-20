import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../coumpanent/alert.dart';
import '../food_page/food_page.dart';
import '../notespage/notepage.dart';
import '../sleep_page/sleep_page.dart';

CollectionReference userNoteRef = FirebaseFirestore.instance.collection("Note");
CollectionReference userSleepRef =
    FirebaseFirestore.instance.collection("SleepNote");
CollectionReference userFoodRef =
    FirebaseFirestore.instance.collection("FoodNote");

class Notes extends StatefulWidget {
  final notes;

  Notes({Key? key, this.notes}) : super(key: key);

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    CollectionReference userRef =
        FirebaseFirestore.instance.collection("users");
    List<Widget> widgetpages = [
      //index1
      // const PageOne(),
      //index2
      const PageTwo(),
      //index2
      const PageThree()
    ];

    return Scaffold(
        bottomNavigationBar: SalomonBottomBar(
          margin: const EdgeInsets.all(10),
          currentIndex: _currentIndex,
          onTap: (i) {
            setState(() {
              _currentIndex = i;
            });
          },
          items: [
            // /// Notes
            // SalomonBottomBarItem(
            //   icon: Image.asset(
            //     "images/notes.png",
            //     height: 35,
            //     width: 35,
            //   ),
            //   title: const Text("الملاحظات"),
            //   selectedColor: Colors.purple,
            // ),

            /// Sllep
            SalomonBottomBarItem(
              icon: Image.asset(
                "images/sleep.png",
                height: 35,
                width: 35,
              ),
              title: const Text("النوم"),
              selectedColor: Color.fromARGB(255, 255, 0, 128),
            ),

            /// Food
            SalomonBottomBarItem(
              icon: Image.asset(
                "images/food.png",
                height: 35,
                width: 35,
              ),
              title: const Text("الوجبات"),
              selectedColor: Colors.pink,
            ),
          ],
        ),
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
            'الأكل و النوم',
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
                                  "الأكل و النوم",
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
                                  "الواجبات",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                leading: Image.asset(
                                  "images/homework.png",
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
        body: widgetpages.elementAt(_currentIndex));
  }
}

//pageone stateful
// class PageOne extends StatefulWidget {
//   const PageOne({Key? key}) : super(key: key);

//   @override
//   State<PageOne> createState() => _PageOneState();
// }

// class _PageOneState extends State<PageOne> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//         children: [
//           FutureBuilder(
//               future: userNoteRef
//                   .where("UserId",
//                       isEqualTo: "All" )
//                   .get(),
//               builder: (BuildContext context, AsyncSnapshot snapshot) {
//                 if (snapshot.hasError) {
//                   return const Text("Error");
//                 }
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return  Container(
//                     height: 1,
//                   );
//                 }
//                 if (snapshot.hasData) {
//                   return ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: snapshot.data.docs.length,
//                       itemBuilder: ((context, index) {
//                         return ListNote(
//                           notes: snapshot.data.docs[index],
//                           docid: snapshot.data.docs[index].id,
//                         );
//                       }));
//                 }
//                 return Text("Loading");
//               }),
//               FutureBuilder(
//               future: userNoteRef
//                   .where("UserId",
//                       isEqualTo: FirebaseAuth.instance.currentUser?.email)
//                   .get(),
//               builder: (BuildContext context, AsyncSnapshot snapshot) {
//                 if (snapshot.hasError) {
//                   return const Text("Error");
//                 }
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//                 if (snapshot.hasData) {
//                   return ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: snapshot.data.docs.length,
//                       itemBuilder: ((context, index) {
//                         return ListNote(
//                           notes: snapshot.data.docs[index],
//                           docid: snapshot.data.docs[index].id,
//                         );
//                       }));
//                 }
//                 return const  Text("Loading");
//               }),

//         ],
//       );
//   }
// }

//page three statefull
class PageTwo extends StatefulWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        StreamBuilder(
            stream: userSleepRef.where("UserId", isEqualTo: "All").orderBy('Date', descending: true)
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
                      return ListSleep(
                        sleeplist: snapshot.data.docs[index],
                        docid: snapshot.data.docs[index].id,
                      );
                    }));
              }
              return const Text("Loading");
            }),
        StreamBuilder(
            stream: userSleepRef
                .where("UserId",
                    isEqualTo: FirebaseAuth.instance.currentUser?.email).orderBy('Date', descending: true)
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
                      return ListSleep(
                        sleeplist: snapshot.data.docs[index],
                        docid: snapshot.data.docs[index].id,
                      );
                    }));
              }
              return const Text("Loading");
            }),
      ],
    );
  }
}

class PageThree extends StatefulWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FutureBuilder(
            future: userFoodRef.where("UserId", isEqualTo: "All").get(),
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
                      return ListFood(
                        foodlist: snapshot.data.docs[index],
                        docid: snapshot.data.docs[index].id,
                      );
                    }));
              }
              return Text("Loading");
            }),
        FutureBuilder(
            future: userFoodRef
                .where("UserId",
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
                    shrinkWrap: true,
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: ((context, index) {
                      return ListFood(
                        foodlist: snapshot.data.docs[index],
                        docid: snapshot.data.docs[index].id,
                      );
                    }));
              }
              return const Text("Loading");
            }),
      ],
    );
  }
}

// pageOne Stateless
class ListNote extends StatelessWidget {
  final notes;
  final docid;
  ListNote({this.notes, this.docid});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return NotePage(notes: notes);
          }));
        },
        child: Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            shadowColor: const Color.fromARGB(255, 167, 166, 164),
            elevation: 10,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Image.asset(
                      'images/notes.png',
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
                            return NotePage(
                              notes: notes,
                            );
                          }));
                        },
                        icon: const Icon(Icons.remove_red_eye)),
                    title: Text("${notes['title']}"),
                    subtitle: Text(
                      "${notes['body']}",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            )));
  }
}

// pagetwo stateless
class ListSleep extends StatelessWidget {
  final sleeplist;
  final docid;
  ListSleep({this.sleeplist, this.docid});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return SleepPage(sleep: sleeplist);
          }));
        },
        child: Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            shadowColor: const Color.fromARGB(255, 167, 166, 164),
            elevation: 10,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Image.asset(
                      'images/baby.png',
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
                            return SleepPage(
                              sleep: sleeplist,
                            );
                          }));
                        },
                        icon: const Icon(Icons.remove_red_eye)),
                    title:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${sleeplist['title']}"),
                    Text("${sleeplist['UserId']}",style:const TextStyle(color: Color.fromARGB(255, 104, 102, 102)),),

                  ],
                ),
                    subtitle: Text(
                        formattedData(sleeplist['Date']),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            )));
  }
}

//page three statless
class ListFood extends StatelessWidget {
  final foodlist;
  final docid;
  ListFood({this.foodlist, this.docid});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return FoodPage(foods: foodlist);
          }));
        },
        child: Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            shadowColor: const Color.fromARGB(255, 167, 166, 164),
            elevation: 10,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Image.asset(
                      'images/diet.png',
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
                            return FoodPage(
                              foods: foodlist,
                            );
                          }));
                        },
                        icon: const Icon(Icons.remove_red_eye)),
                    title:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${foodlist['title']}"),
                    Text("${foodlist['UserId']}",style:const TextStyle(color: Color.fromARGB(255, 104, 102, 102)),),

                  ],
                ),
                    subtitle: Text(
                      formattedData(foodlist['Date']),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            )));
  }
}
