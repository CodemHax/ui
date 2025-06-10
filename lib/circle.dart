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
      width: 120, // Width for better fit
      height: 150, // Match height to parent container
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: backgroundColor ?? Colors.blue[100],
              child: isFontAwesomeIcon(icon)
                ? FaIcon(icon, size: 30, color: Colors.blue[800])
                : Icon(icon, size: 32),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: Theme.of(context).textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to check if icon is a FontAwesome icon
  bool isFontAwesomeIcon(IconData icon) {
    return icon.fontFamily?.startsWith('FontAwesome') ?? false;
  }
}
