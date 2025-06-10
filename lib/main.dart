import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ui/circle.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui/doctorapp.dart';
import 'package:ui/hospital_card.dart';
import 'package:ui/service_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doctor Appointment App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var dorpdownValue = 'Select Location';
  var current = 0;
  final double paddingSize = 16.0;
  final List<String> items = [
    'Select Location',
    'New York',
    'Los Angeles',
    'Chicago',
    'Houston',
    'Phoenix',
  ];
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 360;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Location",
                  style: TextStyle(
                    fontSize: isSmallScreen ? 13 : 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.pin_drop,
                      color: Colors.blue,
                      size: 20,
                    ),
                    SizedBox(width: 6),
                    DropdownButton(
                      value: dorpdownValue,
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontSize: isSmallScreen ? 14 : 16,
                      ),
                      underline: Container(
                        height: 0,
                      ),
                      items:
                      items.map((String items){
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          if(newValue == "Select Location") {
                            Fluttertoast.showToast(
                              msg: "Please select a valid location",
                              toastLength: Toast.LENGTH_SHORT,
                              backgroundColor: Colors.red,
                            );
                          }
                          dorpdownValue = newValue!;
                        });
                      },
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            shape: BoxShape.circle,
          ),
          constraints: BoxConstraints(
            maxWidth: 40,
            maxHeight: 40,
          ),
          child: IconButton(
              padding: EdgeInsets.zero,
              iconSize: 20,
              onPressed: () {
                Fluttertoast.showToast(
                    msg: "Yet To Implement",
                    toastLength: Toast.LENGTH_SHORT,
                    backgroundColor: Colors.blue,
                );
              },
              icon: Icon(Icons.notifications, color: Colors.blue[700])
          ),
        )
      ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(4),
                child: SearchBar(
                  hintText: isSmallScreen ? "Search doctors, clinics..." : "Search for doctors, clinics, or hospitals",
                  hintStyle: MaterialStateProperty.all(TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14,
                  )),
                  constraints: BoxConstraints(
                    maxWidth: screenSize.width * 0.95,
                    minHeight: 50,
                  ),
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  leading: Icon(Icons.search, color: Colors.blue),
                  trailing: <Widget>[
                    IconButton(
                      icon: Icon(Icons.mic, color: Colors.blue),
                      onPressed: () {
                        Fluttertoast.showToast(
                          msg: "Voice search coming soon",
                          toastLength: Toast.LENGTH_SHORT,
                          backgroundColor: Colors.blue,
                        );
                      },
                    )
                  ],
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, John",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "How are you feeling today?",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 2),
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/32.jpg"),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text(
                "Health Services",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Container(
              height: 110,
              margin: EdgeInsets.only(bottom: 20),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: paddingSize),
                scrollDirection: Axis.horizontal,
                children: [
                  ServiceCard(
                    color: Colors.blue[100]!,
                    iconColor: Colors.blue[700]!,
                    icon: Icons.favorite,
                    title: "Consultation",
                  ),
                  ServiceCard(
                    color: Colors.green[100]!,
                    iconColor: Colors.green[700]!,
                    icon: Icons.medication,
                    title: "Medicines",
                  ),
                  ServiceCard(
                    color: Colors.orange[100]!,
                    iconColor: Colors.orange[700]!,
                    icon: Icons.local_hospital,
                    title: "Ambulance",
                  ),
                  ServiceCard(
                    color: Colors.purple[100]!,
                    iconColor: Colors.purple[700]!,
                    icon: Icons.science,
                    title: "Lab Tests",
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "Upcoming Appointments",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "3",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Fluttertoast.showToast(
                        msg: "Viewing all appointments",
                        toastLength: Toast.LENGTH_SHORT,
                      );
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: paddingSize),
                scrollDirection: Axis.horizontal,
                children: [
                  AppointmentCard(
                    doctorName: "Dr. Abhishek Kolhe",
                    specialty: "General Physician",
                    date: "Monday, 20th Nov",
                    time: "10:00 AM",
                    imageUrl: "https://randomuser.me/api/portraits/men/36.jpg",
                    width: isSmallScreen ? screenSize.width * 0.85 : 370,
                  ),
                  AppointmentCard(
                    doctorName: "Dr. Sarah Johnson",
                    specialty: "Cardiologist",
                    date: "Tuesday, 21st Nov",
                    time: "2:30 PM",
                    imageUrl: "https://randomuser.me/api/portraits/women/44.jpg",
                    width: isSmallScreen ? screenSize.width * 0.85 : 370,
                  ),
                  AppointmentCard(
                    doctorName: "Dr. James Wilson",
                    specialty: "Neurologist",
                    date: "Friday, 24th Nov",
                    time: "11:15 AM",
                    imageUrl: "https://randomuser.me/api/portraits/men/32.jpg",
                    width: isSmallScreen ? screenSize.width * 0.85 : 370,
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  Text(
                    "Doctor Specialities",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Fluttertoast.showToast(
                        msg: "Viewing all specialties",
                        toastLength: Toast.LENGTH_SHORT,
                      );
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: paddingSize),
                scrollDirection: Axis.horizontal,
                children: const [
                  MyCircleAvatar(icon: FontAwesomeIcons.teeth, name: "Dentist"),
                  MyCircleAvatar(icon: FontAwesomeIcons.heart, name: "Cardiologist"),
                  MyCircleAvatar(icon: FontAwesomeIcons.brain, name: "Neurologist"),
                  MyCircleAvatar(icon: FontAwesomeIcons.bone, name: "Orthopedic"),
                  MyCircleAvatar(icon: FontAwesomeIcons.lungs, name: "Pulmonologist"),
                  MyCircleAvatar(icon: FontAwesomeIcons.eye, name: "Ophthalmologist"),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  Text(
                    "Nearby Hospitals",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Fluttertoast.showToast(
                        msg: "View all hospitals",
                        toastLength: Toast.LENGTH_SHORT,
                      );
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 260,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: paddingSize),
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                children: [
                  HospitalCard(
                    name: "City General Hospital",
                    address: "123 Healthcare Blvd, New York",
                    rating: 4.5,
                    distance: "1.2 km",
                    imageUrl: "https://images.unsplash.com/photo-1586773860418-d37222d8fce3?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80",
                    width: isSmallScreen ? screenSize.width * 0.7 : 300,
                  ),
                  HospitalCard(
                    name: "Mercy Medical Center",
                    address: "456 Wellness Ave, New York",
                    rating: 4.8,
                    distance: "2.4 km",
                    imageUrl: "https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80",
                    width: isSmallScreen ? screenSize.width * 0.7 : 300,
                  ),
                  HospitalCard(
                    name: "St. Luke's Children Hospital",
                    address: "789 Pediatric Way, New York",
                    rating: 4.3,
                    distance: "3.0 km",
                    imageUrl: "https://images.unsplash.com/photo-1538108149393-fbbd81895907?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80",
                    width: isSmallScreen ? screenSize.width * 0.7 : 300,
                  ),
                ],
              ),
            ),
            SizedBox(height: 28),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: NavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          animationDuration: Duration(milliseconds: 400),
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home, color: Colors.blue),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_month_outlined),
              selectedIcon: Icon(Icons.calendar_month, color: Colors.blue),
              label: "Appointments",
            ),
            NavigationDestination(
              icon: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.add, color: Colors.white, size: 28),
              ),
              label: "Book",
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person, color: Colors.blue),
              label: "Profile",
            ),
            NavigationDestination(
              icon: Icon(Icons.chat_outlined),
              selectedIcon: Icon(Icons.chat, color: Colors.blue),
              label: "Messages",
            ),
          ],
          onDestinationSelected: (int newValue) {
            setState(() {
              current = newValue;
              if (newValue == 2) {
                Fluttertoast.showToast(
                  msg: "Book appointment feature coming soon!",
                  toastLength: Toast.LENGTH_SHORT,
                  backgroundColor: Colors.blue,
                );
              }
            });
          },
          selectedIndex: current,
        ),
      ),
    );
  }
}
