import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/signup.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void login() async
  {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      body: Center
        (
        child: Column
          (
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            TextFormField
              (
              controller: email,
              decoration: InputDecoration(hintText: "enter a Email id ",border:OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
            ),
            SizedBox(height: 10,),
            TextFormField
              (
              controller: password,
              decoration: InputDecoration(hintText: "enter a password ",border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),

            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: ()
            {
              login();
            }, child: Text("login")),
            SizedBox(height: 30,),

            TextButton
              (
                onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>signup()));
                }, child: Text("sign up",style: TextStyle(fontSize: 10),)),
          ],
        ),
      ),
    );
  }
}
