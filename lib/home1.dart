
import 'package:flutter/material.dart';

import 'pagelinker.dart';

class Home1 extends StatefulWidget{
  const Home1({super.key});

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        decoration:const BoxDecoration(
          image: DecorationImage(
            image:AssetImage('assets/get_started.png'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 55,
              right: 55,
              bottom: 48,
              height: 55,
              child: Opacity(
                opacity: 0.0, // Adjust the opacity value (0.0 to 1.0)
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>const Page2()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.transparent,
                  ),
                  child:const SizedBox.expand(), // This makes the button invisible
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}