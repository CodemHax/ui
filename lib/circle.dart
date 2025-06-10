import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyCircleAvatar extends StatelessWidget {
  final IconData icon;
  final String name;
  final double radius;
  final Color? backgroundColor;

  const MyCircleAvatar({
    super.key,
    required this.icon,
    required this.name,
    this.radius = 50,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 120,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: backgroundColor ?? Colors.blue[100],
              child: isFontAwesomeIcon(icon)
                ? FaIcon(icon, size: 24, color: Colors.blue[800])
                : Icon(icon, size: 24),
            ),
            const SizedBox(height: 6),
            Text(
              name,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }

  bool isFontAwesomeIcon(IconData icon) {
    return icon.fontFamily?.startsWith('FontAwesome') ?? false;
  }
}
