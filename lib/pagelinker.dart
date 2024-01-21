import 'package:flutter/material.dart';
import 'package:gtk_flutter/aiapp.dart';
import 'package:gtk_flutter/alumni.dart';
import 'package:gtk_flutter/home_page.dart';
import 'app_state.dart';
import 'authentication.dart';
import 'alumni.dart';
import 'aiapp.dart';
import 'home_page.dart';
import 'aboutus.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: const Color(0xFFe0fff6), // Set the background color here
          child: Column(
            children: [
              Expanded(
                child: PhotoList(),
              ),
              Container(
                color: const Color(0xFFe0fff6),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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

class PhotoList extends StatelessWidget {
  final List<Map<String, String>> photoData = [
    {'path': 'assets/01.png', 'page': 'Page1'},
    {'path': 'assets/02.png', 'page': 'Page2'},
    {'path': 'assets/03.png', 'page': 'Page3'},
    {'path': 'assets/04.png', 'page': 'Page4'},
    {'path': 'assets/06.png', 'page': 'Page5'},
    {'path': 'assets/05.png', 'page': 'Page6'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: photoData.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: InkWell(
            onTap: () {
              // Get the class name from the data
              String className = photoData[index]['page']!;
              // Navigate to the corresponding page class
              _navigateToPage(context, className);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24.0),
              child: Image.asset(
                photoData[index]['path']!,
                width: 450,
                height: 320,
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
    );
  }

  void _navigateToPage(BuildContext context, String className) {
    switch (className) {
      case 'Page1':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ThirdPage(),
          ),
        );
        break;
      case 'Page2':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(title:'Alumni'),
          ),
        );
        break;
      case 'Page3':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
        break;
      case 'Page4':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
        break;
      case 'Page5':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(title:'Alumni'),
          ),
        );
        break;
      case 'Page6':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
        break;
      default:
        // Handle the default case, maybe navigate to a default page or show an error
        break;
    }
  }
}
/*
class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: const Center(
        child: Text('This is Page 1'),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: const Center(
        child: Text('This is Page 2'),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 3'),
      ),
      body: const Center(
        child: Text('This is Page 3'),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 4'),
      ),
      body: const Center(
        child: Text('This is Page 4'),
      ),
    );
  }
}

class Page5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 5'),
      ),
      body: const Center(
        child: Text('This is Page 5'),
      ),
    );
  }
}

class Page6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 6'),
      ),
      body: const Center(
        child: Text('This is Page 6'),
      ),
    );
  }
}*/
