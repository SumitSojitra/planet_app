import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  Animation? rotateTween;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 6));
    rotateTween =
        Tween<double>(begin: 0, end: pi).animate(animationController!);
    animationController!.repeat(reverse: false);
    animationController!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/gif/aa.gif"), fit: BoxFit.cover),
        ),
        child: ListView.builder(
          itemCount: allData.length,
          itemBuilder: (context, i) => Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                  margin: EdgeInsets.all(10),
                  height: 250,
                  width: 780,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black38,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Transform.rotate(
                          angle: animationController.value * 2 * pi,
                          child: Container(
                            margin: EdgeInsets.all(10),
                            height: 150,
                            width: 160,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(allData[i]['img']),
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(allData[i]['name'],
                              style: GoogleFonts.poppins(
                                  color: Colors.white70, fontSize: 20)),
                          Text('Milkyway Galaxy',
                              style: GoogleFonts.poppins(
                                  color: Colors.white60, fontSize: 10)),
                          SizedBox(
                              width: 50,
                              child: Divider(
                                color: Colors.white,
                                thickness: 1,
                              )),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.location_on,
                                  color: Colors.white70, size: 12),
                              SizedBox(
                                width: 2,
                              ),
                              Text(allData[i]['distance'],
                                  style: GoogleFonts.poppins(
                                      color: Colors.white60, fontSize: 8)),
                            ],
                          ),
                          SizedBox(
                            height: 3,
                          ),
                        ],
                      ),
                      /////////////////////////////////
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
