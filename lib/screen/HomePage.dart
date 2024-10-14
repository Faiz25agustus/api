import 'package:api_pusing/screen/api2.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('get Api'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      floatingActionButton: FloatingActionButton(onPressed:() {
        MaterialPageRoute(builder:(context) {
          return PageApiTwo();
        },);
      },
      child: Text(
        'Api 1'
      ),
      backgroundColor: Colors.blue,
      ),
    );
  }
}