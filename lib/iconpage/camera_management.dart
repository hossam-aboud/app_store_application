import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

class CameraManagement extends StatefulWidget {
  const CameraManagement({Key? key}) : super(key: key);

  @override
  State<CameraManagement> createState() => _CameraManagementState();
}

CollectionReference userRef = FirebaseFirestore.instance.collection("users");

int x = 0;
CollectionReference cameraRef =
    FirebaseFirestore.instance.collection("camera_state");
var camerastate;

class _CameraManagementState extends State<CameraManagement> {
  bool isSecureMode = true;

  getData() async {
    await cameraRef.where("state").get().then((value) {
      value.docs.forEach((element) {
        print(element['state']);
        print("=================");
        camerastate = element['state'];
      });
    });
  }
  stopScreenShot(){
    if(isSecureMode){
      //BlockScreen
      FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    }else{
      //Allow ScreenShot
      FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
    stopScreenShot();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('camera'),
        ),
        body: camerastate == false
            ? ClosedCamera()
            : FutureBuilder(
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
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 6),
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return CamerCards(
                            cameraCard: snapshot.data.docs[index],
                          );
                        });
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }));
  }
}

class CamerCards extends StatelessWidget {
  final cameraCard;
  const CamerCards({Key? key, this.cameraCard}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //camera 01
    bool familycamera1 = cameraCard["cameraID1"]["family_state"];
    bool allCamera1 = cameraCard["cameraID1"]["all_state"];
    var cameraId_av1 = cameraCard["cameraTokenID1"];

    //camera 02
    bool familycamera2 = cameraCard["cameraID2"]["family_state"];
    bool allCamera2 = cameraCard["cameraID2"]["all_state"];
    var cameraId_av2 = cameraCard["cameraTokenID2"];
    //camera 03
    bool familycamera3 = cameraCard["cameraID3"]["family_state"];
    bool allCamera3 = cameraCard["cameraID3"]["all_state"];
    var cameraId_av3 = cameraCard["cameraTokenID3"];
    //camera 04
    bool familycamera4 = cameraCard["cameraID4"]["family_state"];
    bool allCamera4 = cameraCard["cameraID4"]["all_state"];
    var cameraId_av4 = cameraCard["cameraTokenID4"];
    //camera 05
    bool familycamera5 = cameraCard["cameraID5"]["family_state"];
    bool allCamera5 = cameraCard["cameraID5"]["all_state"];
    var cameraId_av5 = cameraCard["cameraTokenID5"];
    //camera 06
    bool familycamera6 = cameraCard["cameraID6"]["family_state"];
    bool allCamera6 = cameraCard["cameraID6"]["all_state"];
    var cameraId_av6 = cameraCard["cameraTokenID6"];
    //camera 07
    bool familycamera7 = cameraCard["cameraID7"]["family_state"];
    bool allCamera7 = cameraCard["cameraID7"]["all_state"];
    var cameraId_av7 = cameraCard["cameraTokenID7"];
    //camera 08
    bool familycamera8 = cameraCard["cameraID8"]["family_state"];
    bool allCamera8 = cameraCard["cameraID8"]["all_state"];
    var cameraId_av8 = cameraCard["cameraTokenID8"];
    //camera 09
    bool familycamera9 = cameraCard["cameraID9"]["family_state"];
    bool allCamera9 = cameraCard["cameraID9"]["all_state"];
    var cameraId_av9 = cameraCard["cameraTokenID9"];
    //camera 10
    bool familycamera10 = cameraCard["cameraID10"]["family_state"];
    bool allCamera10 = cameraCard["cameraID10"]["all_state"];
    var cameraId_av10 = cameraCard["cameraTokenID10"];
    bool familycamera11 = cameraCard["cameraID11"]["family_state"];
    bool allCamera11 = cameraCard["cameraID11"]["all_state"];
    var cameraId_av11 = cameraCard["cameraTokenID11"];
    //camera 12
    bool familycamera12 = cameraCard["cameraID12"]["family_state"];
    bool allCamera12 = cameraCard["cameraID12"]["all_state"];
    var cameraId_av12 = cameraCard["cameraTokenID12"];
    //camera 13
    bool familycamera13 = cameraCard["cameraID13"]["family_state"];
    bool allCamera13 = cameraCard["cameraID13"]["all_state"];
    var cameraId_av13 = cameraCard["cameraTokenID13"];
    //camera 14
    bool familycamera14 = cameraCard["cameraID14"]["family_state"];
    bool allCamera14 = cameraCard["cameraID14"]["all_state"];
    var cameraId_av14 = cameraCard["cameraTokenID14"];
    //camera 15
    bool familycamera15 = cameraCard["cameraID15"]["family_state"];
    bool allCamera15 = cameraCard["cameraID15"]["all_state"];
    var cameraId_av15 = cameraCard["cameraTokenID15"];
    //camera 08
    bool familycamera16 = cameraCard["cameraID16"]["family_state"];
    bool allCamera16 = cameraCard["cameraID16"]["all_state"];
    var cameraId_av16 = cameraCard["cameraTokenID16"];
    return Column(
      children: [
        //card camer 01
        familycamera1 == true && allCamera1 == true && cameraId_av1 != "off"
            ? Card(
                shadowColor: const Color.fromARGB(255, 167, 166, 164),
                elevation: 10,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Image.asset(
                          'images/surveillance.png',
                          height: 50,
                          width: 50,
                        )),
                    Expanded(
                      flex: 3,
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed("camera1");
                        },
                        trailing: IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("camera1");
                            },
                            icon: const Icon(Icons.remove_red_eye)),
                        title: const Text(
                          "camera 01",
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: const Text("Go to camera 01"),
                      ),
                    ),
                  ],
                ))
            : Container(
                height: 1,
              ),

        //card camer 02
        familycamera2 == true && allCamera2 == true && cameraId_av2 != "off"
            ? Card(
                shadowColor: const Color.fromARGB(255, 167, 166, 164),
                elevation: 10,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Image.asset(
                          'images/surveillance.png',
                          height: 50,
                          width: 50,
                        )),
                    Expanded(
                      flex: 3,
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed("camera2");
                        },
                        trailing: IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("camera2");
                            },
                            icon: const Icon(Icons.remove_red_eye)),
                        title: const Text(
                          "camera 02",
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: const Text("Go to camera 02"),
                      ),
                    ),
                  ],
                ))
            : Container(
                height: 1,
              ),
        //card camer 03
        familycamera3 == true && allCamera3 == true && cameraId_av3 != "off"
            ? Card(
                shadowColor: const Color.fromARGB(255, 167, 166, 164),
                elevation: 10,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Image.asset(
                          'images/surveillance.png',
                          height: 50,
                          width: 50,
                        )),
                    Expanded(
                      flex: 3,
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed("camera3");
                        },
                        trailing: IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("camera3");
                            },
                            icon: const Icon(Icons.remove_red_eye)),
                        title: const Text(
                          "camera 03",
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: const Text("Go to camera 03"),
                      ),
                    ),
                  ],
                ))
            : Container(
                height: 1,
              ),
        //card camer 04
        familycamera4 == true && allCamera4 == true && cameraId_av4 != "off"
            ? Card(
                shadowColor: const Color.fromARGB(255, 167, 166, 164),
                elevation: 10,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Image.asset(
                          'images/surveillance.png',
                          height: 50,
                          width: 50,
                        )),
                    Expanded(
                      flex: 3,
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed("camera4");
                        },
                        trailing: IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("camera4");
                            },
                            icon: const Icon(Icons.remove_red_eye)),
                        title: const Text(
                          "camera 04",
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: const Text("Go to camera 04"),
                      ),
                    ),
                  ],
                ))
            : Container(
                height: 1,
              ),
        //card camer 05
        familycamera5 == true && allCamera5 == true && cameraId_av5 != "off"
            ? Card(
                shadowColor: const Color.fromARGB(255, 167, 166, 164),
                elevation: 10,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Image.asset(
                          'images/surveillance.png',
                          height: 50,
                          width: 50,
                        )),
                    Expanded(
                      flex: 3,
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed("camera5");
                        },
                        trailing: IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("camera5");
                            },
                            icon: const Icon(Icons.remove_red_eye)),
                        title: const Text(
                          "camera 05",
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: const Text("Go to camera 05"),
                      ),
                    ),
                  ],
                ))
            : Container(
                height: 1,
              ),
        //card camer 06
        familycamera6 == true && allCamera6 == true && cameraId_av6 != "off"
            ? Card(
                shadowColor: const Color.fromARGB(255, 167, 166, 164),
                elevation: 10,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Image.asset(
                          'images/surveillance.png',
                          height: 50,
                          width: 50,
                        )),
                    Expanded(
                      flex: 3,
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed("camera6");
                        },
                        trailing: IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("camera6");
                            },
                            icon: const Icon(Icons.remove_red_eye)),
                        title: const Text(
                          "camera 06",
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: const Text("Go to camera 06"),
                      ),
                    ),
                  ],
                ))
            : Container(
                height: 1,
              ),
        //card camer 07
        familycamera7 == true && allCamera7 == true && cameraId_av7 != "off"
            ? Card(
                shadowColor: const Color.fromARGB(255, 167, 166, 164),
                elevation: 10,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Image.asset(
                          'images/surveillance.png',
                          height: 50,
                          width: 50,
                        )),
                    Expanded(
                      flex: 3,
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed("camera7");
                        },
                        trailing: IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("camera7");
                            },
                            icon: const Icon(Icons.remove_red_eye)),
                        title: const Text(
                          "camera 07",
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: const Text("Go to camera 07"),
                      ),
                    ),
                  ],
                ))
            : Container(
                height: 1,
              ),
        //card camer 08
        familycamera8 == true && allCamera8 == true && cameraId_av8 != "off"
            ? Card(
                shadowColor: const Color.fromARGB(255, 167, 166, 164),
                elevation: 10,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Image.asset(
                          'images/surveillance.png',
                          height: 50,
                          width: 50,
                        )),
                    Expanded(
                      flex: 3,
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed("camera8");
                        },
                        trailing: IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("camera8");
                            },
                            icon: const Icon(Icons.remove_red_eye)),
                        title: const Text(
                          "camera 08",
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: const Text("Go to camera 08"),
                      ),
                    ),
                  ],
                ))
            : Container(
                height: 1,
              ),
        //card camer 09
        familycamera9 == true && allCamera9 == true && cameraId_av9 != "off"
            ? Card(
                shadowColor: const Color.fromARGB(255, 167, 166, 164),
                elevation: 10,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Image.asset(
                          'images/surveillance.png',
                          height: 50,
                          width: 50,
                        )),
                    Expanded(
                      flex: 3,
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed("camera9");
                        },
                        trailing: IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("camera9");
                            },
                            icon: const Icon(Icons.remove_red_eye)),
                        title: const Text(
                          "camera 09",
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: const Text("Go to camera 09"),
                      ),
                    ),
                  ],
                ))
            : Container(
                height: 1,
              ),
        //card camer 10
        familycamera10 == true && allCamera10 == true && cameraId_av10 != "off"
            ? Card(
                shadowColor: const Color.fromARGB(255, 167, 166, 164),
                elevation: 10,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Image.asset(
                          'images/surveillance.png',
                          height: 50,
                          width: 50,
                        )),
                    Expanded(
                      flex: 3,
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed("camera10");
                        },
                        trailing: IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("camera10");
                            },
                            icon: const Icon(Icons.remove_red_eye)),
                        title: const Text(
                          "camera 10",
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: const Text("Go to camera 10"),
                      ),
                    ),
                  ],
                ))
            : Container(
                height: 1,
              ),
        //card camer 11
        familycamera11 == true && allCamera11 == true && cameraId_av11 != "off"
            ? Card(
                shadowColor: const Color.fromARGB(255, 167, 166, 164),
                elevation: 10,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Image.asset(
                          'images/surveillance.png',
                          height: 50,
                          width: 50,
                        )),
                    Expanded(
                      flex: 3,
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed("camera11");
                        },
                        trailing: IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("camera11");
                            },
                            icon: const Icon(Icons.remove_red_eye)),
                        title: const Text(
                          "camera 11",
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: const Text("Go to camera 11"),
                      ),
                    ),
                  ],
                ))
            : Container(
                height: 1,
              ),
        //card camer 12
        familycamera12 == true && allCamera12 == true && cameraId_av12 != "off"
            ? Card(
                shadowColor: const Color.fromARGB(255, 167, 166, 164),
                elevation: 10,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Image.asset(
                          'images/surveillance.png',
                          height: 50,
                          width: 50,
                        )),
                    Expanded(
                      flex: 3,
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed("camera12");
                        },
                        trailing: IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("camera12");
                            },
                            icon: const Icon(Icons.remove_red_eye)),
                        title: const Text(
                          "camera 12",
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: const Text("Go to camera 12"),
                      ),
                    ),
                  ],
                ))
            : Container(
                height: 1,
              ),
        //card camer 13
        familycamera13 == true && allCamera13 == true && cameraId_av13 != "off"
            ? Card(
                shadowColor: const Color.fromARGB(255, 167, 166, 164),
                elevation: 10,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Image.asset(
                          'images/surveillance.png',
                          height: 50,
                          width: 50,
                        )),
                    Expanded(
                      flex: 3,
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed("camera13");
                        },
                        trailing: IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("camera13");
                            },
                            icon: const Icon(Icons.remove_red_eye)),
                        title: const Text(
                          "camera 13",
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: const Text("Go to camera 13"),
                      ),
                    ),
                  ],
                ))
            : Container(
                height: 1,
              ),
        //card camer 14
        familycamera14 == true && allCamera14 == true && cameraId_av14 != "off"
            ? Card(
                shadowColor: const Color.fromARGB(255, 167, 166, 164),
                elevation: 10,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Image.asset(
                          'images/surveillance.png',
                          height: 50,
                          width: 50,
                        )),
                    Expanded(
                      flex: 3,
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed("camera14");
                        },
                        trailing: IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("camera14");
                            },
                            icon: const Icon(Icons.remove_red_eye)),
                        title: const Text(
                          "camera 14",
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: const Text("Go to camera 14"),
                      ),
                    ),
                  ],
                ))
            : Container(
                height: 1,
              ),
        //card camer 15
        familycamera15 == true && allCamera15 == true && cameraId_av15 != "off"
            ? Card(
                shadowColor: const Color.fromARGB(255, 167, 166, 164),
                elevation: 10,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Image.asset(
                          'images/surveillance.png',
                          height: 50,
                          width: 50,
                        )),
                    Expanded(
                      flex: 3,
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed("camera15");
                        },
                        trailing: IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("camera15");
                            },
                            icon: const Icon(Icons.remove_red_eye)),
                        title: const Text(
                          "camera 15",
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: const Text("Go to camera 15"),
                      ),
                    ),
                  ],
                ))
            : Container(
                height: 1,
              ),
        //card camer 16
        familycamera16 == true && allCamera16 == true && cameraId_av16 != "off"
            ? Card(
                shadowColor: const Color.fromARGB(255, 167, 166, 164),
                elevation: 10,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Image.asset(
                          'images/surveillance.png',
                          height: 50,
                          width: 50,
                        )),
                    Expanded(
                      flex: 3,
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed("camera16");
                        },
                        trailing: IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("camera16");
                            },
                            icon: const Icon(Icons.remove_red_eye)),
                        title: const Text(
                          "camera 16",
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: const Text("Go to camera 16"),
                      ),
                    ),
                  ],
                ))
            : Container(
                height: 1,
              ),
      ],
    );
  }
}

ClosedCamera() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: Column(
      children: [
        Center(
          child: Image.asset(
            "images/video.png",
            height: 80,
            width: 80,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Center(
            child: Text(
          "الكاميرات مغلقة حالياً",
          style: TextStyle(fontSize: 25),
        ))
      ],
    ),
  );
}
