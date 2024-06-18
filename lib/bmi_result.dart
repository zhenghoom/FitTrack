import 'package:fit_track/diet_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BMIResult extends StatelessWidget{

  final String bmiResult;
  Image? bmiImage;
  String? bmiStatus;
  Color? bmiStatusColor;

  BMIResult({required this.bmiResult});

  @override
  Widget build(BuildContext context) {

    double bmiValue = double.parse(bmiResult);
    BMIClass(bmiValue);

    return Scaffold(
      backgroundColor: Color(0xff242f3f),
      appBar: AppBar(
        title: Text("BMI Result", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color(0xff27243f),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(child: bmiImage),
            SizedBox(height: 30.0),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Your BMI is: ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: bmiResult,
                    style: TextStyle(
                      color: Colors.purple, // Set color to purple for bmiResult
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              "$bmiStatus",
              style: TextStyle(
                color: bmiStatusColor,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.0),
            Center(
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>DietPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xff3f3434),
                  fixedSize: const Size(
                      400,50
                  ),
                ),
                child: Text("View Diet"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void BMIClass(double bmiValue){

    if (bmiValue > 30){
      bmiStatus = "Obese";
      bmiStatusColor = Colors.pinkAccent;
      bmiImage = Image.asset('lib/assets/obesity.png', width: 250,height: 250,);
    } else if(bmiValue >= 25){
      bmiStatus = "Overweight";
      bmiStatusColor = Colors.yellow;
      bmiImage = Image.asset('lib/assets/fat.png', width: 250,height: 250,);
    } else if(bmiValue >= 18.5){
      bmiStatus = "Normal";
      bmiStatusColor = Colors.green;
      bmiImage = Image.asset('lib/assets/body.png', width: 250,height: 250,);
    } else if(bmiValue < 18.5){
      bmiStatus = "Underweight";
      bmiStatusColor = Colors.lightBlueAccent;
      bmiImage = Image.asset('lib/assets/slim.png', width: 250,height: 250,);

    }
  }

}