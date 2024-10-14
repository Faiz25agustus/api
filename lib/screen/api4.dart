import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ShopApi extends StatefulWidget {
  const ShopApi({super.key});

  @override
  State<ShopApi> createState() => _ShopApiState();
}

class _ShopApiState extends State<ShopApi> {
  List <dynamic> products = [];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(onPressed:() {
        getData();
      },
      child: Icon(
        Icons.send,
        color: Colors.white,
      ),
      backgroundColor: Colors.blue,
      ),
      body: GridView.builder(
        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        final name = product["title"];
        final price = product["description"];
        final imageUrl = product["image"];
        return ListTile(
leading: ClipRRect(
  borderRadius: BorderRadius.circular(100),
 child: Image.network(imageUrl),
),
title: Text(name),


        );
      },
      ),
    );
  }


 void getData() async {
  const url = 'https://fakestoreapi.com/products';
  final uri = Uri.parse(url);
  final response = await http.get(uri);
  final body = response.body;
  final json = jsonDecode(body);

  setState( () {
 products = json;
  }
  );
 }
}



