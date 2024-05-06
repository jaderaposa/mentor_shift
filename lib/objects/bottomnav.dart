import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar(
      {Key? key, required this.currentIndex, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.0,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: onTap as void Function(int)?,
        backgroundColor: const Color(0xFF0B6E6D),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child:
                  Image.asset('images/icons/books.png', width: 30, height: 30),
            ),
            label: 'Mentorships',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Image.asset('images/icons/icon-search.png', width: 30, height: 30),
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Image.asset('images/icons/msg.png', width: 30, height: 30),
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Image.asset('images/icons/profile.png',
                  width: 30, height: 30),
            ),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        selectedLabelStyle:
            const TextStyle(fontFamily: 'ProtestRiot', fontSize: 11.0),
        unselectedLabelStyle:
            const TextStyle(fontFamily: 'ProtestRiot', fontSize: 11.0),
      ),
    );
  }
}
