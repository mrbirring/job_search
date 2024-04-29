import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:job_search/admin/login.dart';

class Signup_screen extends StatefulWidget {
  const Signup_screen({super.key});

  @override
  State<Signup_screen> createState() => _Signup_screenState();
}

class _Signup_screenState extends State<Signup_screen> {
  final email_textcontoller = TextEditingController();
  final pass_textcontoller = TextEditingController();
  final fname_textcontoller = TextEditingController();
  final Uname_textcontoller = TextEditingController();
  final conf_pass_textcontoller = TextEditingController();
  late String password;

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
                  controller: fname_textcontoller,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(8.0),
                    hintText: 'Enter FullName',
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
                  controller: Uname_textcontoller,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(8.0),
                    hintText: 'Enter UserName',
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
                  onEditingComplete: () {},
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
              Padding(
                padding: const EdgeInsets.only(top: 22.0),
                child: TextFormField(
                  controller: conf_pass_textcontoller,
                  onEditingComplete: () {},
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(8.0),
                    hintText: 'Confirm Password',
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
                child: SizedBox(
                  width: double.infinity,
                  height: 42,
                  child: ElevatedButton(
                    onPressed: () {
                      if (pass_textcontoller.text.toString() ==
                              conf_pass_textcontoller.text.toString() &&
                          email_textcontoller.text.isNotEmpty) {
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: email_textcontoller.text.toString(),
                                password: pass_textcontoller.text.toString())
                            .then(
                          (value) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          },
                        ).onError((error, stackTrace) {
                          print(error);
                        });
                        print("signup");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                      ),
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
                    "Already have account?",
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: const Text(
                      "Login here",
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
