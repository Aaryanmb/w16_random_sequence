import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: Color(0xFFE0FFF6), // Set app background color
        textTheme: TextTheme(
          bodyText1: TextStyle(fontFamily: 'Poppins'),
          bodyText2: TextStyle(fontFamily: 'Poppins'),
          button: TextStyle(fontFamily: 'Poppins'),
          caption: TextStyle(fontFamily: 'Poppins'),
          headline1: TextStyle(fontFamily: 'Poppins'),
          headline2: TextStyle(fontFamily: 'Poppins'),
          headline3: TextStyle(fontFamily: 'Poppins'),
          headline4: TextStyle(fontFamily: 'Poppins'),
          headline5: TextStyle(fontFamily: 'Poppins'),
          headline6: TextStyle(fontFamily: 'Poppins'),
          overline: TextStyle(fontFamily: 'Poppins'),
          subtitle1: TextStyle(fontFamily: 'Poppins'),
          subtitle2: TextStyle(fontFamily: 'Poppins'),
        ),
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
  final List<String> complaintItems = ['a', 'b', 'c', 'd'];
  final List<String> departmentItems = ['Department A', 'Department B', 'Department C', 'Department D'];
  final List<String> subjectItems = ['Subject V', 'Subject X', 'Subject Y', 'Subject Z'];

  String? selectedComplaintLevel;
  String? selectedDepartment;
  String? selectedSubject;
  String? paragraph;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Stack(
          children: [
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
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButtonFormField2<String>(
                      isExpanded: true,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        filled: true,
                        fillColor: Color(0xFFFAFFFD),
                      ),
                      hint: const Text(
                        'Select Complaint Level',
                        style: TextStyle(fontSize: 14),
                      ),
                      items: complaintItems
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(0, 0, 0, 0.39),
                                  ),
                                ),
                              ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Please select complaint level.';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          selectedComplaintLevel = value;
                        });
                      },
                      onSaved: (value) {
                        selectedComplaintLevel = value.toString();
                      },
                      buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.only(right: 8),
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 24,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField2<String>(
                      isExpanded: true,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        filled: true,
                        fillColor: Color(0xFFFAFFFD),
                      ),
                      hint: const Text(
                        'Select Your Department',
                        style: TextStyle(fontSize: 14),
                      ),
                      items: departmentItems
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(0, 0, 0, 0.39),
                                  ),
                                ),
                              ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Please select department.';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          selectedDepartment = value;
                        });
                      },
                      onSaved: (value) {
                        selectedDepartment = value.toString();
                      },
                      buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.only(right: 8),
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 24,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField2<String>(
                      isExpanded: true,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        filled: true,
                        fillColor: Color(0xFFFAFFFD),
                      ),
                      hint: const Text(
                        'Select Your Subject',
                        style: TextStyle(fontSize: 14),
                      ),
                      items: subjectItems
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(0, 0, 0, 0.39),
                                  ),
                                ),
                              ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Please select subject.';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          selectedSubject = value;
                        });
                      },
                      onSaved: (value) {
                        selectedSubject = value.toString();
                      },
                      buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.only(right: 8),
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 24,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      maxLines: 4,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16),
                        hintText: 'Make your voice heard here...',
                        hintStyle: const TextStyle(fontSize: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        filled: true,
                        fillColor: Color(0xFFFAFFFD),
                      ),
                      onSaved: (value) {
                        paragraph = value;
                      },
                    ),
                    const SizedBox(height: 30),
                    TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // Do something with the selected values
                          print('Complaint Level: $selectedComplaintLevel');
                          print('Department: $selectedDepartment');
                          print('Subject: $selectedSubject');
                          print('Paragraph: $paragraph');
                        }
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFFF09D51),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
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
    
    trackComplaint,
    home,
    alumniConnect,
    incognito,
    aboutUs,
  ];

 
  static const trackComplaint = MenuItem(text: 'Track Complaint', icon: Icons.search);
  static const home = MenuItem(text: 'Home', icon: Icons.home);
  static const alumniConnect = MenuItem(text: 'Alumni Connect', icon: Icons.people);
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
      case MenuItems.aboutUs:
        // Handle about us action
        break;
    }
  }
}
