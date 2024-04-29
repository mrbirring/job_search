import 'dart:convert';

import 'package:get/get.dart';
import 'package:job_search/Model/search_model.dart';
import 'package:http/http.dart' as http;

class search extends GetxController {
  Future<SearchGet> getsearch(String search_input, String emply_type) async {
    var uri =
        "https://jsearch.p.rapidapi.com/search?query=$search_input&page=1&num_pages=1&date_posted=all&remote_jobs_only=false&employment_types=$emply_type&job_requirements=no_experience";
    var responce = await http.get(Uri.parse(uri), headers: {
      'X-RapidAPI-Key': 'c04a2a8f53msh0d9ee9b26c6c23fp1608a6jsn1550b5c33e60'
    });

    var data = jsonDecode(responce.body);
    try {
      if (responce.statusCode == 200) {
        return SearchGet.fromJson(data);
      } else {
        print("no data");
        return SearchGet.fromJson(data);
      }
    } catch (e) {
      print(e);
      return SearchGet.fromJson(data);
    }
  }
}
