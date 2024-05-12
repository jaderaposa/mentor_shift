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
  Activity({required this.title, required this.difficulty});

  String title;
  String difficulty;
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

  final List<Lesson> lessons = [
    Lesson(title: 'Lesson 1', difficulties: [
      Difficulty(title: 'Beginner', activities: [
        Activity(title: 'Activity 1', difficulty: 'Beginner'),
        Activity(title: 'Activity 2', difficulty: 'Beginner'),
        // Add more activities as needed
      ]),
      Difficulty(title: 'Intermediate', activities: [
        Activity(title: 'Activity 3', difficulty: 'Intermediate'),
        Activity(title: 'Activity 4', difficulty: 'Intermediate'),
        // Add more activities as needed
      ]),
      // Add more difficulties as needed
    ]),
    // Add more lessons as needed
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ), // replace with your custom back button
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        // title: const Text(
        //   'Mentee',
        //   style: TextStyle(
        //     color: Colors.white,
        //     fontSize: 30.0,
        //     fontFamily: 'ProtestRiot',
        //   ),
        // ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            '$mentorName\'s Classroom',
            style: const TextStyle(
                fontSize: 24, color: Colors.white, fontFamily: 'ProtestRiot'),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.white, // Set the color of the text
              labelStyle: TextStyle(
                // Set the style of the text
                fontSize: MediaQuery.of(context).size.width *
                    0.03, // Adjust the font size based on the screen width
                fontFamily: 'ProtestRiot',
              ),
              unselectedLabelColor:
                  Colors.grey, // Set the color of the unselected tabs
              indicatorSize: TabBarIndicatorSize
                  .label, // This will make the line under the tabs disappear
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: Colors.white, // Set the color of the line
                  width: 3.0, // Set the width of the line
                ),
              ),
              tabs: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 5), // Add padding to the tabs
                  child: Row(
                    children: [
                      const Expanded(
                        child: FittedBox(child: Text('Lessons')),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Image.asset('images/icons/lessons.png',
                          width: 20, height: 20),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 5), // Add padding to the tabs
                  child: Row(
                    children: [
                      const Expanded(
                          child: FittedBox(child: Text('Activities'))),
                      const SizedBox(
                        width: 5,
                      ),
                      Image.asset('images/icons/activities.png',
                          width: 20, height: 20),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 5), // Add padding to the tabs
                  child: Row(
                    children: [
                      const Expanded(child: FittedBox(child: Text('Reports'))),
                      const SizedBox(
                        width: 5,
                      ),
                      Image.asset('images/icons/reports.png',
                          width: 20, height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount:
                      lessons.length, // Use the length of the lessons list
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xff00978e), Color(0xff00312e)],
                        ),
                        border: Border.all(
                          color: Colors.black, // Set the color of the border
                          width: 1.5, // Set the width of the border
                        ),
                        boxShadow: const [kBoxShadow],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          lessons[index]
                              .title, // Use the lesson title from the list
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'ProtestRiot',
                          ),
                        ),
                      ),
                    );
                  },
                ),
                ListView.builder(
                  itemCount: lessons.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomExpansionTile(
                      titleBuilder: (bool isExpanded) => Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: const Color(0xffed2591),
                          border: Border.all(
                            color: Colors.black, // Set the color of the border
                            width: 1.5, // Set the width of the border
                          ),
                          boxShadow: const [kBoxShadow],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  lessons[index]
                                      .title, // Use the lesson title from the list
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'ProtestRiot',
                                  ),
                                ),
                              ),
                            ),
                            Transform.rotate(
                              angle: isExpanded ? math.pi : 0,
                              child: const Icon(
                                Icons.arrow_drop_up,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      children: lessons[index]
                          .difficulties
                          .map<Widget>((Difficulty difficulty) {
                        return _buildDifficultyContainer(difficulty);
                      }).toList(),
                    );
                  },
                ),
                const Center(child: Text('Reports Content')),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0, // set the currently selected item
        onTap: (index) {
          // handle the tap event
        },
      ),
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
                width: 1.5, // Set the width of the border
              ),
              boxShadow: const [kBoxShadow],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      difficulty
                          .title, // Use the difficulty title from the list
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'ProtestRiot',
                      ),
                    ),
                  ),
                ),
                Transform.rotate(
                  angle: isExpanded ? math.pi : 0,
                  child: const Icon(
                    Icons.arrow_drop_up,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          children: difficulty.activities.map<Widget>((Activity activity) {
            return _buildActivityContainer(activity);
          }).toList(),
        ),
      ),
    );
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
            color: const Color(0xff95416f),
            border: Border.all(
              color: Colors.black, // Set the color of the border
              width: 1.5, // Set the width of the border
            ),
            boxShadow: const [kBoxShadow],
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    activity.title, // Use the activity title from the list
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'ProtestRiot',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
