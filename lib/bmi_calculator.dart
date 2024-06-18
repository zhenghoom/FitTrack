import 'package:fit_track/bmi_result.dart';
import 'package:flutter/material.dart';
import 'package:fit_track/main.dart';

class BMICalculator extends StatefulWidget{
  BMICalculator({Key? key}): super(key: key);

  @override
  _BMICalculatorState createState() => _BMICalculatorState();

}

class _BMICalculatorState extends State<BMICalculator>{
  int currentIndex = 0;
  String result = "";
  double testresult = 0;
  double height = 0;
  double weight = 0;

  TextEditingController heightText = TextEditingController();
  TextEditingController weightText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Color(0xff242f3f),
        appBar: AppBar(
          title: Text(
            "BMI Calculator",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xff27243f),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select your gender: ",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xffa8b7cd),
                  ),
                ),
                SizedBox(height: 10.0,),
                Row(
                  children: [
                    radioButton("Male", Colors.blue, 0, icon: Icon(Icons.man_sharp), iconSize: 35.0),
                    radioButton("Female", Colors.pink, 1, icon: Icon(Icons.woman_sharp), iconSize: 35.0),
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(
                  "Enter your height in cm: ",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xffa8b7cd),
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  controller: heightText,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Height (cm)",
                    filled: true,
                    fillColor: Color(0xff37475f),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Text(
                  "Enter your weight in kg: ",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xffa8b7cd),
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  controller: weightText,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Weight (kg)",
                    filled: true,
                    fillColor: Color(0xff37475f),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Center(
                  child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          height = double.parse(heightText.value.text);
                          weight = double.parse(weightText.value.text);

                        });
                        calculateBMI(height, weight);
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>BMIResult(bmiResult: result),
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
                      child: Text("Calculate"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculateBMI(double height, double weight){
    testresult = weight / (height * height / 10000);
    String bmi = testresult.toStringAsFixed(2);

    setState(() {
      result = bmi;
    });
  }


  void changeIndex(int index){
    setState(() {
      currentIndex = index;
    });
  }

  Widget radioButton(String value, Color color, int index, {required Icon icon, double iconSize = 0}){
    return Expanded(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12.0),
          height: 90.0,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: currentIndex == index ? color: Colors.grey[500],
              foregroundColor: Colors.white,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onPressed: () {
              changeIndex(index);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon.icon, size: iconSize),
                SizedBox(width: 8,),
                Text(
                  value,
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
    );
  }
}