dependencies:
flutter:
sdk: flutter
dio: ^5.0.9  # Add dio package for HTTP requests
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

// Function to fetch data using Dio
Future<Course> fetchCourse() async {
  final dio = Dio();
  final response = await dio.get('https://dhruvin.pythonanywhere.com/showdata/CA102');

  if (response.statusCode == 200) {
    return Course.fromJson(response.data);
  } else {
    throw Exception('Failed to load Data!');
  }
}

// Model class for the Course
class Course {
  final String coursecode;
  final String coursename;
  final String cincharge;

  Course({
    required this.coursecode,
    required this.coursename,
    required this.cincharge,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      coursecode: json['coursecode'],
      coursename: json['coursename'],
      cincharge: json['cincharge'],
    );
  }
}

void main() {
  runApp(const MyApp());
}

// MyApp widget
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// State class for MyApp
class _MyAppState extends State<MyApp> {
  late Future<Course> futureCourse;

  @override
  void initState() {
    super.initState();
    futureCourse = fetchCourse();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Fetch with Dio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Course Information'),
        ),
        body: Center(
          child: FutureBuilder<Course>(
            future: futureCourse,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(); // Loading indicator
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}"); // Show error message
              } else if (snapshot.hasData) {
                final course = snapshot.data!;
                return Text('Course Incharge: ${course.cincharge}');
              } else {
                return const Text('No Data Available');
              }
            },
          ),
        ),
      ),
    );
  }
}
