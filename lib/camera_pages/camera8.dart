import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

class Camera8 extends StatefulWidget {
  const Camera8({Key? key}) : super(key: key);

  @override
  State<Camera8> createState() => _Camera8State();
}


CollectionReference usersref = FirebaseFirestore.instance.collection("users");


bool isSecureMode = true;
class _Camera8State extends State<Camera8> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      if(isSecureMode){
        //block Screen Shot
        FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
        print("Secure Mode On");
      }else{
        //stop screen shot
        FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
        print("Secure Mode Off");

      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('camera 08'),
      ),
      body: FutureBuilder(
          future:usersref
            .where("email", isEqualTo: FirebaseAuth.instance.currentUser?.email)
            .get(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return CamerUi(
                      cameraui: snapshot.data.docs[index],
                    );
                  });
            }
            if (snapshot.hasError) {
              return Text("Error");
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}

class CamerUi extends StatelessWidget {
  final cameraui;

  CamerUi({Key? key, this.cameraui}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final VlcPlayerController _videoPlayerController1 =
        VlcPlayerController.network(cameraui["cameraID8"]["url"],
            hwAcc: HwAcc.full, autoPlay: true, options: VlcPlayerOptions());
    return RotatedBox(
      quarterTurns: 1,
      child: VlcPlayer(
        controller: _videoPlayerController1,
        aspectRatio: 16 / 9,
        placeholder: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

NotValid() {
  return Center(
    child: Column(
      children: [
        Image.asset(
          "images/access.png",
          scale: 5,
        ),
        const Text(
          "???????? ???????? ???????????? ???????? ?????? ????????????????",
          style: TextStyle(fontSize: 20),
        ),
      ],
    ),
  );
}
