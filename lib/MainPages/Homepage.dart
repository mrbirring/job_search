import 'dart:async';
//import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:job_search/List_of_jobs.dart';
import 'package:job_search/MainPages/jobdetail.dart';
import 'package:job_search/Model/recent_mod.dart';
// import 'package:job_search/MainPages/jobdetail.dart';
//import 'package:job_search/Model/job_detail_model.dart';
import 'package:job_search/Model/search_model.dart';
import 'package:job_search/controller/get_search.dart';
import 'package:job_search/controller/job_detail_cont.dart';
import 'package:job_search/controller/recent_cont.dart';
import 'package:job_search/main.dart';
import 'package:url_launcher/url_launcher.dart';

class Homefirst extends StatefulWidget {
  const Homefirst({super.key});

  @override
  State<Homefirst> createState() => _HomefirstState();
}

class _HomefirstState extends State<Homefirst> {
  search aa = Get.put(search());
  jobdetail_cont job = Get.put(jobdetail_cont());
  Recent_cont recent = Get.put(Recent_cont());

  TextEditingController searchcont = TextEditingController();
  bool isFullTime = true;
  bool isPartTime = false;
  String emply_type = "FULLTIME";
  bool dataok = false;
  String search_input = "";

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              FirebaseAuth.instance.signOut().then((value) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MyHomePage(title: "")));
                              });
                            },
                            icon: Icon(Icons.more_horiz_outlined)),
                        IconButton(
                            onPressed: () {},
                            icon:
                                ImageIcon(AssetImage("job_imges/job_logo.png")))
                      ]),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Search",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.height / 20)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Find & Apply!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height / 22,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  width: MediaQuery.of(context).size.width - 22,
                  child: Column(
                    children: [
                      searchbox(),
                      const SizedBox(
                        height: 10,
                      ),
                      Choice_chip_time(),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 22,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Populer Jobs",
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              45,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Listofjobs(
                                              "google",
                                              "FULLTIME",
                                              "searchcont"),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "View all",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 248, 89, 10),
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                45,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                FutureBuilder<SearchGet>(
                    future: aa.getsearch("google", "FULLTIME"),
                    builder: (context, snapshot_populer) {
                      if (snapshot_populer.hasData) {
                        return SizedBox(
                          height: 200,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12, right: 12),
                            child: GridView.builder(
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                gridDelegate:
                                    new SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 1, mainAxisSpacing: 2),
                                itemCount: snapshot_populer.data!.data!.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      var ss = snapshot_populer
                                          .data!.data![index].jobId
                                          .toString();
                                      var name = snapshot_populer
                                          .data!.data![index].jobTitle
                                          .toString();
                                      var link = snapshot_populer
                                          .data!.data![index].jobApplyLink
                                          .toString();
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => job_detail(
                                                  "${ss}",
                                                  "${name}",
                                                  "${link}")));
                                    },
                                    child: Card(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Emage_exption(
                                                    snapshot_populer, index),
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Expanded(
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Text(
                                                    " ${snapshot_populer.data!.data![index].employerName.toString()} ",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "${snapshot_populer.data!.data![index].jobTitle.toString()} ",
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 25,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                " ${snapshot_populer.data!.data![index].jobEmploymentType.toString()} ", //
                                                softWrap: true,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 248, 89, 10),
                                                ),
                                              ),
                                              snapshot_populer
                                                          .data!
                                                          .data![index]
                                                          .jobMinSalary ==
                                                      null
                                                  ? const Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Text(
                                                        " Undisclosed ",
                                                        softWrap: true,
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color.fromARGB(
                                                              255, 253, 99, 22),
                                                        ),
                                                      ),
                                                    )
                                                  : Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Text(
                                                        " ${snapshot_populer.data!.data![index].jobMinSalary.toString()},${snapshot_populer.data!.data![index].jobSalaryCurrency.toString()} ",
                                                        softWrap: true,
                                                        style: const TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color.fromARGB(
                                                              255, 253, 99, 22),
                                                        ),
                                                      ),
                                                    ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            " ${snapshot_populer.data!.data![index].jobCity.toString()},${snapshot_populer.data!.data![index].jobCountry}",
                                            softWrap: true,
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w800,
                                                color: Color.fromARGB(
                                                    255, 113, 112, 112)),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor: Colors.white,
                                                  backgroundColor: const Color
                                                      .fromARGB(255, 248, 89,
                                                      10), // Set the text color to white
                                                ),
                                                onPressed: () {
                                                  String url = snapshot_populer
                                                      .data!
                                                      .data![index]
                                                      .jobApplyLink
                                                      .toString();
                                                  if (url.isNotEmpty) {
                                                    launchUrl(Uri.parse(url),
                                                        mode: LaunchMode
                                                            .inAppWebView);
                                                  }
                                                },
                                                child: const Text(
                                                  'Apply', // Set the text for the button
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    letterSpacing:
                                                        1.2, // Set the text color to white
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 22,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Recent Posted Jobs",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 45,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Listofjobs(
                                        "mohali", "today", "RecentData"),
                                  ),
                                );
                              },
                              child: Text(
                                "View all",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 248, 89, 10),
                                  fontSize:
                                      MediaQuery.of(context).size.height / 45,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        FutureBuilder<RecentData>(
                            future: recent.REcent_search("mohali", "today"),
                            builder: (context, snapshot_populer) {
                              if (snapshot_populer.hasData) {
                                return SizedBox(
                                  height: 200,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 3, right: 3),
                                    child: GridView.builder(
                                        shrinkWrap: true,
                                        physics: ScrollPhysics(),
                                        gridDelegate:
                                            new SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 1,
                                                mainAxisSpacing: 2),
                                        itemCount:
                                            snapshot_populer.data!.data!.length,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              var ss = snapshot_populer
                                                  .data!.data![index].jobId
                                                  .toString();
                                              var name = snapshot_populer
                                                  .data!.data![index].jobTitle
                                                  .toString();
                                              var link = snapshot_populer.data!
                                                  .data![index].jobApplyLink
                                                  .toString();
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          job_detail(
                                                              "${ss}",
                                                              "${name}",
                                                              "${link}")));
                                            },
                                            child: Card(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child:
                                                            Emage_exption_recent(
                                                                snapshot_populer,
                                                                index),
                                                      ),
                                                      const SizedBox(
                                                        width: 15,
                                                      ),
                                                      Text(
                                                        " ${snapshot_populer.data!.data![index].employerName.toString()} ",
                                                        style: const TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  Text(
                                                    "${snapshot_populer.data!.data![index].jobTitle.toString()} ",
                                                    textAlign: TextAlign.right,
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const SizedBox(
                                                    height: 25,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        " ${snapshot_populer.data!.data![index].jobEmploymentType.toString()} ",
                                                        softWrap: true,
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color.fromARGB(
                                                              255, 248, 89, 10),
                                                        ),
                                                      ),
                                                      snapshot_populer
                                                                  .data!
                                                                  .data![index]
                                                                  .jobMinSalary ==
                                                              null
                                                          ? const Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(4.0),
                                                              child: Text(
                                                                " Undisclosed ",
                                                                softWrap: true,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          253,
                                                                          99,
                                                                          22),
                                                                ),
                                                              ),
                                                            )
                                                          : Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(4.0),
                                                              child: Text(
                                                                " ${snapshot_populer.data!.data![index].jobMinSalary.toString()},${snapshot_populer.data!.data![index].jobSalaryCurrency} ",
                                                                softWrap: true,
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          253,
                                                                          99,
                                                                          22),
                                                                ),
                                                              ),
                                                            ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  Text(
                                                    " ${"${snapshot_populer.data!.data![index].jobCity.toString()}"},${"${snapshot_populer.data!.data![index].jobCountry.toString()} "}",
                                                    softWrap: true,
                                                    textAlign: TextAlign.start,
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        color: Color.fromARGB(
                                                            255,
                                                            113,
                                                            112,
                                                            112)),
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          foregroundColor:
                                                              Colors.white,
                                                          backgroundColor:
                                                              const Color
                                                                  .fromARGB(
                                                                  255,
                                                                  248,
                                                                  89,
                                                                  10), // Set the text color to white
                                                        ),
                                                        onPressed: () {
                                                          var url =
                                                              snapshot_populer
                                                                  .data!
                                                                  .data![index]
                                                                  .jobApplyLink
                                                                  .toString();
                                                          print("url:${url}");
                                                          if (url.isNotEmpty) {
                                                            launchUrl(
                                                                Uri.parse(url),
                                                                mode: LaunchMode
                                                                    .inAppWebView);
                                                          }
                                                          // Add your onPressed function here
                                                        },
                                                        child: const Text(
                                                          'Apply', // Set the text for the button
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            letterSpacing:
                                                                1.2, // Set the text color to white
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            }),
                      ]),
                ),

                // ],
                //),
                //),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Image Emage_exption_recent(
      AsyncSnapshot<RecentData> snapshot_recent, int index) {
    return snapshot_recent.data!.data![index].employerLogo != null
        ? Image.network(
            "${snapshot_recent.data!.data![index].employerLogo.toString()}",
            height: 35,
          )
        : Image(
            image: AssetImage("job_imges/job.png"),
            height: 35,
          );
  }

  Image Emage_exption(AsyncSnapshot<SearchGet> snapshot_recent, int index) {
    return snapshot_recent.data!.data![index].employerLogo != null
        ? Image.network(
            "${snapshot_recent.data!.data![index].employerLogo.toString()}",
            height: 35,
          )
        : Image(
            image: AssetImage("job_imges/job.png"),
            height: 35,
          );
  }

  ListTile FutureDATA(
      AsyncSnapshot<SearchGet> snapshot, int index, BuildContext context) {
    return ListTile(
      title: Text(
        "${snapshot.data!.data![index].jobTitle.toString()}",
        style: textstyle_device(context),
      ),
      subtitle: Text(
        "Posted-by: ${snapshot.data!.data![index].employerName}   ${snapshot.data!.data![index].jobEmploymentType}",
        style: subtitle_txtstyl(context),
      ),
      trailing: snapshot.data!.data![index].jobMaxSalary == null
          ? Text(
              "Undisclosed",
              style: salry_txtstyle(context),
            )
          : Text(
              "${snapshot.data!.data![index].jobMinSalary} - ${snapshot.data!.data![index].jobMaxSalary} ${snapshot.data!.data![index].jobSalaryCurrency} ${snapshot.data!.data![index].jobSalaryPeriod}",
              style: salry_txtstyle(context),
            ),
      onTap: () {
        var jobid = snapshot.data!.data![index].jobId.toString();
        print(jobid);
      },
    );
  }

  TextStyle salry_txtstyle(BuildContext context) {
    if (MediaQuery.of(context).size.width < 720) {
      return TextStyle(fontWeight: FontWeight.w600, fontSize: 7.5);
    } else if (MediaQuery.of(context).size.width > 720) {
      return TextStyle(fontWeight: FontWeight.w600, fontSize: 22);
    } else {
      return TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: MediaQuery.of(context).size.aspectRatio * 5.4);
    }
  }

  TextStyle subtitle_txtstyl(BuildContext context) {
    if (MediaQuery.of(context).size.width < 720) {
      return TextStyle(fontWeight: FontWeight.w600, fontSize: 8);
    } else if (MediaQuery.of(context).size.width > 720) {
      return TextStyle(fontWeight: FontWeight.w600, fontSize: 22);
    } else {
      return TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: MediaQuery.of(context).size.aspectRatio * 5.4);
    }
  }

  TextStyle textstyle_device(BuildContext context) {
    if (MediaQuery.of(context).size.width < 720) {
      return TextStyle(fontWeight: FontWeight.w600, fontSize: 12);
    } else if (MediaQuery.of(context).size.width > 720) {
      return TextStyle(fontWeight: FontWeight.w600, fontSize: 25);
    } else {
      return TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: MediaQuery.of(context).size.aspectRatio * 5.4);
    }
  }

  Row Choice_chip_time() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ChoiceChip(
          label: Text("Full-Time"),
          selected: isFullTime,
          selectedColor: Colors.amber,
          onSelected: (value) {
            setState(() {
              if (isPartTime) {
                isPartTime = !isPartTime;
              }
              isFullTime = value;
              if (isFullTime) {
                emply_type = "FULLTIME";
              }
              print(emply_type);
            });
          },
        ),
        const SizedBox(
          width: 10,
        ),
        ChoiceChip(
          label: Text("PartTime"),
          selected: isPartTime,
          selectedColor: Colors.blueGrey,
          onSelected: (value) {
            setState(() {
              if (isFullTime) {
                isFullTime = !isFullTime;
              }
              isPartTime = value;
              if (isPartTime) {
                emply_type = "PARTTIME";
              }
              print(emply_type);
            });
          },
        ),
      ],
    );
  }

  TextFormField searchbox() {
    return TextFormField(
      decoration: InputDecoration(
        label: const Text(
          'JOB FINDER',
          style: TextStyle(
            color: Color.fromARGB(255, 248, 89, 10),
          ),
        ),
        hintText: 'Enter Job Description',
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromARGB(255, 248, 89, 10)),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
            width: 1.6,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            if (searchcont.text.isNotEmpty) {
              setState(() {
                search_input = searchcont.text.toString();
                if (isFullTime) {
                  emply_type = "FULLTIME";
                } else if (isPartTime) {
                  emply_type = "PARTIME";
                } else {
                  emply_type = "FULLTIME";
                }
                Timer(Duration(seconds: 1), () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Listofjobs(
                              search_input, emply_type, "searchcont")));
                });
              });
            }
          },
          icon: Icon(Icons.search),
          color: Color.fromARGB(255, 248, 89, 10),
        ),
      ),
      controller: searchcont,
    );
  }

  String Employ(String s) {
    List l = s.split(".");
    return l[1];
  }
}
// Employ("${snapshot_populer.data!.data![index].jobEmploymentType}")