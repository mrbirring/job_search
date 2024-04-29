import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:job_search/MainPages/jobdetail.dart';
import 'package:job_search/Model/recent_mod.dart';
import 'package:job_search/Model/searchBar.dart';
import 'package:job_search/controller/get_search.dart';
import 'package:job_search/controller/recent_cont.dart';
import 'package:job_search/controller/serch_cont.dart';

class Listofjobs extends StatefulWidget {
  String search_input;
  String emply_type;
  String type;
  Listofjobs(String this.search_input, String this.emply_type, String this.type,
      {super.key});

  @override
  State<Listofjobs> createState() => _ListofjobsState();
}

class _ListofjobsState extends State<Listofjobs> {
  Recent_cont recent = Get.put(Recent_cont());

  search_cont aa = Get.put(search_cont());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(
            "${widget.search_input.toUpperCase()}",
            overflow: TextOverflow.ellipsis,
            style: appbar_TextStyle(context),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: widget.type == "searchcont"
            ? FutureBuilder<searchcont>(
                future: aa.getsearch("${widget.search_input.toString()}",
                    "${widget.emply_type}"),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: snapshot.data!.data![index].employerLogo !=
                                      null
                                  ? Image.network(
                                      "${snapshot.data!.data![index].employerLogo.toString()}")
                                  : Image(
                                      image:
                                          AssetImage("job_imges/2334139.jpg")),
                            ),
                            title: Text(
                                " ${snapshot.data!.data![index].jobTitle.toString()} "),
                            subtitle: Text(
                                " ${snapshot.data!.data![index].jobCity.toString()},${snapshot.data!.data![index].jobCountry} "),
                            trailing: IconButton(
                                onPressed: () {
                                  String name = snapshot
                                      .data!.data![index].jobTitle
                                      .toString();
                                  String jobid = snapshot
                                      .data!.data![index].jobId
                                      .toString();
                                  String link = snapshot
                                      .data!.data![index].jobApplyLink
                                      .toString();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              job_detail(jobid, name, link)));
                                },
                                icon: Icon(Icons.info)),
                          );
                        });
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })
            : FutureBuilder<RecentData>(
                future: recent.REcent_search(
                    "${widget.search_input}", "${widget.emply_type}"),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: snapshot.data!.data![index].employerLogo !=
                                      null
                                  ? Image.network(
                                      "${snapshot.data!.data![index].employerLogo.toString()}")
                                  : Image(
                                      image:
                                          AssetImage("job_imges/2334139.jpg")),
                            ),
                            title: Text(
                                " ${snapshot.data!.data![index].jobTitle.toString()} "),
                            subtitle: Text(
                                " ${snapshot.data!.data![index].jobCity.toString()},${snapshot.data!.data![index].jobCountry} "),
                            trailing: IconButton(
                                onPressed: () {
                                  String name = snapshot
                                      .data!.data![index].jobTitle
                                      .toString();
                                  String jobid = snapshot
                                      .data!.data![index].jobId
                                      .toString();
                                  String link = snapshot
                                      .data!.data![index].jobApplyLink
                                      .toString();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              job_detail(jobid, name, link)));
                                },
                                icon: Icon(Icons.info)),
                          );
                        });
                  } else {
                    return Text("${snapshot.error}");
                  }
                }),
      ),
    );
  }

  TextStyle appbar_TextStyle(BuildContext context) {
    if (MediaQuery.of(context).size.width < 720) {
      return TextStyle(fontSize: 15);
    } else {
      return TextStyle(fontSize: 25);
    }
  }
}
