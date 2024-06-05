//import dart
import 'package:flutter/material.dart';
import 'package:mentor_shift/objects/bottomnav.dart';
import 'package:mentor_shift/objects/cet.dart';
import 'package:mentor_shift/objects/style/boxshadow.dart';
import 'dart:math' as math;

class MentorLearningPage extends StatefulWidget {
  const MentorLearningPage({super.key});

  @override
  State<MentorLearningPage> createState() => _MentorLearningPageState();
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

class _MentorLearningPageState extends State<MentorLearningPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String mentorName = 'John Doe'; // Add this line

  List<Lesson> lessons = []; // Initialize lessons as an empty list

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    fetchLessons(); // Fetch lessons when the state is initialized
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
      backgroundColor: const Color(0xFF4C9A91),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4C9A91),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF00312E),
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '$mentorName\'s Classroom',
            style: const TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontFamily: 'ProtestRiot',
            ),
          ),
        ),
      ),
      body: Column(children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.white, // Set the color of the text
              labelStyle: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.03,
                fontFamily: 'ProtestRiot',
                shadows: const <Shadow>[
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
              indicator: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(15), // Add this to give radius
                color: const Color.fromARGB(
                    80, 61, 61, 61), // This is your selected color
              ),
              indicatorColor:
                  Colors.transparent, // This will make the line invisible
              dividerColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize
                  .tab, // This will make the line under the tabs disappear
              tabs: [
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Lessons',
                        style: TextStyle(
                          fontSize: math.min(MediaQuery.of(context).size.width,
                                  MediaQuery.of(context).size.height) *
                              0.04, // Adjust this value
                        ),
                      ),
                      const SizedBox(width: 7),
                      Image.asset('images/icons/lessons.png',
                          width: MediaQuery.of(context).size.width *
                              0.05, // Adjust this value
                          height: MediaQuery.of(context).size.height *
                              0.05), // Adjust this value
                    ],
                  ),
                ),
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Activities',
                        style: TextStyle(
                          fontSize: math.min(MediaQuery.of(context).size.width,
                                  MediaQuery.of(context).size.height) *
                              0.035, // Adjust this value
                        ),
                      ),
                      const SizedBox(width: 7),
                      Image.asset('images/icons/activities.png',
                          width: MediaQuery.of(context).size.width *
                              0.05, // Adjust this value
                          height: MediaQuery.of(context).size.height *
                              0.05), // Adjust this value
                    ],
                  ),
                ),
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Reports',
                        style: TextStyle(
                          fontSize: math.min(MediaQuery.of(context).size.width,
                                  MediaQuery.of(context).size.height) *
                              0.04, // Adjust this value
                        ),
                      ),
                      const SizedBox(width: 7),
                      Image.asset('images/icons/reports.png',
                          width: MediaQuery.of(context).size.width *
                              0.05, // Adjust this value
                          height: MediaQuery.of(context).size.height *
                              0.05), // Adjust this value
                    ],
                  ),
                ),
              ],
            )),
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
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              decoration: BoxDecoration(
                color: const Color(0xFF367B75), // Set the color of the box
                borderRadius:
                    BorderRadius.circular(10.0), // Set the border radius
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: const Text(
                      'Your Mentee Report',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'ProtestRiot',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Aligns the Row at the top
                      children: [
                        Flexible(
                          flex: 3, // Takes up 3/4 of the space
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: const Color(
                                  0xFF4D9A91), // Set the color of the rectangle box
                              border: Border.all(
                                color: Colors.black, // Set border color
                                width: 1.5, // Set border width
                              ),
                              borderRadius: BorderRadius.circular(
                                  8.0), // Set border radius
                              boxShadow: const [kBoxShadow],
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: lessons.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            lessons[index].title.toUpperCase(),
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'ProtestRiot'),
                                          ),
                                          ...lessons[index]
                                              .difficulties
                                              .map((difficulty) {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  difficulty.title,
                                                  style: const TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                ...difficulty.activities
                                                    .map((activity) {
                                                  return Text(
                                                    '- ${activity.title} - ${activity.score}/${activity.totalScore}',
                                                    style: const TextStyle(
                                                        fontSize: 16),
                                                  );
                                                }).toList(),
                                              ],
                                            );
                                          }).toList(),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 2, // Takes up 1/4 of the space
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              return Column(
                                children: [
                                  Container(
                                    width: constraints.maxWidth,
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF1F5A56),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Text(
                                            '10/10',
                                            softWrap: true,
                                            style: TextStyle(
                                              fontSize: 50.0 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  500,
                                              fontFamily: 'ProtestRiot',
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Completed Activities',
                                          softWrap: true,
                                          style: TextStyle(
                                            fontSize: 13.0 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                500,
                                            fontFamily: 'ProtestRiot',
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    width: constraints.maxWidth,
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF1F5A56),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Text(
                                            'B+',
                                            softWrap: true,
                                            style: TextStyle(
                                              fontSize: 50.0 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  500,
                                              fontFamily: 'ProtestRiot',
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Grading Report',
                                          softWrap: true,
                                          style: TextStyle(
                                            fontSize: 15.0 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                500,
                                            fontFamily: 'ProtestRiot',
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ]))
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
