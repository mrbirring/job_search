import 'dart:convert';

import 'package:get/get.dart';
import 'package:job_search/Model/job_detail_model.dart';
import 'package:http/http.dart' as http;

class jobdetail_cont extends GetxController {
  Future<JobDetail> getjobdetail(String jobid) async {
    var uri =
        "https://jsearch.p.rapidapi.com/job-details?job_id=${jobid}&extended_publisher_details=false";
    var responce = await http.get(Uri.parse(uri), headers: {
      'X-RapidAPI-Key': '46a3491eafmsh88bb5097de05402p11650bjsnca51e67217c4'
    });

    var data = jsonDecode(responce.body);

    if (responce.statusCode == 200) {
      return JobDetail.fromJson(data);
    } else {
      return JobDetail.fromJson(data);
    }
  }
}
