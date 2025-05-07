import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login/firstscreen.dart';
import 'package:login/loginpage.dart';

void main()async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp
    (
    options: FirebaseOptions
      (
        apiKey: "AIzaSyCGSl71MPikI4lmEkC94o0ovasCvCiHgK8",
        appId:  "1:1036157118144:android:d338f08eca3595a8a4ef25",
        messagingSenderId: "1036157118144",
        projectId: "bittzbytes"
    )
  );
  runApp(MaterialApp(home: login(),));

}
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder
      (
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot)
        {
          if(snapshot.hasData)
            {
              return firstscreen();
            }
          else
            {
              return loginpage();
            }
        }
    );

  }
}
