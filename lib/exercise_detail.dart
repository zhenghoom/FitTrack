import 'package:flutter/material.dart';

class ExerciseDetail extends StatelessWidget {
  final String imagePath;
  final String exerciseName;
  final String exerciseDescription;

  ExerciseDetail({
    required this.imagePath,
    required this.exerciseName,
    required this.exerciseDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff242f3f),
      appBar: AppBar(
        title: Text('Exercise Detail', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color(0xff27243f),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              width: 350,
              height: 350,
            ),
            SizedBox(height: 20),
            Text(
              exerciseName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              exerciseDescription,
              style: TextStyle(
                color: Colors.white60,
                fontSize: 16,
              ),
            ),
            // Add more details or widgets as needed
          ],
        ),
      ),
    );
  }
}
