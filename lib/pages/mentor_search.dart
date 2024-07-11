import 'package:flutter/material.dart';
// import 'package:mentor_shift/objects/bottomnav.dart';
import 'package:mentor_shift/objects/style/boxshadow.dart';
// import 'package:mentor_shift/objects/style/paddedcontainer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mentor_shift/pages/view_mentor.dart';
import 'package:mentor_shift/services/auth_service.dart';

class MentorSearch extends StatefulWidget {
  const MentorSearch({super.key});

  @override
  State<MentorSearch> createState() => MentorSearchState();
}

class MentorSearchState extends State<MentorSearch> {
  String dropdownValue = 'NAME';
  final TextEditingController _searchController = TextEditingController();
  List<UserDetails> searchResults = []; // Use UserDetails directly
  List<UserDetails> allMentors =
      []; // This should contain all available mentors
  late Future<void> _mentorsFuture;

  @override
  void initState() {
    super.initState();
    _mentorsFuture = fetchMentors(); // Initialize the future here
  }

  // Make sure fetchMentors returns a Future
  Future<void> fetchMentors() async {
    final mentors = <UserDetails>[];
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('role', isEqualTo: 'mentor')
          .get();
      for (var doc in querySnapshot.docs) {
        mentors.add(UserDetails.fromDocument(doc));
      }
      setState(() {
        allMentors = mentors;
        searchResults = List.from(allMentors);
      });
    } catch (e) {
      print("Error fetching mentors: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4C9A91),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4C9A91),
        // leading: IconButton(
        //   icon: const Icon(
        //     Icons.arrow_back,
        //     color: Colors.white,
        //   ), // replace with your custom back button
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        // ),
        title: const Text(
          'Search',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontFamily: 'ProtestRiot',
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 2),
                      blurRadius: 6.0)
                ],
              ),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 3.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[300], // set the background color
                        border: Border.all(
                          color: const Color.fromARGB(
                              255, 181, 181, 181), // Border color
                          width: 1.0, // Border width
                        ),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [kBoxShadow],
                      ),
                      child: DropdownButtonHideUnderline(
                        child: PopupMenuButton<String>(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                dropdownValue,
                                style: const TextStyle(
                                  color: Color(0xFF076A89),
                                  fontFamily: 'ProtestRiot',
                                ),
                              ),
                              const Icon(Icons.arrow_downward,
                                  color: Color(0xFF076A89)),
                            ],
                          ),
                          onSelected: (String value) {
                            setState(() {
                              dropdownValue = value;
                            });
                          },
                          itemBuilder: (BuildContext context) {
                            return <String>['NAME', 'EXPERTISE']
                                .map((String value) {
                              return PopupMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                    fontFamily: 'ProtestRiot',
                                    color: Color(0xFF076A89),
                                  ),
                                ),
                              );
                            }).toList();
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        hintText: 'Search Mentors',
                        fillColor: Colors.white,
                        filled: true,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 15.0),
                      ),
                      style: const TextStyle(
                        fontFamily: 'ProtestRiot',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search, color: Colors.black),
                    onPressed: () {
                      searchMentor(_searchController.text);
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: FutureBuilder(
                future: _mentorsFuture, // Use the future variable here
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child:
                            CircularProgressIndicator(color: Color(0xFF0B6E6D),)); // Show loading indicator while waiting
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text(
                            'Error: ${snapshot.error}')); // Show error if any
                  } else {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns
                        crossAxisSpacing: 5, // Space between cards horizontally
                        mainAxisSpacing: 10, // Space between cards vertically
                        childAspectRatio:
                            0.9, // Adjust card size (width / height)
                      ),
                      itemCount: searchResults.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ViewMentor(mentor: searchResults[index]),
                              ),
                            );
                          },
                          child: Card(
                            clipBehavior: Clip
                                .antiAlias, // Ensures the decoration is clipped to the card's shape
                            child: Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [Color(0xff00312e), Color(0xff025d5c)],
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    ClipOval(
                                      child: Image.network(
                                        searchResults[index].profileImage ??
                                            'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png', // Provide a default image URL in case profileImage is null
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Image.network(
                                          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png', // Fallback image URL
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                        height:
                                            8), // Add space between the image and the first text
                                    Text(
                                      searchResults[index].mentorDisplayName, // Display the mentor's full name
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontFamily: 'ProtestRiot',
                                      ),
                                    ),
                                    Text(
                                      searchResults[index].fieldsOfExpertise.join(
                                          ', '), // Display the mentor's expertise as a comma-separated list
                                      textAlign: TextAlign.center, // Center align the text
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontFamily: 'ProtestRiot',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void searchMentor(String query) {
    List<UserDetails> filteredMentors = [];
    if (dropdownValue == 'NAME') {
      filteredMentors = allMentors.where((mentor) {
        return mentor.firstName.toLowerCase().contains(query.toLowerCase()) ||
            mentor.lastName.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else if (dropdownValue == 'EXPERTISE') {
      filteredMentors = allMentors.where((mentor) {
        return mentor.fieldsOfExpertise.any((expertise) =>
            expertise.toLowerCase().contains(query.toLowerCase()));
      }).toList();
    }
    setState(() {
      searchResults = filteredMentors;
    });
  }
}

// class Mentor {
//   final String name;
//   final String expertise;
//   final String imageUrl; // Add imageUrl property

//   Mentor({required this.name, required this.expertise, required this.imageUrl});
// }
