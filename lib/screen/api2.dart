import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class PageApiTwo extends StatefulWidget {
  const PageApiTwo({super.key});

  @override
  State<PageApiTwo> createState() => _PageApiTwoState();
}

class _PageApiTwoState extends State<PageApiTwo> {
  List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Get Api 1'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
        final user = users[index];
        final name = user['first_name'] + "" + user ['last_name'];
        final email = user ['email'];
        final imageUrl = user['avatar'];        return ListTile(
         leading: ClipRRect(
           borderRadius: BorderRadius.circular(100),
           child: Image.network(imageUrl),
         ),
         title: Text(name),
         subtitle: Text(email),
         
         
        );
      }
      ),
      floatingActionButton: FloatingActionButton(onPressed:() {
        getData();
      },
      child: Icon(
        Icons.download,
        color: Colors.white,
      ),
      backgroundColor: Colors.blue,
      ),
    );
  }


void getData() async {
  const  url = 'https://random-data-api.com/api/users/random_user?size=10';
  final  uri = Uri.parse(url);
  final response = await http.get(uri);
  final body  = response.body;
  final json = jsonDecode(body);
setState( () {
  users = json;
});
}
}