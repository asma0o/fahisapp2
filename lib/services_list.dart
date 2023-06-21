import 'package:flutter/material.dart';

class services_list extends StatelessWidget {
  final Icon icon;
  final String SrtviceName;

  services_list({required this.SrtviceName, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: Colors.white,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            textDirection: TextDirection.rtl,
            children: [
              Row(
                children: [
                  Text(
                    SrtviceName,
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  icon
                ],
              ),
              Icon(
                Icons.arrow_back,
                // color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
