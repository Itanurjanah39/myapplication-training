import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_application/models.dart';

class Repository{
  final baseUrl = 'https://66f6181e436827ced975e82f.mockapi.io/api/v1/list';

  Future getData() async{
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if(response.statusCode == 200){
        Iterable it = jsonDecode(response.body);
        List<Blog> listModels = it.map((e) => Blog.fromJson(e)).toList();
        return listModels;
      }
      
    } catch (e) {
      print(e.toString());
    }
  }
}