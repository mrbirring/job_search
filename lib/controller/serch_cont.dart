import 'dart:convert';

import 'package:get/get.dart';
import 'package:job_search/Model/searchBar.dart';
import 'package:http/http.dart' as http;

class search_cont extends GetxController {
  Future<searchcont> getsearch(String search_input, String emply_type) async {
    var uri =
        "https://jsearch.p.rapidapi.com/search?query=$search_input&page=1&num_pages=1&date_posted=all&remote_jobs_only=false&employment_types=$emply_type&job_requirements=no_experience";
    var responce = await http.get(Uri.parse(uri), headers: {
      'X-RapidAPI-Key': '46a3491eafmsh88bb5097de05402p11650bjsnca51e67217c4'
    });

    var data = jsonDecode(responce.body);
    try {
      if (responce.statusCode == 200) {
        return searchcont.fromJson(data);
      } else {
        print("no data");
        return searchcont.fromJson(data);
      }
    } catch (e) {
      print(e);
      return searchcont.fromJson(data);
    }
  }
}
