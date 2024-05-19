import 'package:flutter/material.dart';
class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  ProfileMenuItem({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey),
      title: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
      onTap: onTap,
    );
  }
}