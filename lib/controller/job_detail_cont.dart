import 'dart:convert';

import 'package:get/get.dart';
import 'package:job_search/Model/job_detail_model.dart';
import 'package:http/http.dart' as http;

class jobdetail_cont extends GetxController {
  Future<JobDetail> getjobdetail(String jobid) async {
    var uri =
        "https://jsearch.p.rapidapi.com/job-details?job_id=${jobid}&extended_publisher_details=false";
    var responce = await http.get(Uri.parse(uri), headers: {
      'X-RapidAPI-Key': 'c04a2a8f53msh0d9ee9b26c6c23fp1608a6jsn1550b5c33e60'
    });

    var data = jsonDecode(responce.body);

    if (responce.statusCode == 200) {
      return JobDetail.fromJson(data);
    } else {
      return JobDetail.fromJson(data);
    }
  }
}
