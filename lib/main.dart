import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:job_search/List_of_jobs.dart';
import 'package:job_search/MainPages/Homepage.dart';
import 'package:job_search/admin/login.dart';
import 'package:job_search/admin/signup.dart';

//import 'package:job_search/MainPages/jobdetail.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Search',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: "Flutter"), //const MyHomePage(title: 'Job SeeKers Den'),job_detail("7oKm_SkxjLxpFtVuAAAAAA=="),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Timer(Duration(seconds: 3), () {
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => Homefirst()));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("job_imges/one_time.png"), fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height * .40,
                  width: MediaQuery.of(context).size.width,
                  color: Color.fromARGB(255, 3, 132, 238),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Welcome To JobHub",
                        softWrap: true,
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1,
                            wordSpacing: 1.2,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.height / 24),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "We help you to find your dream job according to your location & preference to build your career",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 52),
                      ),
                      const SizedBox(height: 22),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(60, 50),
                                shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              },
                              child: Text("Sign In")),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(60, 50),
                                shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                              onHover: (value) {},
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Signup_screen()));
                              },
                              child: Text("Sign Up")),
                          const SizedBox(width: 10),
                        ],
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => Homefirst()));
                          },
                          child: Text("Continue as Guest")),
                    ],
                  )),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
