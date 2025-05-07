import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/loginpage.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void signupp() async
  {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(backgroundColor: Colors.green,),
      backgroundColor: Colors.yellowAccent,
      body: Center
        (
        child: Column(
          children: [
            TextFormField
              (
              controller: email,
              decoration: InputDecoration(hintText: "Enter a mail id ",border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),prefixIcon: Icon(Icons.email)),

            ),
            SizedBox(height: 10,),
            TextFormField
              (
              controller: password,
              decoration: InputDecoration(hintText: "Enter a passwordd ",border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),prefixIcon: Icon(Icons.password)),
              ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: ()
            {
              signupp();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>loginpage()));
            }, child: Text("sign up now"))
          ],
        ),

    ),
    );
  }
}
