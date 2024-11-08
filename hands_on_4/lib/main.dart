import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Working with Images'),
        ),
        body: Center(
          child: Column(
            children: [
              Image.network('https://th.bing.com/th/id/R.1fa6a6f2f9faf0c920f848c57dd19de3?rik=wSD1vxJM4vIoXQ&riu=http%3a%2f%2f2.bp.blogspot.com%2f-SrFbk8kjkSQ%2fT5vxXVDu-wI%2fAAAAAAAAFMU%2forInaTrNa7I%2fs1600%2fMr%2bBean%2bfunny%2bface%2b(5).png&ehk=pyMwVhY5VnqYBKq7tl7R7G%2bgh6XZ9wXwe13SjUIiIHo%3d&risl=&pid=ImgRaw&r=0', width: 800,height: 700),
              const Image(image: AssetImage('assets/new-logo.png')),
              Text(
                'Welcome to NUV',
                style: TextStyle(fontSize: 50.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}

