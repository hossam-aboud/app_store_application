import 'package:babyzone4/camera_pages/camera1.dart';
import 'package:babyzone4/camera_pages/camera10.dart';
import 'package:babyzone4/camera_pages/camera11.dart';
import 'package:babyzone4/camera_pages/camera12.dart';
import 'package:babyzone4/camera_pages/camera13.dart';
import 'package:babyzone4/camera_pages/camera14.dart';
import 'package:babyzone4/camera_pages/camera15.dart';
import 'package:babyzone4/camera_pages/camera16.dart';
import 'package:babyzone4/camera_pages/camera2.dart';
import 'package:babyzone4/camera_pages/camera3.dart';
import 'package:babyzone4/camera_pages/camera4.dart';
import 'package:babyzone4/camera_pages/camera6.dart';
import 'package:babyzone4/camera_pages/camera7.dart';
import 'package:babyzone4/camera_pages/camera8.dart';
import 'package:babyzone4/camera_pages/camera9.dart';
import 'package:babyzone4/envent_page/event_page.dart';
import 'package:babyzone4/familypagenote/family_page_note.dart';
import 'package:babyzone4/familypagenote/familynote_description.dart';
import 'package:babyzone4/homeworkpage/homeworkpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'camera_pages/camera5.dart';
import 'iconpage/budget.dart';
import 'iconpage/chat.dart';
import 'iconpage/family.dart';
import 'iconpage/food_sleep.dart';
import 'iconpage/homework.dart';
import 'iconpage/profile.dart';
import 'package:flutter/material.dart';
import 'homepage/homepage.dart';
import 'iconpage/camera_management.dart';
import 'iconpage/requirment.dart';
import 'auth/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'iconpage/events.dart';
import 'iconpage/aboutus.dart';
import 'notespage/notepage.dart';
import 'req_page/requirement_page.dart';

bool? islogin;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    islogin = false;
  } else {
    islogin = true;
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: islogin == false ? const Login() : const HomePage(),
        // home: const Login(),
        routes: {
          "camera_management": (context) => const CameraManagement(),
          "login": (context) => const Login(),
          "homepage": (context) => const HomePage(),
          "profile": (context) => const Profile(),
          "budget": (context) => Budget(),
          "chat": (context) => Chat(),
          "family": (context) => Family(),
          "homework": (context) => HomeWork(),
          "notes": (context) => Notes(),
          "requirment": (context) => Requierment(),
          "events": (context) => Events(),
          "aboutus": (context) => AboutUs(),
          "notepage": (context) => NotePage(),
          "homework_page": (context) => HomeWork_Page(),
          "requirement_page": (context) => Requirment_page(),
          "event_page": (context) => Event_page(),
          "family_page_note": (context) => family_page_note(),
          "note_descripton": (context) => Note_Description(),
          "camera1": (context) => const Camera1(),
          "camera2": (context) => const Camera2(),
          "camera3": (context) => const Camera3(),
          "camera4": (context) => const Camera4(),
          "camera5": (context) => const Camera5(),
          "camera6": (context) => const Camera6(),
          "camera7": (context) => const Camera7(),
          "camera8": (context) => const Camera8(),
          "camera9": (context) => const Camera9(),
          "camera10": (context) => const Camera10(),
          "camera11": (context) => const Camera11(),
          "camera12": (context) => const Camera12(),
          "camera13": (context) => const Camera13(),
          "camera14": (context) => const Camera14(),
          "camera15": (context) => const Camera15(),
          "camera16": (context) => const Camera16(),
        },
        theme: ThemeData(
            fontFamily: 'LibreBaskerville',
            primaryColor: Colors.pink[200],
            brightness: Brightness.light,
            textTheme: const TextTheme(
              headline5: TextStyle(fontSize: 30, color: Colors.blue),
              bodyText2: TextStyle(fontSize: 20, color: Colors.black),
            ),
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.pink,
            )));
  }
}
