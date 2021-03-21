import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:termin_manager/models/customer.dart';

class HttpService {
/*
  final String postsUrl = "http://207.154.196.186:8081/customer";
  var url = "http://207.154.196.186:8081/customer";
  final String postsUrl_meeting = "207.154.196.186:8081/appointment";

  Future<List<Post>> getPosts() async {
    Response res = await http.get("http://207.154.196.186:8081/customer");

    if(res.statusCode == 200){
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts = body.map((dynamic item) => Post.fromJson(item)).toList();

      return posts;
    }
    else{
      throw "Can't get posts.";
    }
  }
*/
  Future<Customer> createCustomer(String vorname) async {
    final response = await http.post(
        Uri.https('207.154.196.186:8081', 'customer'),
        headers: <String, String>{
          'Content-Tpye': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'forename': vorname,
        }));

    if (response.statusCode == 201) {
      return Customer.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed');
    }
  }
}
