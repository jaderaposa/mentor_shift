import 'package:flutter/material.dart';
// import 'package:mentor_shift/objects/bottomnav.dart';
import 'package:mentor_shift/objects/style/boxshadow.dart';
// import 'package:mentor_shift/objects/style/paddedcontainer.dart';

class MenteeSearch extends StatefulWidget {
  const MenteeSearch({super.key});

  @override
  State<MenteeSearch> createState() => MenteeSearchState();
}

class MenteeSearchState extends State<MenteeSearch> {
  String dropdownValue = 'NAME';

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
                      // handle the button press
                    },
                  ),
                ],
              ),
            ),
          ),
          // Add more widgets to the column here
        ],
      ),
    );
  }
}
