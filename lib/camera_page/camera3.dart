import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class Camera3 extends StatefulWidget {
  const Camera3({Key? key}) : super(key: key);

  @override
  State<Camera3> createState() => _Camera3State();
}

CollectionReference usersref = FirebaseFirestore.instance.collection("camera");
var Url;
bool? state;
var cameraId;

class _Camera3State extends State<Camera3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('camera 3'),
      ),
      body: FutureBuilder(
          future: usersref.where("cameraId", isEqualTo: 3).get(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        CamerUi(
                          cameraui: snapshot.data.docs[index],
                        ),
                      ],
                    );
                  });
            }
            if (snapshot.hasError) {
              return Text("Error");
            }
            return CircularProgressIndicator();
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
        VlcPlayerController.network("${cameraui["Url"]}",
            hwAcc: HwAcc.full, autoPlay: true, options: VlcPlayerOptions());
    return cameraui["state"] == true
        ? RotatedBox(
            quarterTurns: 1,
            child: VlcPlayer(
              controller: _videoPlayerController1,
              aspectRatio: 16 / 9,
              placeholder: const Center(
                child: CircularProgressIndicator(),
              ),
            ))
        : Center(
            child: Column(
              children: [
                Image.asset(
                  "images/access.png",
                  scale: 5,
                ),
                const Text(
                  "ليست لديك صلاحية رؤية هذه الكاميرا",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          );
  }
}
