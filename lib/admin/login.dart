import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:job_search/MainPages/Homepage.dart';
import 'package:job_search/admin/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final email_textcontoller = TextEditingController();
  final pass_textcontoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Center(
                child: Image.asset(
                  "job_imges/joblogo.png",
                  width: 80,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 22.0),
                child: TextFormField(
                  controller: email_textcontoller,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(8.0),
                    hintText: 'Email Here...',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 22.0),
                child: TextFormField(
                  controller: pass_textcontoller,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(8.0),
                    hintText: 'PassWord Here...',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forget Password",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                height: 42,
                child: ElevatedButton(
                  onPressed: () {
                    String user = email_textcontoller.text.toString();
                    String pass = pass_textcontoller.text.toString();

                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(email: user, password: pass)
                        .then((value) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Homefirst()));
                    }).onError((error, stackTrace) {
                      print(error);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 64, 27, 185),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Divider(),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Dont't have account yet?..",
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Signup_screen()),
                      );
                    },
                    child: const Text(
                      "Sign Up here",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
