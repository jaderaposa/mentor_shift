import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onBackButtonPress;

  const CustomAppBar({super.key, required this.onBackButtonPress});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
          child: Row(
            children: [
              TextButton(
                onPressed: onBackButtonPress,
                child: const Row(
                  children: <Widget>[
                    Icon(Icons.arrow_back, color: Colors.white),
                    Text(' Back',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'ProtestRiot',
                          fontSize: 17.0,
                        )),
                  ],
                ),
              ),
              // Add more AppBar items here
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40.0);
}
