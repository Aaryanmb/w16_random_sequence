import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required String title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFe0fff6), // Set the background color here
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add functionality for the button
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
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
                Container(
                  height: MediaQuery.of(context).size.height - 200, // Adjust height as needed
                  child: AlumniProfilesList(),
                ),
              ],
            ),
            Positioned(
              top: 30,
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
    
    incognito,
    aboutUs,
  ];

  static const postComplaint = MenuItem(text: 'Post Complaint', icon: Icons.edit);
  static const trackComplaint = MenuItem(text: 'Track Complaint', icon: Icons.search);
  static const home = MenuItem(text: 'Home', icon: Icons.home);
  
  static const incognito = MenuItem(text: 'Incognito', icon: Icons.security);
  static const aboutUs = MenuItem(text: 'About Us', icon: Icons.info);

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
      
      case MenuItems.incognito:
        // Handle incognito action
        break;
      case MenuItems.aboutUs:
        // Handle about us action
        break;
    }
  }
}

class AlumniProfilesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(), // Use ClampingScrollPhysics() to allow scrolling
      itemCount: 10,
      itemBuilder: (context, index) {
        return AlumniProfile(
          name: 'ALUMNI ${index + 1}',
          occupation: 'Software Engineer',
          location: 'City, Country',
          imagePath: 'assets/${index + 1}.png', // Updated image path
        );
      },
    );
  }
}

class AlumniProfile extends StatelessWidget {
  final String name;
  final String occupation;
  final String location;
  final String imagePath;

  const AlumniProfile({
    Key? key,
    required this.name,
    required this.occupation,
    required this.location,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(height: 20),
          Text(
            name,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            occupation,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            location,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[500],
            ),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              // Add functionality for the text button
            },
            child: Text(
              'Text',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFF09D51)),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
