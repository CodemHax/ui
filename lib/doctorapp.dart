import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppointmentCard extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final String date;
  final String time;
  final String imageUrl;
  final double width;

  const AppointmentCard({
    Key? key,
    required this.doctorName,
    required this.specialty,
    required this.date,
    required this.time,
    required this.imageUrl,
    this.width = 379,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 190,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(16),
      ),
      child:
      Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  foregroundImage: NetworkImage(imageUrl),
                ),
                Padding(padding: EdgeInsets.all(10),
                    child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctorName,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                          ),
                        ),
                        Text(
                          specialty,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.white
                          ),
                        ),
                      ],
                    )
                ),
                Spacer(flex: 1),
                GestureDetector(
                  onTap: () {
                    Fluttertoast.showToast(
                      msg: "Call Button Clicked",
                      toastLength: Toast.LENGTH_SHORT,
                      backgroundColor: Colors.blue,
                    );
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.call, color: Colors.blue,),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: width > 347 ? 347 : width - 32,
            height: 55,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Color.fromRGBO(0, 0, 190, 1.0),
              borderRadius: BorderRadius.circular(16),
            ),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.all(10),
                  child:
                  Icon(Icons.calendar_month, color: Colors.white,),
                ),
                Padding(padding: EdgeInsets.all(0),
                  child:
                  Text(
                    date,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  height: 24,
                  width: 1,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Padding(padding: EdgeInsets.all(10),
                  child:
                  Icon(Icons.access_time, color: Colors.white,),
                ),
                Padding(padding: EdgeInsets.all(0),
                  child:
                  Text(
                    time,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
