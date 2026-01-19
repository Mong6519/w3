import 'dart:convert';

import 'user_model.dart';
import 'package:http/http.dart' as http;

class ApiService{

  static Future<List<User>> fetchUser()async{
    final response = await http.get(Uri.parse("https://696d9a8cd7bacd2dd7141441.mockapi.io/users"));
        if(response.statusCode == 200){
    final List data = jsonDecode(response.body);
    return data.map((e) => User.fromJson(e)).toList();
    }else{
          throw Exception('โหลดข้อมูลไม่สำเร็จ');
    }
  }
}