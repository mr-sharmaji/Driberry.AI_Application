import 'package:drowsiness_detection/helper/SharedPreferencesHelper.dart';
import 'package:drowsiness_detection/screens/Login.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Email Address",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF9E9DA7),
                  ),
                ),
                Text(
                  "rr@gmail.com",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                ),
              ],
            ),
            margin: EdgeInsets.only(left: 40, right: 40, bottom: 2, top: 50),
            height: 76,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(1, 3),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenSize.height * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 36, right: 36),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: () {
                SharedPreferencesHelper().removeLoggedInStatus();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext ctx) => Login(),
                  ),
                );
              },
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFF101097),
                      Color(0xDF101097),
                      Color(0xAF101097),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: const Text(
                    'Sign Out',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
