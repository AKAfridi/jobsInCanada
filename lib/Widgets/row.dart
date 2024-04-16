import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RowWidget extends StatelessWidget {
  RowWidget({super.key, required this.title, required this.icon});
  String title;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 25,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: const TextStyle(
                color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
