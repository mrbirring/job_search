import 'dart:convert';

import 'package:get/get.dart';
import 'package:job_search/Model/recent_mod.dart';
import 'package:http/http.dart' as http;

class Recent_cont extends GetxController {
  Future<RecentData> REcent_search(String search_input, String time) async {
    var uri =
        "https://jsearch.p.rapidapi.com/search?query=$search_input&page=1&num_pages=1&date_posted=$time&remote_jobs_only=false&employment_types=FULLTIME&job_requirements=no_experience";
    var responce = await http.get(Uri.parse(uri), headers: {
      'X-RapidAPI-Key': '46a3491eafmsh88bb5097de05402p11650bjsnca51e67217c4'
    });

    var data = jsonDecode(responce.body);

    if (responce.statusCode == 200) {
      return RecentData.fromJson(data);
    } else {
      print("no data");
      return RecentData.fromJson(data);
    }
  }
}
