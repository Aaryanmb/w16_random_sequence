import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required String title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/aboutus.png'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Your Content Goes Here
          Stack(
            children: [
              // Resunoo Button
              ElevatedButton(
                onPressed: () {
                  // Add functionality for the button
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Image.asset(
                  'assets/resunoo1.jpeg',
                  height: 80,
                  width: 500,
                  fit: BoxFit.fill,
                ),
              ),

              // Positioned DropdownBox
              Positioned(
                top: 20,
                right: 30,
                child: DropdownButton2(
                  customButton: const Icon(
                    Icons.list,
                    size: 46,
                    color: Colors.black,
                  ),
                  items: [
                    ...MenuItems.menuItems.map(
                      (item) => DropdownMenuItem<MenuItem>(
                        value: item,
                        child: MenuItems.buildItem(item),
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    MenuItems.onChanged(context, value! as MenuItem);
                  },
                  dropdownStyleData: DropdownStyleData(
                    width: 200,
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white,
                    ),
                    offset: const Offset(0, 8),
                  ),
                  menuItemStyleData: MenuItemStyleData(
                    customHeights: List<double>.filled(MenuItems.menuItems.length, 48),
                    padding: const EdgeInsets.only(left: 16, right: 16),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MenuItem {
  const MenuItem({
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;
}

abstract class MenuItems {
  static const List<MenuItem> menuItems = [
    postComplaint,
    trackComplaint,
    home,
    alumniConnect,
    incognito,
  ];

  static const postComplaint = MenuItem(text: 'Post Complaint', icon: Icons.edit);
  static const trackComplaint = MenuItem(text: 'Track Complaint', icon: Icons.search);
  static const home = MenuItem(text: 'Home', icon: Icons.home);
  static const alumniConnect = MenuItem(text: 'Alumni Connect', icon: Icons.people);
  static const incognito = MenuItem(text: 'Incognito', icon: Icons.security);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: Colors.black, size: 22),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            item.text,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  static void onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.postComplaint:
        // Handle post complaint action
        break;
      case MenuItems.trackComplaint:
        // Handle track complaint action
        break;
      case MenuItems.home:
        // Handle home action
        break;
      case MenuItems.alumniConnect:
        // Handle alumni connect action
        break;
      case MenuItems.incognito:
        // Handle incognito action
        break;
    }
  }
}
