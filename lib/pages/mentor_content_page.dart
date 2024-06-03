import 'package:flutter/material.dart';
import 'package:mentor_shift/objects/bottomnav.dart';
import 'package:mentor_shift/objects/cet.dart';
import 'package:mentor_shift/objects/style/boxshadow.dart';
import 'dart:math' as math;

class MentorContentPage extends StatefulWidget {
  const MentorContentPage({super.key});
  @override
  State<MentorContentPage> createState() => _MentorContentPageState();
}

class Activity {
  final String title;
  final String difficulty;
  final int score;
  final int totalScore;

  const Activity({
    required this.title,
    required this.difficulty,
    required this.score,
    required this.totalScore,
  });
}

class Difficulty {
  Difficulty(
      {required this.title, this.isExpanded = false, required this.activities});

  String title;
  bool isExpanded;
  List<Activity> activities;
}

class Lesson {
  Lesson({required this.title, required this.difficulties});

  String title;
  List<Difficulty> difficulties;
}

class _MentorContentPageState extends State<MentorContentPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Lesson> lessons = [];

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 2, vsync: this); // Change length to 2
    fetchLessons();
  }

  Future<void> fetchLessons() async {
    // Define your difficulty levels
    List<String> difficulties = [
      'Beginner',
      'Intermediate',
      'Advanced',
      'Expert'
    ];

    // Define your activities for each lesson
    Map<String, List<Activity>> lessonActivities = {
      'Lesson 1': [
        const Activity(
            title: 'Activity 1',
            difficulty: 'Beginner',
            score: 9,
            totalScore: 10),
        const Activity(
            title: 'Activity 2',
            difficulty: 'Beginner',
            score: 45,
            totalScore: 45),
        const Activity(
            title: 'Activity 3',
            difficulty: 'Beginner',
            score: 9,
            totalScore: 10),
        const Activity(
            title: 'Activity 4',
            difficulty: 'Beginner',
            score: 45,
            totalScore: 45)
      ],
      'Lesson 2': [
        const Activity(
            title: 'Activity 5',
            difficulty: 'Expert',
            score: 25,
            totalScore: 50),
        const Activity(
            title: 'Activity 6',
            difficulty: 'Intermediate',
            score: 15,
            totalScore: 30),
        const Activity(
            title: 'Activity 7',
            difficulty: 'Advanced',
            score: 20,
            totalScore: 40),
        const Activity(
            title: 'Activity 8',
            difficulty: 'Expert',
            score: 25,
            totalScore: 50)
      ]
      // Add more lessons as needed
    };

    // Use lessonActivities
    int itemCount = lessonActivities.keys.length;
    String lesson = lessonActivities.keys.elementAt(0);
    List<Activity> activities = lessonActivities[lesson]!;

    for (String lessonTitle in lessonActivities.keys) {
      List<Activity> activities = lessonActivities[lessonTitle] ?? [];
      List<Difficulty> lessonDifficulties =
          []; // Create a list to hold the Difficulty objects

      for (String difficulty in difficulties) {
        // Filter the activities for the current difficulty level
        List<Activity> activitiesForDifficulty = activities
            .where((activity) => activity.difficulty == difficulty)
            .toList();
        lessonDifficulties.add(Difficulty(
            title: difficulty,
            activities:
                activitiesForDifficulty)); // Add the Difficulty object to the list
      }
      lessons.add(Lesson(
          title: lessonTitle,
          difficulties:
              lessonDifficulties)); // Add a Lesson object to the lessons list for each lesson
    }

    setState(() {}); // Call setState to update the UI
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B6E6D),
      appBar: AppBar(
          backgroundColor: const Color(0xFF0B6E6D),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          centerTitle: true),
      body: Column(children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF00312E),
            borderRadius: BorderRadius.circular(12.0), // Set the border radius
          ),
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'My Content',
            style: TextStyle(
              fontSize:
                  MediaQuery.of(context).size.width * 0.07, // Adjust this value
              color: Colors.white,
              fontFamily: 'ProtestRiot',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: TabBar(
              controller: _tabController,
              labelColor: Colors.white,
              labelStyle: const TextStyle(
                fontFamily: 'ProtestRiot',
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 1.0,
                    color: Colors.black,
                  ),
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 1.0,
                    color: Colors.black,
                  ),
                ],
              ),
              unselectedLabelColor: Colors.white,
              indicator: const BoxDecoration().copyWith(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(80, 61, 61, 61),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Colors.transparent,
                  width: 0,
                ),
              ),
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              // indicatorSize: TabBarIndicatorSize.label, // Change this line
              tabs: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Text(
                    'Lessons',
                    style: TextStyle(
                        fontSize: math.min(
                                MediaQuery.of(context).size.width,
                                MediaQuery.of(context).size.height) *
                            0.06, // Adjust this value
                        ),
                  ),
                  Image.asset('images/icons/lessons.png',
                      width: MediaQuery.of(context).size.width *
                          0.07, // Adjust this value
                      height: MediaQuery.of(context).size.height *
                          0.07), // Adjust this value
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Text(
                    'Activities',
                    style: TextStyle(
                        fontSize: math.min(
                                MediaQuery.of(context).size.width,
                                MediaQuery.of(context).size.height) *
                            0.06, // Adjust this value
                        ),
                  ),
                  Image.asset('images/icons/activities.png',
                      width: MediaQuery.of(context).size.width *
                          0.07, // Adjust this value
                      height: MediaQuery.of(context).size.height *
                          0.07), // Adjust this value
                ]),
              ]),
        ),
        Expanded(
          child: TabBarView(controller: _tabController, children: [
            ListView.builder(
                itemCount: lessons.length + 1, // Increase the itemCount by 1
                itemBuilder: (BuildContext context, int index) {
                  if (index == lessons.length) {
                    return const Padding(
                        padding: EdgeInsets.only(
                            bottom: 20.0)); // Add your desired space here
                  } else {
                    return Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 20),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xff00978e), Color(0xff00312e)]),
                            border: Border.all(
                                color:
                                    Colors.black, // Set the color of the border
                                width: 1.5 // Set the width of the border
                                ),
                            boxShadow: const [kBoxShadow]),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                                lessons[index]
                                    .title, // Use the lesson title from the list
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'ProtestRiot'))));
                  }
                }),
            ListView.builder(
                itemCount: lessons.length + 1, // Increase the itemCount by 1
                itemBuilder: (BuildContext context, int index) {
                  if (index == lessons.length) {
                    return const Padding(
                        padding: EdgeInsets.only(
                            bottom: 20.0)); // Add your desired space here
                  } else {
                    return CustomExpansionTile(
                        titleBuilder: (bool isExpanded) => Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: const Color(0xffed2591),
                                border: Border.all(
                                    color: Colors
                                        .black, // Set the color of the border
                                    width: 1.5 // Set the width of the border
                                    ),
                                boxShadow: const [kBoxShadow]),
                            child: Row(children: [
                              Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Text(
                                          lessons[index]
                                              .title, // Use the lesson title from the list
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontFamily: 'ProtestRiot')))),
                              Transform.rotate(
                                  angle: isExpanded ? math.pi : 0,
                                  child: const Icon(Icons.arrow_drop_up,
                                      color: Colors.white))
                            ])),
                        children: lessons[index]
                            .difficulties
                            .map<Widget>((Difficulty difficulty) {
                          return _buildDifficultyContainer(difficulty);
                        }).toList());
                  }
                }),
          ]),
        ),
      ]),
    );
  }

  Widget _buildDifficultyContainer(Difficulty difficulty) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
        child: Align(
            alignment: Alignment.centerRight,
            child: CustomExpansionTile(
                titleBuilder: (bool isExpanded) => Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xff95416f),
                        border: Border.all(
                            color: Colors.black, // Set the color of the border
                            width: 1.5 // Set the width of the border
                            ),
                        boxShadow: const [kBoxShadow]),
                    child: Row(children: [
                      Expanded(
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                  difficulty
                                      .title, // Use the difficulty title from the list
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'ProtestRiot')))),
                      Transform.rotate(
                          angle: isExpanded ? math.pi : 0,
                          child: const Icon(Icons.arrow_drop_up,
                              color: Colors.white))
                    ])),
                children:
                    difficulty.activities.map<Widget>((Activity activity) {
                  return _buildActivityContainer(activity);
                }).toList())));
  }

  Widget _buildActivityContainer(Activity activity) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(65, 5, 25, 5),
        child: Align(
            alignment: Alignment.centerRight,
            child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xff52002D),
                    border: Border.all(
                        color: Colors.black, // Set the color of the border
                        width: 1.5 // Set the width of the border
                        ),
                    boxShadow: const [kBoxShadow]),
                child: Row(children: [
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                              activity
                                  .title, // Use the activity title from the list
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'ProtestRiot'))))
                ]))));
  }
}
