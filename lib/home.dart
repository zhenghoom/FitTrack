import 'package:fit_track/exercise_detail.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Color(0xff242f3f),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    "Workout Guides",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height:5.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    "Target different body parts",
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 22,
                    ),
                  ),
                ),
                SizedBox(height:20.0),
                TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.yellow,
                  labelColor: Colors.yellow,
                  labelStyle: TextStyle(fontSize: 20),
                  labelPadding: EdgeInsets.symmetric(horizontal: 20),
                  tabs: [
                    Tab(text: "Chest"),
                    Tab(text: "Back"),
                    Tab(text: "Legs"),
                    Tab(text: "Shoulders"),
                    Tab(text: "Arms"),
                  ],
                ),
                Flexible(
                    flex: 1,
                    child: TabBarView(
                      children: [
                        GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        childAspectRatio: 0.76,
                        children: [
                          for (int i= 0; i<exerciseChest.length; i++)
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xFF242f3f),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 8,
                                ),
                              ],
                            ),
                            child: Column(children: [
                              InkWell(
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(
                                          builder: (context) => ExerciseDetail(
                                              imagePath: 'lib/assets/chest/${i+1}.jpg',
                                              exerciseName: exerciseChest[i]['name'],
                                              exerciseDescription: exerciseChest[i]['description'],
                                          ),
                                      ),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  child: Image.asset("lib/assets/chest/${i+1}.jpg"),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    exerciseChest[i]['name'],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                        ),
                        GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          childAspectRatio: 0.76,
                          children: [
                            for (int i= 0; i<exerciseBack.length; i++)
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xFF242f3f),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 8,
                                    ),
                                  ],
                                ),
                                child: Column(children: [
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context,
                                        MaterialPageRoute(
                                          builder: (context) => ExerciseDetail(
                                            imagePath: 'lib/assets/back/${i+1}.jpg',
                                            exerciseName: exerciseBack[i]['name'],
                                            exerciseDescription: exerciseBack[i]['description'],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(10),
                                      child: Image.asset("lib/assets/back/${i+1}.jpg"),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      exerciseBack[i]['name'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ],
                                ),
                              ),
                          ],
                        ),
                        GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          childAspectRatio: 0.76,
                          children: [
                            for (int i= 0; i<exerciseLeg.length; i++)
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xFF242f3f),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 8,
                                    ),
                                  ],
                                ),
                                child: Column(children: [
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context,
                                        MaterialPageRoute(
                                          builder: (context) => ExerciseDetail(
                                            imagePath: 'lib/assets/leg/${i+1}.jpg',
                                            exerciseName: exerciseLeg[i]['name'],
                                            exerciseDescription: exerciseLeg[i]['description'],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(10),
                                      child: Image.asset("lib/assets/leg/${i+1}.jpg"),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      exerciseLeg[i]['name'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ],
                                ),
                              ),
                          ],
                        ),
                        GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          childAspectRatio: 0.76,
                          children: [
                            for (int i= 0; i<exerciseShoulder.length; i++)
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xFF242f3f),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 8,
                                    ),
                                  ],
                                ),
                                child: Column(children: [
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context,
                                        MaterialPageRoute(
                                          builder: (context) => ExerciseDetail(
                                            imagePath: 'lib/assets/shoulder/${i+1}.jpg',
                                            exerciseName: exerciseShoulder[i]['name'],
                                            exerciseDescription: exerciseShoulder[i]['description'],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(10),
                                      child: Image.asset("lib/assets/shoulder/${i+1}.jpg"),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      exerciseShoulder[i]['name'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ],
                                ),
                              ),
                          ],
                        ),
                        Container(color: Colors.red),
                      ],
                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Map<String, dynamic>> exerciseChest = [
    {'name':'Bench Press','description':'Step 1:\nLie flat on a bench with both feet firmly on the ground\nStep 2:\nLift the barbell off the rack and hold it over your chest\nStep 3:\nLower the barbell until it touches your chest slightly\nStep 4:\nExhale as you push up\n\nRepititions: 8-12 reps for 3 sets'},
    {'name':'Chest Dips','description':'Step 1:\nLift yourself up with arms fully extended and vertical body\nStep 2:\nLean forward slightly and lower your body with elbows bent\nStep 3:\nPush back up to starting position\n\nRepititions: 8-12 reps for 3 sets'},
    {'name':'Chest Fly','description':'Step 1:\nSit on the machine with back firmly against the back rest\nStep 2:\nInhale and slowly pushes the handles forward until they are fully extended\nStep 3:\nExhale and slowly bring the handles back to original position\n\nRepititions: 8-12 reps for 3 sets'},
    {'name':'Chest Press','description':'Step 1:\nSit on the machine with back firmly against the back rest\nStep 2:\nGrasp the handles with elbows at 90 degrees and wrist straight\nStep 3:\nInhale and slowly presses the handles forward until they are fully extended\nStep 4:\nExhale and slowly bring the handles back to original position\n\nRepititions: 8-12 reps for 3 sets'},
    {'name':'Incline Bench Press','description':'Step 1:\nLie on the bench with body slightly arched back\nStep 2:\nLift the barbell off the rack and hold it over your chest\nStep 3:\nLower the barbell until it touches your chest slightly\nStep 4:\nExhale as you push up\n\nRepititions: 8-12 reps for 3 sets'},
  ];

  List<Map<String, dynamic>> exerciseBack = [
    {'name':'Lat Pulldown','description':'Step 1:\nGrip the bar with a overhand grip that is slightly wider than your shoulder width\nStep 2:\nSit with back straight and back slightly leaned to engage your lats\nStep 3:\nPull the bar down until it almost touches your upper chest\nStep 4:\nExhale and slowly extend your arms to return the bar to starting position\n\nRepititions: 8-12 reps for 3 sets'},
    {'name':'Cable Row','description':'Step 1:\nGrip the bar with a overhand grip and straighten your back\nStep 2:\nPull the cable towards your stomach by bending your elbows\nStep 3:\nSlowly extend your arms to return the cable to starting position\n\nRepititions: 8-12 reps for 3 sets'},
    {'name':'Wide Grip Cable Row','description':'Step 1:\nGrip the bar with a overhand grip that is wider than your shoulder width\nStep 2:\nSit with back straight\nStep 3:\nPull the bar towards your body until it almost touches it\nStep 4:\nExhale and slowly extend your arms to return the bar to starting position\n\nRepititions: 8-12 reps for 3 sets'},
    {'name':'T-Bar Row','description':'Step 1:\nGrip the bar with a overhand grip on the handles\nStep 2:\nLay towards the pad with back straight\nStep 3:\nPull the bar towards your body by bending your elbows in\nStep 4:\nExhale and slowly extend your arms back to starting position\n\nRepititions: 8-12 reps for 3 sets'},
    {'name':'Dumbbell Row','description':'Step 1:\nPlace one knee and the same side hand on a bench\nStep 2:\nKeep your core engaged and back straight\nStep 3:\nInhale and pull it towards your hip by keeping elbow close to body\nStep 4:\nExhale and slowly lower the dumbbell back to starting position\n\nRepititions: 8-12 reps for 3 sets'},
    {'name':'Barbell Row','description':'Step 1:\nStand with your feet shoulder width apart\nStep 2:\nGrip the barbell with overhand grip slightly wider than shoulder width\nStep 3:\nPull the barbell towards your lower ribcage\nStep 4:\nExhale and slowly lower the barbell to starting position\n\nRepititions: 8-12 reps for 3 sets'},
  ];

  List<Map<String, dynamic>> exerciseLeg = [
    {'name':'Barbell Squat','description':'Step 1:\nGrip the bar with hands slightly wider than your shoulder width\nStep 2:\nPlace your feet shoulder width apart and tighten your core\nStep 3:\nBegin the movement by pushing your hips back and bending your knees simultaneously\nStep 4:\nPush through your heels and extend your knees to return to starting position\n\nRepititions: 5-8 reps for 4 sets'},
    {'name':'Leg Extensions','description':'Step 1:\nSet the leg pad on your shins just above your ankles\nStep 2:\nEngage your core muscles to stabilize your body\nStep 3:\nSlowly extend your legs by straightening your knees\nStep 4:\nSlowly lower the weight back to the starting position by bending your knees\n\nRepititions: 8-12 reps for 4 sets'},
    {'name':'Romanian Deadlift','description':'Step 1:\nStand with your feet hip width apart and barbell in front\nStep 2:\nMaintain a slight bend in your knees to reach the bar \nStep 3:\nStand up straight with the barbell and lower the barbell by bending the hips\nStep 4:\nPush with your heels and extend your hips to return to starting position\n\nRepititions: 8-12 reps for 3 sets'},
  ];

  List<Map<String, dynamic>> exerciseShoulder = [
    {'name':'Shoulder Press','description':'Step 1:\nSelect an appropriate weight dumbbell\nStep 2:\nAngle your arms at 45 degrees off your shoulder\nStep 3:\nPress the weight upwards with controlled motion\nStep 4:\nSlowly lower the weight back at shoulder height\n\nRepititions: 8-12 reps for 4 sets'},
    {'name':'Lateral Raises','description':'Step 1:\nSelect a lighter weight of dumbbells to ensure proper form\nStep 2:\nStand with your feet shoulder width apart and knees slightly bent\nStep 3:\nSlowly raise your arms to the sides until they are parallel to the ground\nStep 4:\nSlowly lower the weight back to the starting position by your sides\n\nRepititions: 8-12 reps for 4 sets'},
  ];

}