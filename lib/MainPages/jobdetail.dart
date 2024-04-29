// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:job_search/controller/job_detail_cont.dart';
import 'package:url_launcher/url_launcher.dart';

class job_detail extends StatelessWidget {
  String? s, name, link;
  job_detail(String? this.s, String? this.name, String this.link, {super.key});
  jobdetail_cont ss = Get.put(jobdetail_cont());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Text(
                  "${name}",
                  textAlign: TextAlign.justify,
                  style: appbartxt(context),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            reverse: true,
            child: s == null
                ? Text("data ${s}")
                : FutureBuilder(
                    future: ss.getjobdetail("${s}"),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Padding(
                          padding: EdgeInsets.all(4),
                          child: Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const CircleAvatar(
                                        foregroundImage:
                                            AssetImage("job_imges/joblogo.png"),
                                        radius: 40,
                                        backgroundColor: Colors.white,
                                      ),
                                      Expanded(
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Text(
                                            "${snapshot.data!.data![0].employerName.toString()}",
                                            style: device_stylr(context),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 8.0, right: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${snapshot.data!.data![0].jobEmploymentType.toString()}",
                                        style: employtype_row(context),
                                      ),
                                      snapshot.data!.data![0].jobMaxSalary ==
                                              null
                                          ? Text(
                                              "Undisclosed",
                                              style: employtype_row(context),
                                            )
                                          : SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Text(
                                                "${snapshot.data!.data![0].jobMaxSalary.toString()}${snapshot.data!.data![0].jobSalaryCurrency}/${snapshot.data!.data![0].jobSalaryPeriod}",
                                                style: employtype_row(context),
                                              ),
                                            )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "${snapshot.data!.data![0].jobDescription}",
                                    style: description(context),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    })),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 75,
        color: Colors.transparent,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: BeveledRectangleBorder(side: BorderSide.none),
            foregroundColor: Colors.blue,
          ),
          onPressed: () {
            print(link);
            if (link.toString().isNotEmpty) {
              print(" if test${link} ");
              launchUrl(Uri.parse(link.toString()),
                  mode: LaunchMode.inAppWebView);
            }
          },
          child: Text("Apply"),
        ),
      ),
    );
  }

  TextStyle appbartxt(BuildContext context) {
    if (MediaQuery.of(context).size.width < 720) {
      return TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
      );
    } else if (MediaQuery.of(context).size.width > 720) {
      return TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );
    } else {
      return TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
      );
    }
  }

  TextStyle description(BuildContext context) {
    if (MediaQuery.of(context).size.width < 719) {
      return const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 49, 45, 92));
    } else if (MediaQuery.of(context).size.width > 721) {
      return const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 49, 45, 92));
    } else {
      return const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 49, 45, 92));
    }
  }

  TextStyle employtype_row(context) {
    if (MediaQuery.of(context).size.width < 719) {
      return const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 248, 89, 10));
    } else if (MediaQuery.of(context).size.width > 721) {
      return const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 248, 89, 10));
    } else {
      return const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 248, 89, 10));
    }
  }

  TextStyle device_stylr(BuildContext context) {
    if (MediaQuery.of(context).size.width < 719) {
      return const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
      );
    } else if (MediaQuery.of(context).size.width > 721) {
      return const TextStyle(
        fontSize: 27,
        fontWeight: FontWeight.w700,
      );
    } else {
      return const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
      );
    }
  }
}
