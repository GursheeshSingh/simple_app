import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
//      backgroundColor: Color(0xff686de0),
      body: Center(
        child: Container(
          width: double.infinity,
          child: AvatarGlow(
            startDelay: Duration(milliseconds: 1000),
            glowColor: Colors.red,
            endRadius: 90.0,
            child: Material(
              elevation: 8.0,
              shape: CircleBorder(),
              child: CircleAvatar(
                backgroundColor: Colors.grey[100],
                child: Image.asset(
                  'assets/love.png',
                  height: 60,
                ),
                radius: 40.0,
              ),
            ),
          ),

//          child: AvatarGlow(
//            startDelay: Duration(milliseconds: 1000),
//            endRadius: 100.0,
//            child: Material(
//              elevation: 8.0,
//              shape: CircleBorder(),
//              color: Colors.transparent,
//              child: CircleAvatar(
//                backgroundImage: AssetImage('assets/avatar.png'),
//                radius: 50.0,
//              ),
//            ),
//          ),
        ),
      ),
    );
  }
}
