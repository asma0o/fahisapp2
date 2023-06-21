import 'package:flutter/material.dart';

class horizontal_list extends StatelessWidget {
  final String name;

  horizontal_list({required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: Colors.white,
        ),
        child: Center(
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              // Image(image: AssetImage('assets/images/cars.jpeg')),

              Text(
                name,
                style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
