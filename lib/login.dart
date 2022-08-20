
import 'iconpage/homework.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var myEmail, myPassword;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  signin() async {
    var formdata = formstate.currentState;
    formdata?.save();
    if (formdata!.validate()) {}
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: myEmail, password: myPassword);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        AwesomeDialog(
                context: context,
                padding: const EdgeInsets.symmetric(vertical: 20),
                title: "Error",
                body: const Text("No user found for that Email .",
                    style: TextStyle(fontSize: 15)))
            .show();
      } else if (e.code == 'wrong-password') {
        AwesomeDialog(
            context: context,
            padding: const EdgeInsets.symmetric(vertical: 20),
            title: "Error",
            body: const Text(
              "Wrong password provided for that user.",
              style: TextStyle(fontSize: 15),
            )).show();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
          // color: Colors.blue[100],
          child: Center(
              child: Container(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formstate,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    // color: Colors.greenAccent,
                    child: Center(
                        child: Image.asset(
                      "images/babyzone.png",
                    )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onSaved: (val) {
                      myEmail = val;
                    },
                    validator: (val) {
                      if (val!.length > 100) {
                        return "Email Can't be more 100";
                      }
                      if (val.length < 4) {
                        return "Email cant be less 4";
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                const BorderSide(color: Colors.blue, width: 2)),
                        hintText: "Enter your email ",
                        hintStyle: const TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Icon(Icons.email_outlined),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(width: 1))),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    onSaved: (val) {
                      myPassword = val;
                    },
                    validator: (val) {
                      if (val!.length > 100) {
                        return "Password Can't be more 100";
                      }
                      if (val.length < 4) {
                        return "Password cant be less 4";
                      }
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                const BorderSide(color: Colors.blue, width: 2)),
                        hintText: "Enter password",
                        hintStyle: const TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Icon(Icons.password),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(width: 1))),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          onPrimary: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                          primary: Colors.pink),
                      onPressed: () async {
                        var user = await signin();
                        if (user != null) {
                          Navigator.of(context)
                              .pushReplacementNamed("homepage");
                        }
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ))
                ],
              ),
            ),
          )),
        ),
      ]),
    );
  }
}
