import 'package:drowsiness_detection/helper/NetworkHelper.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  NetworkHelper _networkHelper = NetworkHelper();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("asset/on-time.png"),
                        Column(
                          children: [
                            Text(
                              "Driver last slept at",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            FutureBuilder(
                              future: _networkHelper.getTimeData(),
                              builder: (context, snapshot) {
                                return Container(
                                  child: Center(
                                    child: snapshot.hasData
                                        ? Text(
                                            snapshot.data[0]['time'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          )
                                        : Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                  ),
                                  margin: EdgeInsets.only(
                                      left: 5, right: 5, bottom: 5, top: 10),
                                  height: screenSize.height * 0.06,
                                  width: screenSize.width * 0.4,
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
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("asset/heart-rate.png"),
                        Column(
                          children: [
                            Text(
                              "Current Heart Rate",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            FutureBuilder(
                              future: _networkHelper.getHeartRateData(),
                              builder: (context, snapshot) {
                                return Container(
                                  child: Center(
                                    child: snapshot.hasData
                                        ? Text(
                                            snapshot.data[0]['heartRate']
                                                .toString()
                                                .substring(0, 5) + " bpm",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          )
                                        : Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                  ),
                                  margin: EdgeInsets.only(
                                      left: 5, right: 5, bottom: 5, top: 10),
                                  height: screenSize.height * 0.06,
                                  width: screenSize.width * 0.4,
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
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            margin: EdgeInsets.only(left: 40, right: 40, bottom: 2, top: 50),
            height: screenSize.height * 0.30,
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
          Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 30, top: 20),
                  child: Text(
                    "Last 10 Sleep Time Records",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20, left: 40, right: 40),
                  child: FutureBuilder(
                    future: _networkHelper.getTimeData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, position) {
                            return Column(
                              children: [
                                Container(
                                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                    child: Text(
                                      snapshot.data[position]['time']
                                          .toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                ),
                                Divider(
                                  thickness: 2,
                                )
                              ],
                            );
                          },
                          itemCount: snapshot.data.length,
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                )
              ],
            ),
            margin: EdgeInsets.only(left: 40, right: 40, bottom: 2, top: 50),
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
          Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 30, top: 20),
                  child: Text(
                    "Last 10 Heart Rate Records",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20, left: 40, right: 40),
                  child: FutureBuilder(
                    future: _networkHelper.getHeartRateData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, position) {
                            return Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  child: Text(
                                    snapshot.data[position]['heartRate']
                                        .toString().substring(0,5) + " bpm",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: 2,
                                )
                              ],
                            );
                          },
                          itemCount: snapshot.data.length,
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                )
              ],
            ),
            margin: EdgeInsets.only(left: 40, right: 40, bottom: 50, top: 50),
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
        ],
      ),
    );
  }
}
