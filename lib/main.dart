import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ui/circle.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui/doctorapp.dart';
import 'package:ui/hospital_card.dart';

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
      appBar: AppBar(
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(left: 06, top: 10),
                  child: Text("Location",
                    style: TextStyle(fontSize: isSmallScreen ? 13 : 15),
                  )
                ),
                Row(
                  children: [
                    Icon(Icons.pin_drop,
                    color: Colors.blue,
                    ),
                    SizedBox(width: 10),
                    DropdownButton(
                      value: dorpdownValue,
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
        IconButton(
            onPressed: () {
              Fluttertoast.showToast(
                  msg: "Yet To Implement",
                  toastLength: Toast.LENGTH_SHORT,
                  backgroundColor: Colors.blue,
              );
            },
            icon: Icon(Icons.notifications)
        )
      ],
      ),
      body:SingleChildScrollView(
        child:
        Column(
          children: [
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: SearchBar(
                hintText: isSmallScreen ? "Search doctors, clinics..." : "Search for doctors, clinics, or hospitals",
                constraints: BoxConstraints(
                  maxWidth: screenSize.width * 0.95,
                  minHeight: 50,
                ),
                elevation: MaterialStateProperty.all(4.0),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                leading: Icon(Icons.search)
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18, top: 30),
                  child: Text(
                    "Upcoming Appointments",
                    style: TextStyle(
                      fontSize: isSmallScreen ? 18 : 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 14, top: 30),
                child:
                    CircleAvatar(
                      radius: 13,
                      backgroundColor: Colors.blue,
                      child: Text("3", style: TextStyle(color: Colors.white, fontSize: 15),),
                    )
                ),
                Spacer(flex: 12),
                Padding(
                  padding: const EdgeInsets.only(right: 18, top: 30),
                  child:
                  Text(
                    "See All",
                    style: TextStyle(fontSize: 15, color: Colors.blue),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18, top: 30),
                  child: Text(
                    "Doctors Specialities",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(flex: 12),
                Padding(
                  padding: const EdgeInsets.only(right: 18, top: 30),
                  child:
                  Text(
                    "See All",
                    style: TextStyle(fontSize: 15, color: Colors.blue),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  MyCircleAvatar(icon: FontAwesomeIcons.teeth, name: "Dentist",),
                  MyCircleAvatar(icon: FontAwesomeIcons.heart, name: "Cardiologist",),
                  MyCircleAvatar(icon: FontAwesomeIcons.brain, name: "Neurologist",),
                  MyCircleAvatar(icon: FontAwesomeIcons.bone, name: "Orthopedic",),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18, top: 30),
                  child: Text(
                    "Nearby Hospitals",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(flex: 12),
                Padding(
                  padding: const EdgeInsets.only(right: 18, top: 30),
                  child:
                  GestureDetector(
                    onTap: () {
                      Fluttertoast.showToast(
                        msg: "View all hospitals",
                        toastLength: Toast.LENGTH_SHORT,
                      );
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(fontSize: 15, color: Colors.blue),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 260,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: paddingSize),
                scrollDirection: Axis.horizontal,
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
            SizedBox(height: isSmallScreen ? 10 : 16),
          ],

        ),
      ) ,
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(
              icon: Icon(Icons.home),
              label: "Home"
          ),
          NavigationDestination(
              icon: Icon(Icons.calendar_month),
              label: "Appointments"
          ),
          NavigationDestination(
              icon: Icon(Icons.person),
              label: "Profile"
          ),
          NavigationDestination(
              icon: Icon(Icons.compass_calibration),
              label: "Explore"
          ),
          NavigationDestination(
              icon: Icon(Icons.message),
              label: "Messages"
          ),
        ],
        onDestinationSelected: (int newValue) {
          setState(() {
             current = newValue;
          });
        },
        selectedIndex: current,
      ),
    );
  }
}
