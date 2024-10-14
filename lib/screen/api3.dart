import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PageAPi3 extends StatefulWidget {
  const PageAPi3({super.key});

  @override
  State<PageAPi3> createState() => _PageAPi3State();
}

class _PageAPi3State extends State<PageAPi3> {
  List <dynamic> products = [];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Get Api 3'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: GridView.builder(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
       itemCount: products.length,
       itemBuilder: (context, index) {
        final product = products[index];
        final name = product['title'];
        final dep = product['description'];
        final imageUrl = product['image'];

        return ListTile(
          leading: ClipRRect(
            child: Image.network(imageUrl),
            borderRadius: BorderRadius.circular(100),
          ),
          title: Text(name),
subtitle: Text(dep),
        );
       },
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
  const url = 'https://fakestoreapi.com/products';
 final  uri = Uri.parse(url);
 final response = await http.get(uri);
 final body = response.body;
 final json = jsonDecode(body);

 setState(() {
   products = json;
 });
 }
}