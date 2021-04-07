import 'package:flutter/material.dart';
import 'package:movies/screens/searchpage.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF485160),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text("Movie app",style: TextStyle(fontSize: 40,color: Colors.white70),),
          ),
          Image.asset('images/main-page-image.jpg'),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPage()));
            },
            child: Text("Search For Movies"),
          ),
        ],
      ),
    );
  }
}
